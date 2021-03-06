package com.zjh.e.service;

import com.github.pagehelper.PageInfo;
import com.zjh.e.pojo.Commodity;
import com.zjh.e.pojo.OrderAndCommodity;
import com.zjh.e.pojo.OrderDetail;
import com.zjh.e.utils.MessageUtils;

/**
 * Created by Administrator on 2017/7/29.
 */
public interface BuyService {

    String createOrder(Long userId,Long itemId,OrderDetail orderDetail);

    OrderAndCommodity selectOrderAndCommodity (String buyNumber);

    MessageUtils buyCommodity(OrderDetail orderDetail, String customerEmail, Commodity commodity);

    PageInfo<OrderAndCommodity> selectBill (Long userId,Integer page,Integer rows);

    PageInfo<OrderAndCommodity> selectShopCat(Long userId,Integer page,Integer rows);

    void deleteOrder(Long orderDetailId);
}
