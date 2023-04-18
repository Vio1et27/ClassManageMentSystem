package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CourseFormForStuController {
    @Autowired
    private CourseService courseService;


    @RequestMapping("/workbench/ShowInfo/toCourseFormForStu.do")
    public String toCourseFormForStu() {
        return "workbench/ShowInfo/CourseInfoForStu";
    }

    /**
     * 查看该学生有的课程列表
     *
     * @param classroomName
     * @param curriculum
     * @param startDate
     * @param endDate
     * @param createBy
     * @param pageNo
     * @param pageSize
     * @param session
     * @return
     */
    @RequestMapping("/workbench/ShowInfo/queryAllCourseForStuByStuName.do")
    public @ResponseBody Object queryAllCourseForStuByStuName(String classroomName, String curriculum,
                                                              String startDate, String endDate,
                                                              String createBy,
                                                              Integer pageNo, Integer pageSize, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        map.put("classroomName", classroomName);
        map.put("curriculum", curriculum);
        map.put("startDate", startDate);
        map.put("createBy", createBy);
        map.put("endDate", endDate);
        map.put("beginNo", (pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        map.put("students", ((Student) session.getAttribute(Contants.SESSION_STUDENT)).getFullName());
        List<Course> courseList = courseService.selectCourseByName(map);
        int totalRows = courseService.queryCountOfCourseByName(map);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("courseList", courseList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }

    @RequestMapping("/workbench/ShowInfo/queryCourseByConditionForPage.do")
    public @ResponseBody Object queryCourseByConditionForPage(String classroomName, String curriculum,
                                                              String startDate, String endDate,
                                                              String createBy,
                                                              Integer pageNo, Integer pageSize) {

        Map<String, Object> map = new HashMap<>();
        map.put("classroomName", classroomName);
        map.put("curriculum", curriculum);
        map.put("startDate", startDate);
        map.put("createBy", createBy);
        map.put("endDate", endDate);
        map.put("beginNo", (pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Course> courseList = courseService.selectCourseByConditionForPage(map);
        int totalRows = courseService.queryCountOfCourseByCondition(map);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("courseList", courseList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }
}
