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
import java.util.List;

@Controller
public class CourseFormForStuController {
    @Autowired
    private CourseService courseService;

    /**
     * 查看所有的课程
     * @param request
     * @return
     */

    @RequestMapping("/workbench/showInfo/queryAllCoursesForStu.do")
    public @ResponseBody Object queryAllCourses(HttpServletRequest request){
        List<Course> courses = courseService.queryAllCourses();
        request.setAttribute("courseList",courses);
        return "workbench/ShowInfo/CourseInfoForStu";
    }

    /**
     * 查看已选中的课程
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("/workbench/ShowInfo/queryAllCourseForStuByStuName.do")
    public @ResponseBody Object queryAllCourseForStuByStuName(HttpSession session, HttpServletRequest request){
        List<Course> courses = courseService.queryAllCoursesForStu
                (((Student)session.getAttribute(Contants.SESSION_STUDENT)).getFullName());
        request.setAttribute("stuCourseList",courses);
        return "workbench/ShowInfo/CourseInfoForStu";
    }
}
