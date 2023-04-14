package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CourseFormForStuController {
    @Autowired
    private CourseService courseService;
    @RequestMapping("/workbench/ShowInfo/queryAllCourseForStu.do")
    public @ResponseBody Object queryAllCourseForStu(){
        List<Course> courses = courseService.queryAllCourses();
        return courses;
    }
}
