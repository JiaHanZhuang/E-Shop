package com.zjh.e.service.impl;

import com.zjh.e.pojo.Activity;
import com.zjh.e.service.ActivityService;
import com.zjh.e.utils.QRCodeUtil;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;


/**
 * Created by Administrator on 2017/7/10.
 */
@Service
public class ActivityServiceImpl extends BaseServiceImpl<Activity> implements ActivityService {

    public String creatQRCode(HttpSession session){
        String path = (String)session.getAttribute("QR");        //获取session中的二维码地址
        if(path!=null && !("".equals(path))){      //判断session存在与否
            File file = new File(QRCodeUtil.PATH+path);
            if(file.exists()) {             //判断文件路径是否存在
                return path;          //存在返回此路径
            }
        }
        return QRCodeUtil.creatQRCode();        //不存在，重新生成
    }

}
