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
    @Autowired
    private BuyMapper buyMapper;

//    public String buyCommodity(Long userId, Long commodityId, OrderDetail orderDetail) {
//        Jedis jedis = JedisPoolUtil.getJedisPoolInstance().getResource();
//        //获取顾客用户信息
//        UserBasic customer = userBasicMapper.selectByPrimaryKey(userId);
//        //获取商家信息
//        Long shopId = shopCommodityMapper.selectShopId(commodityId);
//        UserBasic merchant = userBasicMapper.selectByPrimaryKey(shopId);
//        //获取商品信息
//        Commodity commodity = commodityMapper.selectByPrimaryKey(commodityId);
//        //查询redis中用户的余额
//        Integer money = Integer.parseInt(jedis.get(customer.getEmail()));
//        //查询reids中商品库存
//        Integer inventory = Integer.parseInt(jedis.get(commodity.getCommodityId()));
//        //开启redis的监控,监控redis中的账户余额与商品库存
//        jedis.watch(customer.getEmail());
//        jedis.watch(commodity.getCommodityId());
//        //计算商品的总价值
//        Integer totalPrices = commodity.getPrice() * orderDetail.getCount();
//        //判断余额是否够用
//        if (money < totalPrices) {
//            //结束监控
//            jedis.unwatch();
//            return null;
//        } else if (inventory < 0) {
//            jedis.unwatch();
//            return null;
//        } else {
//            //设置订单详情
//            orderDetail.setBuyTime(new Date());     //设置购买时间，表示该商品已购买
//            orderDetail.setBuyNumber(UUID.randomUUID().toString()); //设置订单id
//            orderDetail.setCommodityId(commodityId);       //设置商品id
//            //存储
//            orderDetailMapper.insert(orderDetail);
//            Long orderDatailId = orderDetailMapper.selectOne(orderDetail).getId();
//            //设置订单
//            Order order = new Order();
//            order.setOrderDetailId(orderDatailId);
//            order.setUserId(userId);
//            //存储
//            userOrderMapper.insert(order);
//            //减少顾客余额
//            jedis.decrBy(customer.getEmail(), totalPrices);
//            //增加商家余额
//            jedis.incrBy(merchant.getEmail(), totalPrices);
//            //减少库存
//            jedis.decrBy(commodity.getCommodityId(), 1);
//            return "success";
//        }
//    }


    @Override
    public String createOrder(Long userId, Long itemId, OrderDetail orderDetail) {
        String buyNumber = UUID.randomUUID().toString();
        orderDetail.setBuyNumber(buyNumber); //设置订单id
        orderDetail.setCommodityId(itemId);       //设置商品id
        //存储
        orderDetailMapper.insert(orderDetail);
        Long orderDatailId = orderDetailMapper.selectOne(orderDetail).getId();
        //设置订单
        Order order = new Order();
        order.setOrderDetailId(orderDatailId);
        order.setUserId(userId);
        //存储
        userOrderMapper.insert(order);
        return buyNumber;
    }

    public OrderAndCommodity selectOrderAndCommodity (String buyNumber) {
        return buyMapper.selectOrderAndCommodity(buyNumber);
    }

    @Override
    public MessageUtils buyCommodity(OrderDetail orderDetail, String customerEmail, Commodity commodity) {
        Jedis jedis = JedisPoolUtil.getJedisPoolInstance().getResource();
        //获取顾客余额
        int customerMoney = Integer.parseInt(jedis.get(customerEmail));
        //获取商家的邮箱账号
        String merchantEmail = buyMapper.selectEmailByCommoidtyId(commodity.getId());
        //获取商品的单价
        int price = buyMapper.selectPriceByCommodityId(commodity.getId());
        //获取商品的库存
        int inventory = Integer.parseInt(jedis.get(commodity.getCommodityId()));
        //开启redis的监控,监控redis中的账户余额与商品库存
        jedis.watch(customerEmail);
        jedis.watch(merchantEmail);
        jedis.watch(commodity.getCommodityId());
        //计算商品的总价值
        int count = orderDetail.getCount();
        int totalPrices = price * count ;
        if(count > inventory) {
            //结束监控
            jedis.unwatch();
            return new MessageUtils(null,"商品库存不足，请等待商家补充货源");
        } else if(inventory < 0) {
            //结束监控
            jedis.unwatch();
            return new MessageUtils(null,"商品售馨");
        } else if(customerMoney < totalPrices) {
            //结束监控
            jedis.unwatch();
            return new MessageUtils(null,"余额不足，请充值后再购买");
        } else {
            //更新订单信息
            orderDetail.setBuyTime(new Date());     //以有无购买时间为订单是否已支付的标志
            orderDetailMapper.updateByPrimaryKeySelective(orderDetail);
            //减少顾客余额
            jedis.decrBy(customerEmail, totalPrices);
            //增加商家余额
            jedis.incrBy(merchantEmail, totalPrices);
            //减少库存
            jedis.decrBy(commodity.getCommodityId(), count);
            return new MessageUtils("/homePage","购买成功");
        }
    }

}
