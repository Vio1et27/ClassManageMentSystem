package com.cdy.cms.workbench.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
