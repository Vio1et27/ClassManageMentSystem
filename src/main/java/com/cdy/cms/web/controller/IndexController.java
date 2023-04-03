package com.cdy.cms.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    /**
     * 当用户访问登录界面，执行此controller
     * @return 跳转到WEB-INF下的login.jsp前缀在配置文件中已省略
     */
    @RequestMapping("/")
    public String toIndex(){
        return "index";
    }
}
