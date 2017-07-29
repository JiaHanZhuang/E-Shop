package com.zjh.e.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Administrator on 2017/7/7.
 * 订单类
 */
@Table(name = "user_order")
public class Order {

    private Long userId;    //用户id
    private Long orderDetailId;       //订单明细id
    @Id
    private Long id;            //订单id

    public Order() {
    }

    public Order(Long userId, Long orderDetailId, Long id) {
        this.userId = userId;
        this.orderDetailId = orderDetailId;
        this.id = id;
    }

    public Long getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Long orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
