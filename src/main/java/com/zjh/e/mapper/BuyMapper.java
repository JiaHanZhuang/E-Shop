package com.zjh.e.mapper;

import com.zjh.e.pojo.OrderAndCommodity;

/**
 * Created by Administrator on 2017/7/30.
 */
public interface BuyMapper {

    OrderAndCommodity selectOrderAndCommodity(String buyNumber);

    String selectEmailByCommoidtyId(Long itemId);

    Integer selectPriceByCommodityId(Long itemId);
}
