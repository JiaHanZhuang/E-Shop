package com.zjh.e.service.impl;

import com.zjh.e.mapper.*;
import com.zjh.e.pojo.*;
import com.zjh.e.service.BuyService;
import com.zjh.e.utils.JedisPoolUtil;
import com.zjh.e.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

import java.util.Date;
import java.util.UUID;

/**
 * Created by Administrator on 2017/7/29.
 */
@Service
public class BuyServiceImpl implements BuyService {

    @Autowired
    private UserBasicMapper userBasicMapper;
    @Autowired
    private CommodityMapper commodityMapper;
    @Autowired
    private ShopCommodityMapper shopCommodityMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Autowired
    private UserOrderMapper userOrderMapper;

    @Override
    public MessageUtils buyCommodity(Long userId, Long commodityId, OrderDetail orderDetail) {
        Jedis jedis = JedisPoolUtil.getJedisPoolInstance().getResource();
        //获取顾客用户信息
        UserBasic customer = userBasicMapper.selectByPrimaryKey(userId);
        //获取商家信息
        Long shopId = shopCommodityMapper.selectShopId(commodityId);
        UserBasic merchant = userBasicMapper.selectByPrimaryKey(shopId);
        //获取商品信息
        Commodity commodity = commodityMapper.selectByPrimaryKey(commodityId);
        //查询redis中用户的余额
        Integer money = Integer.parseInt(jedis.get(customer.getEmail()));
        //查询reids中商品库存
        Integer inventory = Integer.parseInt(jedis.get(commodity.getCommodityId()));
        //开启redis的监控,监控redis中的账户余额与商品库存
        jedis.watch(customer.getEmail());
        jedis.watch(commodity.getCommodityId());
        //计算商品的总价值
        Integer totalPrices = commodity.getPrice() * orderDetail.getCountl();
        //判断余额是否够用
        if (money < totalPrices) {
            //结束监控
            jedis.unwatch();
            return new MessageUtils(null, "余额不足");
        } else if (inventory < 0) {
            jedis.unwatch();
            return new MessageUtils(null,"商品售馨");
        } else {
            //设置订单详情
            orderDetail.setBuyTime(new Date());     //设置购买时间，表示该商品已购买
            orderDetail.setBuyNumber(UUID.randomUUID().toString()); //设置订单id
            orderDetail.setCommodityId(commodityId);       //设置商品id
            //存储
            orderDetailMapper.insert(orderDetail);
            Long orderDatailId = orderDetailMapper.selectOne(orderDetail).getId();
            //设置订单
            Order order = new Order();
            order.setOrderDetailId(orderDatailId);
            order.setUserId(userId);
            //存储
            userOrderMapper.insert(order);
            //减少顾客余额
            jedis.decrBy(customer.getEmail(), totalPrices);
            //增加商家余额
            jedis.incrBy(merchant.getEmail(), totalPrices);
            //减少库存
            jedis.decrBy(commodity.getCommodityId(), 1);
            return new MessageUtils(null,"购买成功");
        }
    }
}
