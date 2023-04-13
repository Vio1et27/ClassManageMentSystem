package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.workbench.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StuController {
    @Autowired
    private StuService stuService;

    @RequestMapping("/workbench/ShowInfo/queryStudentInfoById.do")
    public @ResponseBody Object queryStudentInfoById(String studentId){
        Student student = stuService.queryStudentById(studentId);
        return  student;
    }
}
