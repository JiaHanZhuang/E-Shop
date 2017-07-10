package com.zjh.e.pojo;

import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/7.
 * 管理员类
 */
public class Manager {

    @Id
    private int id;
    private String name;
    private String password;

    public Manager() {
    }

    public Manager(int id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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
