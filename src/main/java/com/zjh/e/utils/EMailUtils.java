package com.zjh.e.utils;


import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * Created by 庄家瀚 on 2017/6/11 0011.
 * 邮件工具类
 */
public class EMailUtils {

    private static final String PAN = "1290660512@qq.com";          //主账号邮件，用于发送邮件
    private static final String PASSWORD = "usseircivclgggdi";         //授权码

    /**
     * 发送账号激活成功邮件
     */
    public static void sendAccountActivateEmail(String Email) throws Exception {
        Session session = getSession();
        MimeMessage message = new MimeMessage(session);     //默认为1290660516发出邮件
        session.setDebug(true);
        try {
            message.setFrom(new InternetAddress(PAN));          //InternetAddress表示的邮件地址设置头信息
            message.setSentDate(new Date());                //设置邮件发送时间
            message.setSubject("E-shop激活邮件");
            //设定收件人的邮件地址
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(Email));
            //设置邮件内容
            message.setContent("<h1>账户激活成功啦</h1>", "text/html;charset=UTF-8");
            //发送邮件
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static Session getSession() throws Exception {
        Properties pro = new Properties();
        pro.setProperty("mail.smtp.host", "smtp.qq.com");
        pro.setProperty("mail.smtp.auth", "true");
        //QQ邮箱的SSL加密。
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        pro.put("mail.smtp.ssl.enable", "true");
        pro.put("mail.smtp.ssl.socketFactory", sf);
        Session session = Session.getInstance(pro, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(PAN, PASSWORD);
            }
        });
        return session;
    }

}
