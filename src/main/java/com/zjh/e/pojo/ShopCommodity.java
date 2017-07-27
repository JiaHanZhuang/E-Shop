package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/27.
 */
public class ShopCommodity {

    private Long id;
    private Long shopId;
    private Long commodityId;

    public ShopCommodity() {
    }

    public ShopCommodity(Long shopId, Long commodityId) {
        this.shopId = shopId;
        this.commodityId = commodityId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public Long getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Long commodityId) {
        this.commodityId = commodityId;
    }
}
