package com.zjh.e.pojo;

import java.util.List;

/**
 * Created by Administrator on 2017/7/7.
 * 用户订单表
 */
public class UserOrder {

    private User user;
    private List<OrderOrderDetail> orders;

    public UserOrder() {
    }

    public UserOrder(User user, List<OrderOrderDetail> orders) {
        this.user = user;
        this.orders = orders;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderOrderDetail> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderOrderDetail> orders) {
        this.orders = orders;
    }
}
