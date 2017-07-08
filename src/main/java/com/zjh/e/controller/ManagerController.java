package com.zjh.e.controller;

import com.zjh.e.utils.MessageUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

/**
 * Created by Administrator on 2017/7/8.
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {

    @RequestMapping("/uploading")
    @ResponseBody
    public MessageUtils uploadingExcel(MultipartFile excel) throws Exception{
        //接收文件名
        String originalFilename =  excel.getOriginalFilename();
        //判断图片是否为空，或者图片名为空
        if (excel!=null && originalFilename!=null && originalFilename.length() > 0) {
            //文件存储路径
            String excel_path = "D:\\IdeaProject\\E-shop\\src\\main\\webapp\\WEB-INF\\excel\\";
            //生成文件名
            String newFilename = UUID.randomUUID()+originalFilename.substring(originalFilename.indexOf("."));
            //生成文件
            File file = new File(excel_path+newFilename);
            //将文件写进磁盘
            excel.transferTo(file);
        }
        return null;
    }

}
