package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ClassRoomInfoForTeaController {
    @Autowired
    private ClassRoomService classRoomService;

    /**
     * 该方法弃用
     * @param id
     * @return
     */
    @RequestMapping("/workbench/ShowInfo/queryClassRoomByIdForTea.do")
    public @ResponseBody Object queryClassRoomByIdForTea(String id){
        Classroom classroom = classRoomService.queryClassRoomById(id);
        return classroom;
    }

    /**
     * 显示所有的教室
     * @param request
     * @return
     */

    @RequestMapping("/workbench/showInfo/queryAllClassRoomsForTea.do")
    public @ResponseBody Object queryAllClassRoomsForTea(HttpServletRequest request){
        List<Classroom> classrooms = classRoomService.queryAllClassrooms();
        request.setAttribute("classroomsList",classrooms);
        return "workbench/ShowInfo/ClassRoomInfoForTea";
    }

    /**
     * 显示该老师所有的课程的教室信息
     * @param request
     * @return
     */

    @RequestMapping("/workbench/showInfo/queryClassRoomByNameForTea.do")
    public @ResponseBody Object queryClassRoomByNameForTea(HttpServletRequest request){
        List<Classroom> classroomList = new ArrayList<>();
        List<Course> teaCourseList = (List<Course>) request.getAttribute("teaCourseList");
        for (Course course : teaCourseList) {
            String curriculum = course.getCurriculum();
            Classroom classroom = classRoomService.queryClassRoomByCourseName(curriculum);
            classroomList.add(classroom);
        }
        request.setAttribute("classRoomListForTea",classroomList);
        return "workbench/ShowInfo/ClassRoomInfoForTea";
    }

    @RequestMapping("/workbench/ShowInfo/toClassRoomInfoForTea.do")
    public String toClassRoomInfoForTea(){
        return "workbench/ShowInfo/ClassRoomInfoForTea";
    }
}
