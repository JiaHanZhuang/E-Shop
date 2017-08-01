package com.zjh.e.controller.shop;

import com.zjh.e.pojo.OrderDetail;
import com.zjh.e.pojo.UserBasic;
import com.zjh.e.service.BuyService;
import com.zjh.e.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/8/1.
 */
@RequestMapping("/shoppingCart")
@Controller
public class ShopCatController {

    @Autowired
    private BuyService buyService;

    @RequestMapping("/add")
    @ResponseBody
    public MessageUtils addShopCat(Long itemId, HttpSession session) {
        OrderDetail orderDetail = new OrderDetail();
        UserBasic userBasic= (UserBasic) session.getAttribute("user");
        Long userId = userBasic.getId();
        String buyNumber = buyService.createOrder(userId,itemId,orderDetail);
        if(buyNumber!=null) {
            return new MessageUtils(null,"添加成功");
        } else {
            return new MessageUtils(null,"添加失败");
        }
    }

}
