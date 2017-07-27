package com.zjh.e.mapper;

import com.zjh.e.pojo.Commodity;
import com.zjh.e.pojo.ShopCommodity;

import java.util.List;

/**
 * Created by Administrator on 2017/7/27.
 */
public interface ShopCommodityMapper {

    void saveCommodityAndShop(ShopCommodity shopCommodity);

    List<Commodity> selectCommodity (Long userId);
}
