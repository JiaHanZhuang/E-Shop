package com.zjh.e.controller;

import com.zjh.e.pojo.CommodityType;
import com.zjh.e.service.InstallService;
import com.zjh.e.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/7/6.
 */
@Controller
public class InstallController {

    @Autowired
    private InstallService installService;

    @RequestMapping("/install")
    @ResponseBody
    public MessageUtils install() throws Exception {
        try{
            //服装
            installService.save(new CommodityType(1,"服装",0,null));
            installService.save(new CommodityType(2,"女装",1,1));
            installService.save(new CommodityType(3,"男装",1,1));
            installService.save(new CommodityType(4,"童装",1,1));
            //数码电子
            installService.save(new CommodityType(5,"数码电子",0,null));
            installService.save(new CommodityType(6,"日常",1,5));
            installService.save(new CommodityType(7,"娱乐",1,5));
            //电子硬件
            installService.save(new CommodityType(8,"电子硬件",0,null));
            installService.save(new CommodityType(9,"电脑硬件",1,8));
            installService.save(new CommodityType(10,"台式电脑硬件",2,9));
            installService.save(new CommodityType(11,"笔记本电脑硬件",2,9));
            installService.save(new CommodityType(12,"手机硬件",1,8));
            //食物
            installService.save(new CommodityType(13,"食物",0,null));
            installService.save(new CommodityType(14,"补品",1,13));
            installService.save(new CommodityType(15,"蔬菜水果",1,13));
            installService.save(new CommodityType(16,"零食",1,13));
            installService.save(new CommodityType(17,"主食",1,13));
            return new MessageUtils(null,"安装成功");
        }catch (Exception e){
            return new MessageUtils(null,"安装失败");
        }
    }


}
