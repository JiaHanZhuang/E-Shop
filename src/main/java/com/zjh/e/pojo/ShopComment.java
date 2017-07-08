package com.zjh.e.pojo;

import java.util.List;

/**
 * Created by Administrator on 2017/7/7.
 */
public class ShopComment {

    private Shop shop;
    private List<Comment> comments;

    public ShopComment() {
    }

    public ShopComment(Shop shop, List<Comment> comments) {
        this.shop = shop;
        this.comments = comments;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
