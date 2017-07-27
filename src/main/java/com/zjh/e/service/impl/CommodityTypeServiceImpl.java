package com.zjh.e.service.impl;

import com.zjh.e.mapper.CommodityTypeMapper;
import com.zjh.e.pojo.CommodityType;
import com.zjh.e.service.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Administrator on 2017/7/12.
 */
@Service
public class CommodityTypeServiceImpl extends BaseServiceImpl<CommodityType> implements CommodityTypeService {

    @Autowired
    private CommodityTypeMapper commodityTypeMapper;

    public List<CommodityType> selectByExample( Integer parentId) {
        Example example = new Example(CommodityType.class);
        example.createCriteria().andEqualTo("parentId",parentId);
        return this.commodityTypeMapper.selectByExample(example);
    }

}
