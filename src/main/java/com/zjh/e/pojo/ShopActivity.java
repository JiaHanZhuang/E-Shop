package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/25.
 */
public class ShopActivity {

    private Long id ;       //表id
    private Long activityId;    //活动id
    private Long shopId;        //商家用户的id

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getActivityId() {
        return activityId;
    }

    public void setActivityId(Long activityId) {
        this.activityId = activityId;
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }
}
