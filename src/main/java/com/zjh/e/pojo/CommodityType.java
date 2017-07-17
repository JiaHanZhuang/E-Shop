package com.zjh.e.pojo;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/6.
 * 商品类型类
 */
public class CommodityType {

    @Id
    private Integer Id;                 //id
    private String typeName;        //商品类型名称
    private Integer parentId;           //父目录id
    @Column(name="is_parent")
    private Boolean parent;         //是否为父目录

    public CommodityType(Integer id, String typeName, Integer parentId, Boolean parent) {
        Id = id;
        this.typeName = typeName;
        this.parentId = parentId;
        this.parent = parent;
    }

    public CommodityType() {
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Boolean getParent() {
        return parent;
    }

    public void setParent(Boolean parent) {
        this.parent = parent;
    }
}
