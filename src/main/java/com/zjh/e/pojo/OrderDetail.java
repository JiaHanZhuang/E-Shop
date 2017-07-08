package com.zjh.e.pojo;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/7.
 * 订单明细类
 */
public class OrderDetail {

    private Long id;        //索引
    private Date buyTime;       //购买时间
    private String buyNumber;      //订单号
    private Long commodityId;      //商品id
    private Long addressId;         //地址id

    public OrderDetail() {
    }

    public OrderDetail(Long id, Date buyTime, String buyNumber, Long commodityId, Long addressId) {
        this.id = id;
        this.buyTime = buyTime;
        this.buyNumber = buyNumber;
        this.commodityId = commodityId;
        this.addressId = addressId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

    public String getBuyNumber() {
        return buyNumber;
    }

    public void setBuyNumber(String buyNumber) {
        this.buyNumber = buyNumber;
    }

    public Long getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Long commodityId) {
        this.commodityId = commodityId;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }
}
