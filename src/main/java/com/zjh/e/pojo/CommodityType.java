package com.zjh.e.pojo;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/6.
 * 商品类型类
 */
public class CommodityType {

    @Id
    private int Id;                 //id
    private String typeName;        //商品类型名称
    private int parentId;           //父目录id
    @Column(name="is_parent")
    private boolean parent;         //是否为父目录

    public CommodityType() {
    }

    public CommodityType(int id, String typeName, int parentId, boolean parent) {
        Id = id;
        this.typeName = typeName;
        this.parentId = parentId;
        this.parent = parent;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public boolean isParent() {
        return parent;
    }

    public void setParent(boolean parent) {
        this.parent = parent;
    }
}
