package com.zjh.e.controller.shop;

import com.zjh.e.pojo.*;
import com.zjh.e.service.BuyService;
import com.zjh.e.service.UserExpandService;
import com.zjh.e.utils.JedisPoolUtil;
import com.zjh.e.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import redis.clients.jedis.Jedis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/7/29.
 */
@Controller
@RequestMapping("/buy")
public class BuyController {

    @Autowired
    private BuyService buyService;
    @Autowired
    private UserExpandService userExpandService;

    @RequestMapping("/buyCommodity")
    @ResponseBody
    public MessageUtils buyCommodity (Integer count,Long orderId, HttpSession session,
                                       Commodity commodity) {
        //orderDatail要包含id和count,commodity包含id,commodityId
        UserBasic userBasic = (UserBasic) session.getAttribute("user");
        String email = userBasic.getEmail();
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setCount(count);
        orderDetail.setId(orderId);
        return buyService.buyCommodity(orderDetail,email,commodity);
    }


    @RequestMapping("/createOrder")
    public String createOrder(Long itemId, Long userId, OrderDetail orderDetail,
                              HttpServletRequest request) {
        String buyNumber = buyService.createOrder(userId,itemId,orderDetail);
        request.setAttribute("buyNumber",buyNumber);
        return "forward:selectOrder";
    }

    @RequestMapping("/selectOrder")
    public ModelAndView selectOrder(ModelAndView modelAndView, HttpSession session,
                                    HttpServletRequest request) {
        Jedis jedis = JedisPoolUtil.getJedisPoolInstance().getResource();
        UserBasic userBasic = (UserBasic) session.getAttribute("user");
        if(userBasic!=null) {
            int money = Integer.parseInt(jedis.get(userBasic.getEmail()));
            userBasic.setMoney(money);
            UserExpand userExpand = userExpandService.queryById(userBasic.getId());
            User user = new User(userBasic,userExpand);
            modelAndView.addObject("User",user);
        }
        String buyNumber = (String) request.getAttribute("buyNumber");
        OrderAndCommodity orderAndCommodity = buyService.selectOrderAndCommodity(buyNumber);
        modelAndView.addObject("orderAndCommodity",orderAndCommodity);
        modelAndView.setViewName("/E-shop/order");
        return modelAndView;
    }
}
