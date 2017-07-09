package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/7.
 * 商品商家关联类
 */
public class CommodityShop {

    private Commodity commodity;
    private Shop shop;

    public CommodityShop() {
    }

    public CommodityShop(Commodity commodity, Shop shop) {
        this.commodity = commodity;
        this.shop = shop;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }
}
