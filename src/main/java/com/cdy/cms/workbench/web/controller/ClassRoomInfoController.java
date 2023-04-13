package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ClassRoomInfoController {
    @Autowired
    private ClassRoomService classRoomService;
    public @ResponseBody Object queryClassRoomById(String id){
        Classroom classroom = classRoomService.queryClassRoomById(id);
        return classroom;
    }
}
