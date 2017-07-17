package com.zjh.e.pojo;

import com.zjh.e.validator.Phone;
import org.hibernate.validator.constraints.Range;

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
    private Boolean sex;           //用户性别
    @Phone
    private String phone;        //用户手机号码
    private String name;           //用户姓名
    @Range(min = 0,max = 150,message = "{user.age}")
    private Integer age;              //用户年龄

    public UserExpand() {
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

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
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

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
