package com.zjh.e.pojo;

import javax.persistence.Id;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/7.
 * 订单明细类
 */
public class OrderDetail {

    @Id
    private Long id;        //索引
    private Date buyTime;       //购买时间
    private String buyNumber;      //订单号
    private Long commodityId;      //商品id
    private Integer count;         //购买数量
    private String size;            //购买的大小

    public OrderDetail() {
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
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

}
