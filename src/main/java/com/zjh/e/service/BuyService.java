package com.zjh.e.service;

import com.zjh.e.pojo.OrderDetail;
import com.zjh.e.utils.MessageUtils;

/**
 * Created by Administrator on 2017/7/29.
 */
public interface BuyService {

    MessageUtils buyCommodity(Long userId, Long commodityId, OrderDetail orderDetail);

}
