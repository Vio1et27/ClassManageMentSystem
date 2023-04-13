package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.workbench.service.TeaService;
import com.sun.xml.internal.ws.developer.StreamingAttachment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class TeaController {
    @Autowired
    private TeaService teaService;

    public @ResponseBody Object queryTeacherInfoById(String teacherId){
        Teacher teacher = teaService.queryTeacherInfoById(teacherId);
        return teacher;
    }
}
