package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/7.
 * 商家类
 */
public class Shop {

    private Long id;        //店家id
    private Long userId;        //用户id
    private String shopName;        //商家名称

    public Shop() {
    }

    public Shop(Long id, Long userId, String shopName) {
        this.id = id;
        this.userId = userId;
        this.shopName = shopName;
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

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }
}
