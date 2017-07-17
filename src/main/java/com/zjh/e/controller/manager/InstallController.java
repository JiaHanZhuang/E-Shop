package com.zjh.e.controller.manager;

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
@RequestMapping("/install")
public class InstallController {

    @Autowired
    private InstallService installService;

    @RequestMapping("/action")
    @ResponseBody
    public MessageUtils install() throws Exception {
        try{
            //服装
            installService.save(new CommodityType(1,"服装",0,true));
            installService.save(new CommodityType(2,"女装",1,false));
            installService.save(new CommodityType(3,"男装",1,false));
            installService.save(new CommodityType(4,"童装",1,false));
            //数码电子
            installService.save(new CommodityType(5,"数码电子",0,true));
            installService.save(new CommodityType(6,"日常",5,false));
            installService.save(new CommodityType(7,"娱乐",5,false));
            //电子硬件
            installService.save(new CommodityType(8,"电子硬件",0,true));
            installService.save(new CommodityType(9,"电脑硬件",8,true));
            installService.save(new CommodityType(10,"台式电脑硬件",9,false));
            installService.save(new CommodityType(11,"笔记本电脑硬件",9,false));
            installService.save(new CommodityType(12,"手机硬件",8,false));
            //食物
            installService.save(new CommodityType(13,"食物",0,true));
            installService.save(new CommodityType(14,"补品",13,false));
            installService.save(new CommodityType(15,"蔬菜水果",13,false));
            installService.save(new CommodityType(16,"零食",13,false));
            installService.save(new CommodityType(17,"主食",13,false));
            return new MessageUtils(null,"安装成功");
        }catch (Exception e){
            return new MessageUtils(null,"安装失败");
        }
    }


}
