package com.zjh.e.controller.user;

import com.zjh.e.pojo.User;
import com.zjh.e.pojo.UserBasic;
import com.zjh.e.pojo.UserExpand;
import com.zjh.e.service.UserBasicService;
import com.zjh.e.service.UserExpandService;
import com.zjh.e.utils.EMailUtils;
import com.zjh.e.utils.MD5Util;
import com.zjh.e.utils.MessageUtils;
import com.zjh.e.utils.PhoneUtil;
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
    public MessageUtils passwordByPhone(Long id, HttpSession session) {
        UserExpand userExpand = userExpandService.queryById(id);
        //防止空指针异常
        if (userExpand != null) {
            String phone = userExpand.getPhone();
            //判断用户是否已经填写了手机号码
            if (phone != null) {
                Integer identifyingCode = PhoneUtil.sendNote(phone);
                session.setAttribute("identifyingCode", identifyingCode);
                return new MessageUtils();
            } else {
                return new MessageUtils(null, "未填写手机号码，无法通过手机号码进行密码修改");
            }
        } else {
            return new MessageUtils(null, "无此用户");
        }
    }

    @RequestMapping("/passwordByEmail")
    @ResponseBody
    public MessageUtils passwordByEmail(Long id, HttpSession session) throws Exception {
        UserBasic userBasic = userBasicService.queryById(id);
        //防止空指针
        if(userBasic!=null) {
            //生成验证码
            int mobile_code = (int)((Math.random()*9+1)*100000);
            String content = "您好，您正在使用网站的忘记密码找回操作，本次验证码为：" + mobile_code + ", 请勿泄露。";
            EMailUtils.sendAccountActivateEmail(userBasic.getEmail(),content);
            session.setAttribute("identifyingCode",mobile_code);
            return new MessageUtils();
        } else {
            return new MessageUtils(null,"无此用户");
        }
    }

    @RequestMapping("/checkIdentifyingCode")
    @ResponseBody
    public MessageUtils checkIdentifyingCode(
            @RequestParam(required = true) String identifyingCode,HttpSession session) {
        String code = session.getAttribute("identifyingCode").toString();
        if(identifyingCode.equals(code)) {
            return new MessageUtils("/updatePassword",null);
        } else {
            return new MessageUtils(null,"验证码错误，请重新输入");
        }
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

}
