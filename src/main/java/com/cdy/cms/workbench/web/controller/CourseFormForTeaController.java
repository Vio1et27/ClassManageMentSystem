package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

public class CourseFormForTeaController {
    @Autowired
    private CourseService courseService;
    @RequestMapping("/workbench/ShowInfo/queryAllCourseForTea.do")
    public @ResponseBody Object queryAllCourseForTea(){
        List<Course> courses = courseService.queryAllCourses();
        return courses;
    }
}
