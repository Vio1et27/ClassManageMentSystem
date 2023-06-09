package com.cdy.cms.settings.interceptor;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 放置拦截器，防止用户在不登录情况下通过controller任意跳转到别的界面
 *
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        /*HttpSession session = httpServletRequest.getSession();
        if ((Teacher)session.getAttribute(Contants.SESSION_TEACHER) == null) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath());
            return false;
        }else if((Student)session.getAttribute(Contants.SESSION_STUDENT) == null){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath());
            return false;
        }*/
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
