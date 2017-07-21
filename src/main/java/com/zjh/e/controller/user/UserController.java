package com.zjh.e.controller.user;

import com.zjh.e.pojo.User;
import com.zjh.e.pojo.UserBasic;
import com.zjh.e.pojo.UserExpand;
import com.zjh.e.service.UserBasicService;
import com.zjh.e.service.UserExpandService;
import com.zjh.e.service.UserService;
import com.zjh.e.utils.*;
import org.hibernate.validator.constraints.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/7/17.
 * 用户控制器
 */
@Controller
public class UserController {

    @Autowired
    private UserBasicService userBasicService;
    @Autowired
    private UserExpandService userExpandService;
    @Autowired
    private UserService userService;

    @RequestMapping("/information")
    public ModelAndView selectUser(@RequestParam(required = true) Long id,
                                   ModelAndView modelAndView) {
        User user = new User();
        user.setUserBasic(userBasicService.queryById(id));
        user.setUserExpand(userExpandService.queryById(id));
        modelAndView.addObject("User", user);
        modelAndView.setViewName("E-shop/information");
        return modelAndView;
    }

    @RequestMapping("/checkPassword")
    @ResponseBody
    public MessageUtils checkPassword(
            @RequestParam(value = "old_password") String password, Long id) {
        String oldPassword = userBasicService.queryById(id).getPassword();
        password = MD5Util.getMd5(password);
        if (password.equals(oldPassword)) {
            return new MessageUtils("/updatePassword", null);
        } else {
            return new MessageUtils(null, "原密码错误");
        }
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(UserBasic userBasic, HttpSession session) throws Exception {
        String password = MD5Util.getMd5(userBasic.getPassword());
        userBasic.setPassword(password);
        userBasicService.updateSelective(userBasic);
        EMailUtils.sendAccountActivateEmail(userBasic.getEmail(), "您得密码被修改了");
        session.removeAttribute("user");
        return "redirect:/homePage";
    }

    @RequestMapping("/passwordAction")
    public String passwordAction() {
        return "E-shop/update_password";
    }

    @RequestMapping("/passwordByPhone")
    @ResponseBody
    public MessageUtils passwordByPhone(Long id) {
        UserExpand userExpand = userExpandService.queryById(id);
        return userService.passwordByPhone(userExpand);
    }

    @RequestMapping("/passwordByEmail")
    @ResponseBody
    public MessageUtils passwordByEmail(Long id) throws Exception {
        UserBasic userBasic = userBasicService.queryById(id);
        return userService.passwordByEmail(userBasic);
    }

    @RequestMapping("/checkIdentifyingCode")
    @ResponseBody
    public MessageUtils checkIdentifyingCode(
            @RequestParam(required = true) String identifyingCode,HttpSession session) {
        return userService.checkIdentifyingCode(identifyingCode);
    }

    @RequestMapping("/updateBySelectUser")
    public ModelAndView selectUserByUpdate (@RequestParam(required = true) Long id,
                                            ModelAndView modelAndView) {
        User user = new User();
        user.setUserBasic(userBasicService.queryById(id));
        user.setUserExpand(userExpandService.queryById(id));
        modelAndView.addObject("User", user);
        modelAndView.setViewName("E-shop/update_information");
        return modelAndView;
    }


    @RequestMapping("/updateInformation")
    public String updateInformation(UserExpand userExpand) {
        userExpandService.updateSelective(userExpand);
        Long id = userExpand.getId();
        return "redirect:/information?id="+id;
    }

    @RequestMapping("/pay")
    public String pay(UserBasic userBasic) {
        userBasicService.updateSelective(userBasic);
        Long id = userBasic.getId();
        return "redirect:/information?id="+id;
    }

}
