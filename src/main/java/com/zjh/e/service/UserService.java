package com.zjh.e.service;

import com.zjh.e.pojo.UserBasic;
import com.zjh.e.pojo.UserExpand;
import com.zjh.e.utils.MessageUtils;

/**
 * Created by Administrator on 2017/7/21.
 */
public interface UserService {

    MessageUtils passwordByPhone(UserExpand userExpand);

    MessageUtils passwordByEmail(UserBasic userBasic);

    MessageUtils checkIdentifyingCode(String identifyingCode);

}
