package com.zjh.e.pojo;

import org.hibernate.validator.constraints.Email;

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
    private Boolean shop;            //是否为商家身份
    private Integer member;            //会员等级
    private String password;        //密码
    private Long integral;          //积分
    @Email(message = "{user.email}")
    private String email;       //用户邮箱
    private Integer money;              //用户余额

    public UserBasic() {
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

    public Boolean getShop() {
        return shop;
    }

    public void setShop(Boolean shop) {
        this.shop = shop;
    }

    public Integer getMember() {
        return member;
    }

    public void setMember(Integer member) {
        this.member = member;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getIntegral() {
        return integral;
    }

    public void setIntegral(Long integral) {
        this.integral = integral;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }
}
