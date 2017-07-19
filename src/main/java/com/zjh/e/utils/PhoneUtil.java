package com.zjh.e.utils;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.io.IOException;

/**
 * Created by Administrator on 2017/7/18.
 * 手机短信工具类
 */
public class PhoneUtil {

    private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

    public static Integer sendNote(String phone){
        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(Url);

        client.getParams().setContentCharset("GBK");
        method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");

        int mobile_code = (int)((Math.random()*9+1)*100000);

        String content = "您好，您正在使用网站的忘记密码找回操作，本次验证码为：" + mobile_code + ", 请勿泄露。";
        NameValuePair[] data = {//提交短信
                new NameValuePair("account", "C94368917"), //查看用户名请登录用户中心->验证码、通知短信->帐户及签名设置->APIID
                new NameValuePair("password", "e6f20564c16332ade27b797e4ef72187"),  //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
                //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
                new NameValuePair("mobile", phone),
                new NameValuePair("content", content),
        };
        method.setRequestBody(data);
        System.out.print(content);
        try {
            client.executeMethod(method);

            String SubmitResult =method.getResponseBodyAsString();

            //System.out.println(SubmitResult);

            Document doc = DocumentHelper.parseText(SubmitResult);
            Element root = doc.getRootElement();

            String code = root.elementText("code");
            String msg = root.elementText("msg");
            String smsid = root.elementText("smsid");

            System.out.println(code);
            System.out.println(msg);
            System.out.println(smsid);
            if("2".equals(code)){
                System.out.println("短信提交成功");
            }

        } catch (HttpException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (DocumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return mobile_code;
    }

}
