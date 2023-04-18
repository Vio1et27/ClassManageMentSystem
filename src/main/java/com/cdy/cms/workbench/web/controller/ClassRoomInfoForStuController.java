package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.ClassRoomService;
import com.cdy.cms.workbench.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ClassRoomInfoForStuController {
    @Autowired
    private ClassRoomService classRoomService;

    @Autowired
    private CourseService courseService;
    @RequestMapping("/workbench/ShowInfo/toClassRoomInfoForStu.do")
    public String toClassRoomInfoForStu(){
        return "workbench/ShowInfo/ClassRoomInfoForStu";
    }

    @RequestMapping("/workbench/ShowInfo/queryAllClassroomForStuByStuName.do")
    public @ResponseBody Object queryAllClassroomForStuByStuName(String classroomName, String capacity,
                                                                 String classroomLocation,
                                                                 String classroomEnvironment,
                                                                 Integer pageNo, Integer pageSize, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        map.put("classroomName", classroomName);
        map.put("capacity", capacity);
        map.put("classroomLocation", classroomLocation);
        map.put("classroomEnvironment", classroomEnvironment);
        map.put("beginNo", (pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        map.put("students", ((Student) session.getAttribute(Contants.SESSION_STUDENT)).getFullName());
        List<Classroom> classroomList = classRoomService.selectClassroomByName(map);
        int totalRows = classRoomService.queryCountOfClassroomByName(map);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("classroomList", classroomList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }

    @RequestMapping("/workbench/ShowInfo/queryClassroomByConditionForPage.do")
    public @ResponseBody Object queryClassroomByConditionForPage(String classroomName, String capacity,
                                                                 String classroomLocation, String classroomEnvironment,
                                                                 Integer pageNo, Integer pageSize) {

        Map<String, Object> map = new HashMap<>();
        map.put("classroomName", classroomName);
        map.put("capacity", capacity);
        map.put("classroomLocation", classroomLocation);
        map.put("classroomEnvironment", classroomEnvironment);
        map.put("beginNo", (pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Classroom> classroomList = classRoomService.selectClassroomByConditionForPage(map);
        int totalRows = classRoomService.queryCountOfClassroomByCondition(map);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("classroomList", classroomList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }
    @RequestMapping("/workbench/ShowInfo/showClassroomDetailsForStudent.do")
    public @ResponseBody Object showClassroomDetailsForStudent(String classroomName){
        Classroom classroom = classRoomService.showClassroomDetailsForStudent(classroomName);
        Course course = courseService.queryCourseByClassroomName(classroomName);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("classroomDetail",classroom);
        retMap.put("courseDetail",course);
        return retMap;
    }
}
