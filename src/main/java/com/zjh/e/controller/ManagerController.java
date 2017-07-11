package com.zjh.e.controller;

import com.github.pagehelper.PageInfo;
import com.zjh.e.pojo.Activity;
import com.zjh.e.pojo.Financial;
import com.zjh.e.service.ActivityService;
import com.zjh.e.service.FinancialService;
import com.zjh.e.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/7/8.
 */
@Controller
@RequestMapping("/managerModel")
public class ManagerController {

    @Autowired
    private FinancialService financialService;
    @Autowired
    private ActivityService activityService;

    /**
     * 导入
      * @param excel       excel文件
     */
    @RequestMapping("/uploading")
    public String uploadingExcel(MultipartFile excel){
        //接收文件名
        String originalFilename =  excel.getOriginalFilename();
        //判断文件是否为空
        if (excel!=null && originalFilename!=null && originalFilename.length() > 0){
            //判断是否为excel文件
            if(originalFilename.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
                financialService.importExcel(excel);
            }
        }
        return "redirect:/managerModel/financialList";
    }

    /**
     * 导出
     * @param response
     * @throws Exception
     */
    @RequestMapping("/download")
    public void exportExcel(HttpServletResponse response) throws Exception {
        response.setContentType("application/x-excel");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("财务情况.xls".getBytes(), "ISO-8859-1"));
        ServletOutputStream outputStream = response.getOutputStream();
        financialService.exportExcel(outputStream);
        if (outputStream!=null) {
            outputStream.close();
        }
    }


    @RequestMapping("/financialList")
    public ModelAndView financialList(ModelAndView modelAndView ,
                        @RequestParam(required=false,defaultValue="1") Integer page,
                        @RequestParam(required=false,defaultValue="5") Integer pageSize) {
        PageInfo<Financial> info = financialService.queryListByWhere(null,page,pageSize);
        modelAndView.addObject("financial",info);
        modelAndView.setViewName("manager/manager-financial");
        return modelAndView;
    }

    @RequestMapping("/Activity")
    public String insertActionActivity(){
        return "manager/manager-InsertActivity";
    }

    @RequestMapping("/insertActivity")
    @ResponseBody
    public MessageUtils insertActivity(Activity activity) {
        activity.setDeadline(false);    //设置活动为未过期
        activityService.save(activity);
        return new MessageUtils("managerModel/selectActivity",null);
    }

    @RequestMapping("/selectActivity")
    public ModelAndView selectActivity(ModelAndView modelAndView,
                            @RequestParam(required=false,defaultValue="1")Integer page,
                            @RequestParam(required=false,defaultValue="5") Integer pageSize) {
        PageInfo<Activity> activities = activityService.queryListByWhere(null,page,pageSize);
        modelAndView.addObject("activities",activities);
        modelAndView.setViewName("manager/manager-activity");
        return modelAndView;
    }

    @RequestMapping("/creatQRCode")
    public ModelAndView creatQRCode(ModelAndView modelAndView, HttpSession session) {
        String path = activityService.creatQRCode(session);
        session.setAttribute("QR",path);
        modelAndView.setViewName("manager/manager-QR");
        return modelAndView;
    }

    @RequestMapping("/endActivity")
    public String endActivity(@RequestParam(required = true) Long id) {
        Activity activity = activityService.queryById(id);
        activity.setDeadline(true);         //设为活动过期
        activityService.update(activity);
        return "redirect:/managerModel/selectActivity";
    }

}
