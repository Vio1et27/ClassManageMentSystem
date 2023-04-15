package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.workbench.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class TeaInfoController {
    @Autowired
    private TeaService teaService;

    /**
     * 显示教师信息
     * @param session
     * @return
     */
    @RequestMapping("/workbench/ShowInfo/queryTeacherInfoById.do")
    public @ResponseBody Object queryTeacherInfoById(HttpSession session){
        Teacher teacher = teaService.queryTeacherInfoById
                (((Teacher)session.getAttribute(Contants.SESSION_TEACHER)).getTeacherId());
        return teacher;
    }
}
