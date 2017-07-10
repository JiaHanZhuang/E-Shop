package com.zjh.e.pojo;

import javax.persistence.Column;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/7.
 * 用户信息拓展类
 * id：关联UserBasic的id，一对一
 */
public class UserExpand {

    @Id
    private Long id;        //外键索引
    private Date birthday;      //用户出生年月
    @Column(name="is_sex")
    private boolean sex;           //用户性别
    private String phone;        //用户手机号码
    private String name;           //用户姓名
    private int args;              //用户年龄

    public UserExpand() {
    }

    public UserExpand(Long id, Date birthday, boolean sex, String phone, String name, int args) {
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

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
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
