package com.zjh.e.pojo;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/7.
 * 商品类
 */
public class Commodity {

    @Id
    private Long id;        //商品id
    private String color;       //商品颜色
    private String type;        //商品类型
    private String detail;      //商品描述
    private String path;        //图片路径
    private Integer price;          //商品价格
    private Integer inventory;      //库存
    @Column(name = "is_putaway")
    private Boolean putaway;     //是否上架

    public Commodity() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Boolean getPutaway() {
        return putaway;
    }

    public void setPutaway(Boolean putaway) {
        this.putaway = putaway;
    }
}
