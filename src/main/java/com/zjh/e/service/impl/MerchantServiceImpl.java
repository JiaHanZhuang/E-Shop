package com.zjh.e.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.e.mapper.*;
import com.zjh.e.pojo.*;
import com.zjh.e.service.MerchantService;
import com.zjh.e.utils.FtpUtil;
import com.zjh.e.utils.MessageUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2017/7/25.
 */
@Service
public class MerchantServiceImpl implements MerchantService {

    @Autowired
    private ActivityMapper activityMapper;
    @Autowired
    private ShopActivityMapper shopActivityMapper;
    @Autowired
    private CommodityTypeMapper commodityTypeMapper;
    @Autowired
    private CommodityMapper commodityMapper;
    @Autowired
    private ShopCommodityMapper shopCommodityMapper;

    @Value("${FTP_ADDRESS}")
    private String FTP_ADDRESS;
    @Value("${FTP_PASSWORD}")
    private String FTP_PASSWORD;
    @Value("${FTP_PORT}")
    private Integer FTP_PORT;
    @Value("${FTP_USERNAME}")
    private String FTP_USERNAME;

    private static final String PATH = "D:\\IdeaProject\\E-shop\\target\\E-shop\\images\\";
    private static final String LINUXPATH = "D:/IdeaProject/E-shop/target/E-shop/images/";

    @Override
    public PageInfo<Activity> selectAllActivity(Integer page, Integer rows) {
        PageHelper.startPage(page, rows);
        List<Activity> activities = activityMapper.selectAll();
        return new PageInfo<Activity>(activities);
    }

    @Override
    public MessageUtils saveShopActivity(long activityId, long userId) {
        ShopActivity shopActivity = new ShopActivity();
        shopActivity.setActivityId(activityId);
        shopActivity.setShopId(userId);
        ShopActivity s = shopActivityMapper.selectShopActivity(shopActivity);
        if (s != null) {
            return new MessageUtils(null, "此活动你已参加");
        } else {
            shopActivityMapper.saveShopActivity(shopActivity);
        }
        return new MessageUtils(null, "参加成功");
    }


    @Override
    public MessageUtils saveCommodity(Commodity commodity, HttpSession session, Long userId) {
        //1,把图片上传到ftp
        UserBasic userBasic = (UserBasic) session.getAttribute("user");
        //获取文件
        File file = new File(PATH + userBasic.getEmail());
        //判断文件是否存在
        if (file.exists()) {
            //获取文件中所有的文件名
            File[] files = file.listFiles();
            //连接服务器
            FtpUtil ftpUtil = new FtpUtil(FTP_ADDRESS, FTP_PORT, FTP_USERNAME, FTP_PASSWORD);
            //判断是否连接成功
            if (ftpUtil.open()) {
                //本地储存路径
                String path = LINUXPATH + userBasic.getEmail() + "/";
                //依次重定义文件名并上传
                //用于记录文件名
                String[] fileNames = new String[files.length];
                for (int i = 0; i < files.length; i++) {
                    String fileName = UUID.randomUUID() + files[i].getName().substring(files[i].getName().indexOf("."));
                    fileNames[i] = fileName;
                    ftpUtil.upload(path + files[i].getName(), fileName, null);
                }
//            //定义服务器的文件夹名
//            String serverFile = UUID.randomUUID().toString();
//            //上传
//            ftpUtil.upload(path,userBasic.getEmail(),serverFile);
                //2,把ftp的路径存入commodity类
                //将ftp指定目录下的所有图片名字读取，并组成String存入数据库
                StringBuffer sb = new StringBuffer();
                for (int i = 0; i < files.length; i++) {
                    sb.append(fileNames[i]).append(",");
                }
                commodity.setPath(sb.toString());
                //3,把图片删除
                for (int i = 0; i < files.length; i++) {
                    files[i].delete();
                }
                file.delete();

                //4,将commodity所有的信息存入数据库
                commodityMapper.insertSelective(commodity);
                //5,建立商家用户和商品的关系
                //5.1,查询id
                Long commodityId = commodityMapper.selectOne(commodity).getId();
                //5.2,建立对象
                ShopCommodity shopCommodity = new ShopCommodity(userId, commodityId);
                //5.3,存储
                shopCommodityMapper.saveCommodityAndShop(shopCommodity);
                //6,返回地址
                return new MessageUtils("/merchant/merchantBackground", null);
            }
            return new MessageUtils(null, "连接服服务器失败，图片无法上传");
        }
        return new MessageUtils(null, "还未上传图片");
    }

    @Override
    public Map<String, Object> uploadFile(MultipartFile file, HttpServletRequest request, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        String uuidName = null;
        UserBasic userBasic = (UserBasic) session.getAttribute("user");
        try {
            //得到这个文件的uuidname
            uuidName = file.getOriginalFilename();
            //真实路径
            String roolPath = request.getSession().getServletContext().getRealPath("/");
            //储存路径
            String path = PATH + userBasic.getEmail();
            File file1 = new File(path);
            if (!file1.exists()) {
                file1.mkdirs();
            }
            //得到文件的输入流
            InputStream in = new BufferedInputStream(file.getInputStream());
            //获得文件的输出流
            OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(path, uuidName)));

            IOUtils.copy(in, out);
            in.close();
            out.close();

            map.put("state", "SUCCESS");// UEDITOR的规则:不为SUCCESS则显示state的内容
            map.put("url", userBasic.getEmail() + "\\" + uuidName);         //能访问到你现在图片的路径
            map.put("title", "");
            map.put("original", "realName");
        } catch (IOException e) {

            map.put("state", "文件上传失败啦!"); //在此处写上错误提示信息，这样当错误的时候就会显示此信息
            map.put("url", "");
            map.put("title", "");
            map.put("original", "");
            e.printStackTrace();

        }
        return map;
    }

    @Override
    public PageInfo<Commodity> selectCommodity(long id, Integer page, Integer rows) {
        List<Commodity> commodities = shopCommodityMapper.selectCommodity(id);
        PageHelper.startPage(page, rows);
        return new PageInfo<Commodity>(commodities);
    }

    @Override
    public MessageUtils updataCommodity(Commodity commodity) {
        commodityMapper.updateByPrimaryKeySelective(commodity);
        return new MessageUtils(null, "修改成功");
    }

    //下面是我的两个方法，取的uuidname防止文件同名问题
    private String getExtName(String s, char split) {
        int i = s.lastIndexOf(split);
        int leg = s.length();
        return i > 0 ? (i + 1) == leg ? " " : s.substring(i + 1, s.length()) : " ";
    }

    private String getUUIDFileName(String fileName) {
        UUID uuid = UUID.randomUUID();
        StringBuilder sb = new StringBuilder(100);
        sb.append(uuid.toString()).append(".").append(this.getExtName(fileName, '.'));
        return sb.toString();
    }
}
