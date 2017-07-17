package com.zjh.e.pojo;

import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/7.
 * 管理员类
 */
public class Manager {

    @Id
    private Integer id;
    private String name;
    private String password;

    public Manager() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
