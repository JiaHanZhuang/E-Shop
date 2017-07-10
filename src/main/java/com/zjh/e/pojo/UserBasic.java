package com.zjh.e.pojo;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/7.
 * 用户基本信息类
 */
public class UserBasic {

    @Id
    private Long id;        //索引
    private String userName;       //账号
    @Column(name = "is_shop")
    private boolean shop;            //是否为商家身份
    private int member;            //会员等级
    private String password;        //密码
    private long integral;          //积分
    private String email;       //用户邮箱
    private int money;              //用户余额

    public UserBasic() {
    }

    public UserBasic(Long id, String userName, boolean shop, int member, String password, long integral, String email, int money) {
        this.id = id;
        this.userName = userName;
        this.shop = shop;
        this.member = member;
        this.password = password;
        this.integral = integral;
        this.email = email;
        this.money = money;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getMember() {
        return member;
    }

    public void setMember(int member) {
        this.member = member;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getIntegral() {
        return integral;
    }

    public void setIntegral(long integral) {
        this.integral = integral;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public boolean isShop() {
        return shop;
    }

    public void setShop(boolean shop) {
        this.shop = shop;
    }
}
