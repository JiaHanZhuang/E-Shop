package com.zjh.e.service;

import com.zjh.e.pojo.Activity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/7/10.
 */
public interface ActivityService extends BaseService<Activity> {

    String creatQRCode(HttpSession session);

}
