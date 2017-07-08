package com.zjh.e.service;

import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2017/7/8.
 */
public interface BaseService<T> {

    public T queryById(Long id);

    public List<T> queryAll();

    public List<T> queryByKey(T key);

    public Integer queryCount(T key);

    public PageInfo<T> queryListByWhere(T key, Integer page, Integer rows);

    public T queryOne (T key);

    public Integer save(T obj);

    public Integer saveSelect (T obj);

    public Integer update (T obj);

    public Integer updateSelective (T obj);

    public Integer delectById (Long id);

    public Integer delectByIds (Class<T> clazz ,List<Object> values);

}
