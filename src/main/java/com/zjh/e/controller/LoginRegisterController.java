package com.zjh.e.controller;

import com.zjh.e.pojo.Manager;
import com.zjh.e.service.LoginMangerService;
import com.zjh.e.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/7/7.
 */
@Controller
@RequestMapping("/login")
public class LoginRegisterController {

    @Autowired
    private LoginMangerService loginMangerService;


    @RequestMapping("/skip")
    public String tiaozhuang () {
        return "manager/manager-login";
    }

    @RequestMapping("/logincheckManager")
    @ResponseBody
    public MessageUtils login(Manager manager, HttpSession session) {
        Manager m = loginMangerService.login(manager);
        session.setAttribute("manager",m);
        if (m!=null) {
            return new MessageUtils("login/managerIndex","成功");
        } else {
            session.removeAttribute("manager");
            return new MessageUtils(null,null);
        }
    }
    @RequestMapping("/managerIndex")
    public String managerIndex() {
        return "manager/manager-index";
    }

}
