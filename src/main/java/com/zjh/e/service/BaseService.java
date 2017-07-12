package com.zjh.e.service;

import com.github.pagehelper.PageInfo;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Administrator on 2017/7/8.
 */
public interface BaseService<T> {

    //根据id查询
     T queryById(Long id);
    //查询所用
     List<T> queryAll();
    //条件查询
     List<T> queryByKey(T key);
    //查询记录数
     Integer queryCount(T key);
    //分页
     PageInfo<T> queryListByWhere(T key, Integer page, Integer rows);
    //查询一条记录
     T queryOne (T key);
    //插入
     Integer save(T obj);
    //新增一条非空字段
     Integer saveSelect (T obj);
    //根据主键更新
     Integer update (T obj);
    //根据主键更新非空字段
     Integer updateSelective (T obj);
    //根据主键删除
     Integer delectById (Long id);
    //批量删除
     Integer delectByIds (Class<T> clazz ,List<Object> values);

}
