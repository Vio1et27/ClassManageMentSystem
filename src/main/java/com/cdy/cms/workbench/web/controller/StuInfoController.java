package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.workbench.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class StuInfoController {
    @Autowired
    private StuService stuService;

    /**
     * 显示学生信息
     * @param session
     * @return
     */
    @RequestMapping("/workbench/ShowInfo/queryStudentInfoById.do")
    public @ResponseBody Object queryStudentInfoById(HttpSession session){
        Student student = stuService.queryStudentById
                (((Student)session.getAttribute(Contants.SESSION_STUDENT)).getStudentId());
        return student;
    }

    @RequestMapping("/workbench/ShowInfo/toStuInfo.do")
    public String toStuInfo(){
        return "workbench/ShowInfo/StuInfo";
    }
}
