package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class ClassRoomInfoForTeaController {
    @Autowired
    private ClassRoomService classRoomService;
    @RequestMapping("/workbench/ShowInfo/queryClassRoomByIdForTea.do")
    public @ResponseBody Object queryClassRoomByIdForTea(String id){
        Classroom classroom = classRoomService.queryClassRoomById(id);
        return classroom;
    }
}
