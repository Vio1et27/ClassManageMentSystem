package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ClassRoomInfoForStuController {
    @Autowired
    private ClassRoomService classRoomService;
    @RequestMapping("/workbench/ShowInfo/queryClassRoomByIdForStu.do")
    public @ResponseBody Object queryClassRoomByIdForStu(String id){
        Classroom classroom = classRoomService.queryClassRoomById(id);
        return classroom;
    }


}
