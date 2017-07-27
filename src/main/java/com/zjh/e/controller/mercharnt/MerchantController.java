package com.zjh.e.controller.mercharnt;

import com.github.pagehelper.PageInfo;
import com.zjh.e.pojo.Activity;
import com.zjh.e.pojo.Commodity;
import com.zjh.e.pojo.CommodityType;
import com.zjh.e.service.CommodityTypeService;
import com.zjh.e.service.MerchantService;
import com.zjh.e.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2017/7/25.
 */
@Controller
@RequestMapping("/merchant")
public class MerchantController {

    @Autowired
    private MerchantService merchantService;
    @Autowired
    private CommodityTypeService commodityTypeService;

    @RequestMapping("/merchantBackground")
    public ModelAndView merchantBackground (ModelAndView modelAndView,
                                            @RequestParam(required=false,defaultValue="1")Integer page,
                                            @RequestParam(required=false,defaultValue="5") Integer pageSize) {
        PageInfo<Activity> pageInfo = merchantService.selectAllActivity(page,pageSize);
        modelAndView.addObject("activities",pageInfo);
        modelAndView.setViewName("merchant/merchant_index");
        return modelAndView;
    }

    @RequestMapping("/joinActivity")
    @ResponseBody
    public MessageUtils joinActivity(long activityId,long userId) {
        return merchantService.saveShopActivity(activityId,userId);
    }

    @RequestMapping("/addCommodityAction")
    public ModelAndView addCommodityAction(ModelAndView modelAndView,
                                     @RequestParam(defaultValue = "0",required = true) Integer parentId) {
        List<CommodityType> typeList = commodityTypeService.selectByExample(parentId);
        modelAndView.addObject("typeList",typeList);
        modelAndView.setViewName("merchant/merchant_insert_shop");
        return modelAndView;
    }

    @RequestMapping("/secondCommodity")
    @ResponseBody
    public List<CommodityType> secondCommodity(@RequestParam(required = true) Integer parentId) {
        List<CommodityType> typeList = commodityTypeService.selectByExample(parentId);
        return typeList;
    }

    @RequestMapping(value="/upload",method = RequestMethod.POST,produces = "application/json")
    @ResponseBody
    public Map<String,Object> uploadFile(@RequestParam(value = "upfile", required = false) MultipartFile file,
                                         HttpServletRequest request, HttpSession session) {
        return merchantService.uploadFile(file,request,session);
    }

    @RequestMapping("/addCommodity")
    @ResponseBody
    public MessageUtils addCommodity(Commodity commodity,HttpSession session,Long userId) {
        return merchantService.saveCommodity(commodity,session,userId);
    }

    @RequestMapping("/selectMerchantStock")
    public ModelAndView selectMerchantStock(ModelAndView modelAndView,long id,
                                 @RequestParam(defaultValue="0",required = false)Integer page,
                                 @RequestParam(defaultValue = "5",required = false)Integer rows) {
        PageInfo<Commodity> pageInfo = merchantService.selectCommodity(id,page,rows);
        modelAndView.addObject("commoditys",pageInfo);
        modelAndView.setViewName("/merchant/merchant_stock");
        return modelAndView;
    }

    @RequestMapping("/updataCommodity")
    @ResponseBody
    public MessageUtils updataCommodity(Commodity commodity) {
        return merchantService.updataCommodity(commodity);
    }

    @RequestMapping("/selectMerchantPutaway")
    @ResponseBody
    public ModelAndView selectMerchantPutaway(ModelAndView modelAndView,long id,
                                              @RequestParam(defaultValue="0",required = false)Integer page,
                                              @RequestParam(defaultValue = "5",required = false)Integer rows) {
        PageInfo<Commodity> pageInfo = merchantService.selectCommodity(id,page,rows);
        modelAndView.addObject("commoditys",pageInfo);
        modelAndView.setViewName("/merchant/merchant_putaway");
        return modelAndView;
    }

}
