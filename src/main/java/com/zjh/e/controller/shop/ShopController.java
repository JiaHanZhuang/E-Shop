package com.zjh.e.controller.shop;

import com.github.pagehelper.PageInfo;
import com.zjh.e.pojo.Commodity;
import com.zjh.e.service.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Administrator on 2017/7/28.
 */
@Controller
public class ShopController {

    @Autowired
    private MerchantService merchantService;


    @RequestMapping("/shopping")
    public ModelAndView browseCommodity(ModelAndView modelAndView,
                                        @RequestParam(required = true) String type,
                                        @RequestParam(defaultValue = "1", required = false) Integer page,
                                        @RequestParam(defaultValue = "8", required = false) Integer rows) {
        PageInfo<Commodity> pageInfo = merchantService.selectCommodityByType(type,page,rows);
        modelAndView.addObject("commodities",pageInfo);
        modelAndView.addObject("type",type);
        modelAndView.setViewName("E-shop/shopping");
        return modelAndView;
    }

    @RequestMapping("/map")
    public String map() {
        return "/E-shop/map";
    }

    @RequestMapping("/single")
    public ModelAndView single (ModelAndView modelAndView,Long id,
                                @RequestParam(defaultValue = "1" ,required = false)Integer page,
                                @RequestParam(defaultValue = "6",required = false)Integer rows) {
        Commodity commodity = merchantService.selectById(id);
        String type = commodity.getType();
        PageInfo<Commodity> pageInfo = merchantService.selectCommodityByType(type,page,rows);
        PageInfo<Commodity> commodities = merchantService.selectCommodityByCommodity(id,page,rows);
        modelAndView.addObject("commoditySingle",commodity);
        modelAndView.addObject("commodityType",pageInfo);
        modelAndView.addObject("commodities",commodities);
        modelAndView.setViewName("/E-shop/shopping_single");
        return modelAndView;
    }

    @RequestMapping("/selectByKeyWorld")
    public ModelAndView selectCommodityByLucene(ModelAndView modelAndView,String keyWorld,
                                                @RequestParam(defaultValue = "1" ,required = false)Integer page,
                                                @RequestParam(defaultValue = "6",required = false)Integer rows) {
        List<Commodity> commodities = merchantService.selectCommodityByLucene(keyWorld,page,rows);
        modelAndView.addObject("commodities",commodities);
        modelAndView.setViewName("/E-shop/lucene");
        return modelAndView;
    }

}
