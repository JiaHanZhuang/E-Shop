package com.zjh.e.pojo;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/7.
 * 用户信息拓展类
 * id：关联UserBasic的id，一对一
 */
public class UserExpand {

    private Long id;        //外键索引
    private Date birthday;      //用户出生年月
    private byte sex;           //用户性别
    private String phone;        //用户手机号码
    private String name;           //用户姓名
    private int args;              //用户年龄

    public UserExpand() {
    }

    public UserExpand(Long id, Date birthday, byte sex, String phone, String name, int args) {
        this.id = id;
        this.birthday = birthday;
        this.sex = sex;
        this.phone = phone;
        this.name = name;
        this.args = args;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public byte getSex() {
        return sex;
    }

    public void setSex(byte sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getArgs() {
        return args;
    }

    public void setArgs(int args) {
        this.args = args;
    }
}
