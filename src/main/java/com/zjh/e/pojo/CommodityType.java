package com.zjh.e.pojo;

import javax.persistence.Id;

/**
 * Created by Administrator on 2017/7/6.
 * 商品类型类
 */
public class CommodityType {

    @Id
    private int typeId;     //id
    private String typeName;        //商品类型名称
    private int directoryLevel;     //商品目录等级
    private Integer lastDirectory;      //上一级目录

    public CommodityType(int typeId, String typeName, int directoryLevel, Integer lastDirectory) {
        this.typeId = typeId;
        this.typeName = typeName;
        this.directoryLevel = directoryLevel;
        this.lastDirectory = lastDirectory;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getDirectoryLevel() {
        return directoryLevel;
    }

    public void setDirectoryLevel(int directoryLevel) {
        this.directoryLevel = directoryLevel;
    }

    public Integer getLastDirectory() {
        return lastDirectory;
    }

    public void setLastDirectory(Integer lastDirectory) {
        this.lastDirectory = lastDirectory;
    }
}
