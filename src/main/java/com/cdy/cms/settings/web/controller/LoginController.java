package com.cdy.cms.settings.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    /**
     * 因保证安全性，当用户到index界面后又跳转到此controller，在此controller上执行真正的登录业务
     * @return 返回到登录界面,前缀和后缀同样省略
     */
    @RequestMapping("/settings/qx/user/toLogin.do")
    public String toLogin(){
        return "settings/qx/user/login";
    }
}
