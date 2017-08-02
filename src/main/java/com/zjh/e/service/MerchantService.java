package com.zjh.e.service;

import com.github.pagehelper.PageInfo;
import com.zjh.e.pojo.Activity;
import com.zjh.e.pojo.Commodity;
import com.zjh.e.pojo.CommodityType;
import com.zjh.e.utils.MessageUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2017/7/25.
 */
public interface MerchantService {

    PageInfo<Activity> selectAllActivity (Integer page, Integer rows);

    MessageUtils saveShopActivity(long activityId,long userId);

    MessageUtils saveCommodity(Commodity commodity,HttpSession sessionm,Long userId,HttpServletRequest request);

    Map<String,Object> uploadFile(MultipartFile file, HttpServletRequest request, HttpSession session);

    PageInfo<Commodity> selectCommodity(long id,Integer page,Integer rows);

    MessageUtils updataCommodity(Commodity commodity);

    PageInfo<Commodity> selectComodityAll (Integer page,Integer rows);

    PageInfo<Commodity> selectCommodityByType(String type,Integer page,Integer rows);

    PageInfo<Commodity> selectCommodityByCommodity(Long commodityId,Integer page,Integer rows);

    Commodity selectById(Long id);

}
