package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/30.
 */
public class OrderAndCommodity {

    private OrderDetail orderDetail;
    private Commodity commodity;
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }
}
