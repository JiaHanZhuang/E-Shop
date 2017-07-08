package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/7.
 */
public class OrderOrderDetail {

    private Order order;
    private OrderDetail detail;

    public OrderOrderDetail() {
    }

    public OrderOrderDetail(Order order, OrderDetail detail) {
        this.order = order;
        this.detail = detail;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public OrderDetail getDetail() {
        return detail;
    }

    public void setDetail(OrderDetail detail) {
        this.detail = detail;
    }
}
