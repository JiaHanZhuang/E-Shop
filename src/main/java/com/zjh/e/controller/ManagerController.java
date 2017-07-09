package com.zjh.e.controller;

import com.github.pagehelper.PageInfo;
import com.zjh.e.pojo.Financial;
import com.zjh.e.service.FinancialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Administrator on 2017/7/8.
 */
@Controller
@RequestMapping("/managerModel")
public class ManagerController {

    @Autowired
    private FinancialService financialService;

//    @RequestMapping("/uploading")
//    @ResponseBody
//    public MessageUtils uploadingExcel(MultipartFile excel) throws Exception{
//        //接收文件名
//        String originalFilename =  excel.getOriginalFilename();
//        //判断图片是否为空，或者图片名为空
//        if (excel!=null && originalFilename!=null && originalFilename.length() > 0) {
//            //文件存储路径
//            String excel_path = "D:\\IdeaProject\\E-shop\\src\\main\\webapp\\WEB-INF\\excel\\";
//            //生成文件名
//            String newFilename = UUID.randomUUID()+originalFilename.substring(originalFilename.indexOf("."));
//            //生成文件
//            File file = new File(excel_path+newFilename);
//            //将文件写进磁盘
//            excel.transferTo(file);
//        }
//        return null;
//    }

    @RequestMapping("/financialList")
    public ModelAndView financialList(ModelAndView modelAndView ,
                        @RequestParam(required=false,defaultValue="1") Integer page,
                        @RequestParam(required=false,defaultValue="5") Integer pageSize) {
        PageInfo<Financial> info = financialService.queryListByWhere(null,page,pageSize);
        modelAndView.addObject("financial",info);
        modelAndView.setViewName("manager/manager-financial");
        return modelAndView;
    }


}
