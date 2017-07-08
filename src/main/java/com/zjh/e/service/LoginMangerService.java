package com.zjh.e.service;

import com.zjh.e.mapper.ManagerMapper;
import com.zjh.e.pojo.Manager;
import com.zjh.e.pojo.UserBasic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/7/7.
 */
@Service
public class LoginMangerService extends BaseService<Manager> {

    @Autowired
    private ManagerMapper managerMapper;

    public Manager login (Manager manager) {
        return managerMapper.login(manager);
    }

}
