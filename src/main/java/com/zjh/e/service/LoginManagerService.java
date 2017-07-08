package com.zjh.e.service;

import com.zjh.e.pojo.Manager;

import javax.jnlp.BasicService;

/**
 * Created by Administrator on 2017/7/8.
 */
public interface LoginManagerService extends BaseService<Manager>{

    Manager login(Manager manager);

    void updatePassword(Manager manager);

}
