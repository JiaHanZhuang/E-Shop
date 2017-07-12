package com.zjh.e.service;

import com.zjh.e.pojo.CommodityType;

import java.util.List;

/**
 * Created by Administrator on 2017/7/12.
 */
public interface CommodityTypeService extends BaseService<CommodityType> {

     List<CommodityType> selectByExample(long parentId);

}
