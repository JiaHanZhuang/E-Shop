package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/7.
 * 用户基本信息类
 */
public class UserBasic {

    private Long id;        //索引
    private String userName;       //账号
    private byte isShop;            //是否为商家身份
    private byte member;            //会员等级
    private String password;        //密码
    private long integral;          //积分
    private String email;       //用户邮箱
    private int money;              //用户余额

    public UserBasic() {
    }

    public UserBasic(String userName, byte isShop, byte member, String password, long integral, String email, int money) {
        this.userName = userName;
        this.isShop = isShop;
        this.member = member;
        this.password = password;
        this.integral = integral;
        this.email = email;
        this.money = money;
    }

    public UserBasic(Long id, String userName, byte isShop, byte member, String password, long integral, String email, int money) {
        this.id = id;
        this.userName = userName;
        this.isShop = isShop;
        this.member = member;
        this.password = password;
        this.integral = integral;
        this.email = email;
        this.money = money;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public byte getIsShop() {
        return isShop;
    }

    public void setIsShop(byte isShop) {
        this.isShop = isShop;
    }

    public byte getMember() {
        return member;
    }

    public void setMember(byte member) {
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

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }
}
