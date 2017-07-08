package com.zjh.e.service.impl;


import com.zjh.e.mapper.ManagerMapper;
import com.zjh.e.pojo.Manager;
import com.zjh.e.service.LoginManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/7/7.
 */
@Service
public class LoginManagerServiceImpl extends BaseServiceImpl<Manager> implements LoginManagerService {

    @Autowired
    private ManagerMapper managerMapper;



    public Manager login (Manager manager) {
        return managerMapper.login(manager);
    }

    public void updatePassword(Manager manager){
        this.managerMapper.updatePassword(manager);
    }

}
