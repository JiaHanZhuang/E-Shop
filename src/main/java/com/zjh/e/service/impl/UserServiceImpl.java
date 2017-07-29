package com.zjh.e.service.impl;

import com.zjh.e.pojo.UserBasic;
import com.zjh.e.pojo.UserExpand;
import com.zjh.e.service.UserService;
import com.zjh.e.utils.EMailUtils;
import com.zjh.e.utils.JedisPoolUtil;
import com.zjh.e.utils.MessageUtils;
import com.zjh.e.utils.PhoneUtil;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * Created by Administrator on 2017/7/21.
 */
@Service
public class UserServiceImpl implements UserService {
    @Override
    public MessageUtils passwordByPhone(UserExpand userExpand) {
        //防止空指针异常
        if (userExpand != null) {
            String phone = userExpand.getPhone();
            //判断用户是否已经填写了手机号码
            if (phone != null) {
                Integer identifyingCode = PhoneUtil.sendNote(phone);
                Jedis jedis=JedisPoolUtil.getJedisPoolInstance().getResource();
                //将验证码存进redis，验证码两分钟后过期
                jedis.setex("identifyingCode",120,identifyingCode.toString());
                return new MessageUtils();
            } else {
                return new MessageUtils(null, "未填写手机号码，无法通过手机号码进行密码修改");
            }
        } else {
            return new MessageUtils(null, "无此用户");
        }
    }

    @Override
    public MessageUtils passwordByEmail(UserBasic userBasic) {
        //防止空指针
        if(userBasic!=null) {
            //生成验证码
            Integer mobile_code = (int)((Math.random()*9+1)*100000);
            Jedis jedis=JedisPoolUtil.getJedisPoolInstance().getResource();
            //将验证码存进redis，验证码两分钟后过期
            jedis.setex("identifyingCode",120,mobile_code.toString());
            String content = "您好，您正在使用网站的忘记密码找回操作，本次验证码为：" + mobile_code + ", 请勿泄露。";
            try {
                EMailUtils.sendAccountActivateEmail(userBasic.getEmail(),content);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new MessageUtils();
        } else {
            return new MessageUtils(null,"无此用户");
        }
    }

    @Override
    public MessageUtils checkIdentifyingCode(String identifyingCode) {
        Jedis jedis=JedisPoolUtil.getJedisPoolInstance().getResource();
        //判断验证码是否已过期
        if(jedis.ttl("identifyingCode")>0){
            String code = jedis.get("identifyingCode");
            if(identifyingCode.equals(code)) {
                return new MessageUtils("/updatePassword",null);
            } else {
                return new MessageUtils(null,"验证码错误，请重新输入");
            }
        } else {
            return new MessageUtils(null,"验证码已过期");
        }
    }



}
