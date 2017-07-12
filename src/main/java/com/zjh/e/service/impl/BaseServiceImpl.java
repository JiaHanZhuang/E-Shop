package com.zjh.e.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.e.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Administrator on 2017/7/6.
 */
public abstract class BaseServiceImpl<T> implements BaseService<T>{

    @Autowired
    private Mapper<T> mapper;

    //根据id查询
    public T queryById(Long id) {
        return this.mapper.selectByPrimaryKey(id);
    }

    //查询所用
    public List<T> queryAll() {
        return this.mapper.selectAll();
    }

    //条件查询
    public List<T> queryByKey(T key) {
        return this.mapper.select(key);
    }

    //查询记录数
    public Integer queryCount(T key) {
        return this.mapper.selectCount(key);
    }

    //分页
    public PageInfo<T> queryListByWhere(T key, Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        List<T> list = this.mapper.select(key);
        return new PageInfo<T>(list);
    }

    //查询一条记录
    public T queryOne (T key) {
        return this.mapper.selectOne(key);
    }

    //插入
    public Integer save(T obj) {
        return this.mapper.insert(obj);
    }

    //新增一条非空字段
    public Integer saveSelect (T obj) {
        return this.mapper.insertSelective(obj);
    }

    //根据主键更新
    public Integer update (T obj) {
        return this.mapper.updateByPrimaryKey(obj);
    }

    //根据主键更新非空字段
    public Integer updateSelective (T obj) {
        return this.mapper.updateByPrimaryKeySelective(obj);
    }

    //根据主键删除
    public Integer delectById (Long id) {
        return this.mapper.deleteByPrimaryKey(id);
    }

    //批量删除
    public Integer delectByIds (Class<T> clazz ,List<Object> values) {
        Example example = new Example(clazz);
        example.createCriteria().andIn("id",values);
        return this.mapper.deleteByExample(example);
    }

}
