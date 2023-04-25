package com.cdy.cms.workbench.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {
    @RequestMapping("/settings/qx/Login/toStuMain.do")
    public String toStuMain(){
        return "workbench/main/StuMain";
    }

    @RequestMapping("/settings/qx/Login/toTeaMain.do")
    public String toTeaMain(){
        return "workbench/main/TeaMain";
    }
    @RequestMapping("/workbench/ShowInfo/logOutMainForStu.do")
    public String logOutMainForStu(HttpServletResponse response, HttpSession session,SessionStatus sessionStatus){
        Cookie c1 = new Cookie("studentNumber", null);
        Cookie c2 = new Cookie("loginPwdForStu", null);
        c1.setMaxAge(0);
        c2.setMaxAge(0);
        c1.setPath("/");
        c2.setPath("/");
        response.addCookie(c1);
        response.addCookie(c2);
        session.invalidate();
        sessionStatus.setComplete();
        return "redirect:/";
    }
    @RequestMapping("/workbench/ShowInfo/logOutMainForTea.do")
    public String logOutMainForTea(HttpServletResponse response,HttpSession session,SessionStatus sessionStatus){
        Cookie c1 = new Cookie("teacherJobNumber", null);
        Cookie c2 = new Cookie("loginPwdForTea", null);
        c1.setMaxAge(0);
        c2.setMaxAge(0);
        c1.setPath("/");
        c2.setPath("/");
        response.addCookie(c1);
        response.addCookie(c2);
        session.invalidate();
        sessionStatus.setComplete();
        return "redirect:/";
    }
}
