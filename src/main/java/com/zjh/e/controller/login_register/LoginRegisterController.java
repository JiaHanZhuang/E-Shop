package com.zjh.e.controller.login_register;

import com.zjh.e.pojo.User;
import com.zjh.e.pojo.UserBasic;
import com.zjh.e.pojo.UserExpand;
import com.zjh.e.service.UserBasicService;
import com.zjh.e.service.UserExpandService;
import com.zjh.e.utils.EMailUtils;
import com.zjh.e.utils.MD5Util;
import com.zjh.e.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/7/15.
 * 登录注册跳转
 */
@Controller
public class LoginRegisterController {

    @Autowired
    private UserBasicService userBasicService;
    @Autowired
    private UserExpandService userExpandService;

    @RequestMapping("/register")
    public String register() {
        return "login_register/register";
    }

    @RequestMapping("/homePage")
    public String success() {
        return "E-shop/homePage";
    }

    @RequestMapping("/creatUser")
    @ResponseBody
        public MessageUtils creatUserName(UserExpand userExpand,
                                      @Validated UserBasic userBasic, BindingResult bindingResult)
            throws Exception {
        MessageUtils messageUtils = new MessageUtils();
        //确认是否有错误信息
        MessageUtils message = allErrrorToString(bindingResult);
        //有错误信息,返回错误信息
        if(message!=null){
            return message;
        }
        //默认昵称
        userBasic.setUserName("e友");
        //将密码加密
        userBasic.setPassword(MD5Util.getMd5(userBasic.getPassword()));
        userBasicService.saveSelect(userBasic);
        //获取刚插入数据的user_bsic表的id
        long id = userBasicService.queryOne(userBasic).getId();
        //关联两张表
        userExpand.setId(id);
        userExpandService.saveSelect(userExpand);
        //发送账户已激活通知邮件
        EMailUtils.sendAccountActivateEmail(userBasic.getEmail(),"恭喜你已激活了E-shop账号");
        messageUtils.setUrl("/homePage");
        return messageUtils;
    }

    @RequestMapping("/checkRegisterInformation")
    @ResponseBody
    public MessageUtils checkRegisterInformation(UserBasic userBasic,
                                                 @Validated UserExpand userExpand, BindingResult bindingResult) {
        MessageUtils messageUtils = new MessageUtils();
        //判断用户是否已经输入手机号码
        if (userExpand.getPhone() != null || !("".equals(userExpand.getPhone()))) {
            //确认是否有错误信息
            MessageUtils message = allErrrorToString(bindingResult);
            //有错误信息,返回错误信息
            if(message!=null){
                return message;
            }
            //将手机号码作为一个条件
            UserExpand userExpand1 = new UserExpand();
            userExpand1.setPhone(userExpand.getPhone());
            //查询是否此号码已被注册
            if (userExpandService.queryOne(userExpand1) != null) {
                messageUtils.setMessage("此手机号码已被注册");
                return messageUtils;
            }
        }
        //将邮箱作为一个条件
        UserBasic userBasic1 = new UserBasic();
        userBasic1.setEmail(userBasic.getEmail());
        //判断邮箱是否已被注册
        if (userBasicService.queryOne(userBasic1) != null) {
            messageUtils.setMessage("此邮箱已被注册");
        } else {
            messageUtils.setUrl("/creatUser");
        }
        return messageUtils;
    }

    @RequestMapping("/login")
    @ResponseBody
    public MessageUtils login(UserBasic userBasic, HttpSession session) {
        MessageUtils messageUtils = new MessageUtils();
        //将前台发来的密码进行Md5加密
        String MD5password = MD5Util.getMd5(userBasic.getPassword());
        //将密码从实体中取出，进行账号的查询
        userBasic.setPassword(null);
        //按密码和邮箱进行用户搜索
        UserBasic user = userBasicService.queryOne(userBasic);
        //判断是否有此用户
        if(user==null){
            //此邮箱账号不存在
            messageUtils.setMessage("此账号不存在");
            return messageUtils;
        } else {
            //进行密码的判断
            if(user.getPassword().equals(MD5password)){
                //存在此邮箱账号，且密码不错误，返回前台给url
                messageUtils.setUrl("/homePage");
                //将用户存进session
                session.setAttribute("user",user);
                return messageUtils;
            } else {
                //密码错误
                messageUtils.setMessage("密码错误");
                return messageUtils;
            }
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/homePage";
    }

    private MessageUtils allErrrorToString(BindingResult bindingResult){
        MessageUtils messageUtils = new MessageUtils();
        //判断是否有错误信息
        if (bindingResult.hasErrors()) {
            StringBuffer sb = new StringBuffer();
            //获取错误信息
            List<ObjectError> errors = bindingResult.getAllErrors();
            for(ObjectError objectError:errors){
                sb.append(",").append(objectError.getDefaultMessage());
            }
            messageUtils.setMessage(sb.toString());
            return messageUtils;
        }
        return  null;
    }
}
