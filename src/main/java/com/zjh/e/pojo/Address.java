package com.zjh.e.pojo;

import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/7.
 * 地址类
 */
public class Address {

    @Id
    private Long id;        //索引
    private Long userId;       //用户id
    private String address;     //地址

    public Address() {
    }

    public Address(Long id, Long userId, String address) {
        this.id = id;
        this.userId = userId;
        this.address = address;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
