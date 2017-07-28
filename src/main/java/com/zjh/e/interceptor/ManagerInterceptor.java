package com.zjh.e.interceptor;

import com.zjh.e.pojo.Manager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/7/28.
 */
public class ManagerInterceptor implements HandlerInterceptor {

    @Value("${THIRD_RESTRICT}")
    private String THIRD_RESTRICT;
    @Value("${FOUR_RESTRICT}")
    private String FOUR_RESTRICT;
    @Value("${FIFTH_RESTRICT}")
    private String FIFTH_RESTRICT;
    @Value("${PUBILC_ADDRESS_FIRST}")
    private String firstPublicAddress;
    @Value("${PUBLIC_ADDRESS_SECOND}")
    private String secondPublicAddress;
    @Value("${PUBLIC_ADDRESS_THIRD}")
    private String thirdPublicAddress;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //获取请求的url
        String url = httpServletRequest.getRequestURI();
        //判断session
        HttpSession session = httpServletRequest.getSession();
        if (url.indexOf(firstPublicAddress) >= 0 || url.indexOf(secondPublicAddress) >= 0 || url.indexOf(thirdPublicAddress) >= 0) {
            return true;
        }

        if (url.indexOf(THIRD_RESTRICT) >= 0 || url.indexOf(FOUR_RESTRICT) >= 0 || url.indexOf(FIFTH_RESTRICT) >= 0) {
            Manager manager = (Manager) session.getAttribute("manager");
            if (manager != null) {
                return true;
            } else {
                //执行这里表示用户身份需要认证，跳转登陆页面
                httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/manager/manager-login.jsp").forward(httpServletRequest, httpServletResponse);
                return false;
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
