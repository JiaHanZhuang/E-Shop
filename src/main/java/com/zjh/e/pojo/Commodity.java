package com.zjh.e.pojo;

/**
 * Created by Administrator on 2017/7/7.
 * 商品类
 */
public class Commodity {

    private Long id;        //商品id
    private String color;       //商品颜色
    private String type;        //商品类型
    private String detail;      //商品描述
    private String path;        //图片路径
    private int price;          //商品价格

    public Commodity() {
    }

    public Commodity(Long id, String color, String type, String detail, String path, int price) {
        this.id = id;
        this.color = color;
        this.type = type;
        this.detail = detail;
        this.path = path;
        this.price = price;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
