package com.zjh.e.interceptor;

import com.zjh.e.pojo.UserBasic;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/7/27.
 */
@ImportResource("classpath:interceptor.properties")
public class LoginInterceptor implements HandlerInterceptor {

    @Value("${FIRST_RESTRICT}")
    private String FIRST_RESTRICT;
    @Value("${SECOND_RESTRICT}")
    private String SECOND_RESTRICT;


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //获取请求的url
        String url = httpServletRequest.getRequestURI();
        //判断session
        HttpSession session  = httpServletRequest.getSession();
        if(url.indexOf(FIRST_RESTRICT)>=0 || url.indexOf(SECOND_RESTRICT)>=0) {
            //获取user
            UserBasic userBasic = (UserBasic) session.getAttribute("user");
            //判断是否已登录
            if(userBasic==null) {
                //执行这里表示用户身份需要认证，跳转登陆页面
                httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/E-shop/login.jsp").forward(httpServletRequest, httpServletResponse);
                return false;
            } else {
                return true;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}
