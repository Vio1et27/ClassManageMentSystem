package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ClassRoomInfoForStuController {
    @Autowired
    private ClassRoomService classRoomService;

    /**
     * 此方法弃用
     * @param
     * @return
     */
    @RequestMapping("/workbench/ShowInfo/queryClassRoomByIdForStu.do")
    public @ResponseBody Object queryClassRoomByIdForStu(HttpSession session) {
        String fullName = ((Student) session.getAttribute(Contants.SESSION_STUDENT)).getFullName();
        Classroom classroom = classRoomService.queryClassRoomByName(fullName);
        return "workbench/ShowInfo/ClassRoomInfoForStu";
    }

    /**
     * 显示该学生所有的教室信息
     * @param request
     * @return
     */
    @RequestMapping("/workbench/showInfo/queryClassRoomByNameForStu.do")
    public @ResponseBody Object queryClassRoomByNameForStu(HttpServletRequest request){
        List<Classroom> classroomList = new ArrayList<>();
        List<Course> stuCourseList = (List<Course>) request.getAttribute("stuCourseList");
        for (Course course : stuCourseList) {
            String curriculum = course.getCurriculum();
            Classroom classroom = classRoomService.queryClassRoomByCourseName(curriculum);
            classroomList.add(classroom);
        }
        request.setAttribute("classRoomListForStu",classroomList);
        return "workbench/ShowInfo/ClassRoomInfoForStu";
    }

    /**
     * 显示所有的教室信息，不管用户有无选中
     * @return
     */
    @RequestMapping("/workbench/showInfo/queryAllClassRoomsForStu.do")
    public @ResponseBody Object queryAllClassRoomsForStu(HttpServletRequest request){
        List<Classroom> classrooms = classRoomService.queryAllClassrooms();
        request.setAttribute("classroomsList",classrooms);
        return "workbench/ShowInfo/ClassRoomInfoForStu";
    }
}
