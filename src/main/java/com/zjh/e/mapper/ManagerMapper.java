package com.zjh.e.mapper;

import com.zjh.e.pojo.Manager;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by Administrator on 2017/7/7.
 */

public interface ManagerMapper extends Mapper<Manager> {

    Manager login(Manager manager);

    void updatePassword(Manager manager);

}
