package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Teacher;
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
public class CourseFormForTeaController {
    @Autowired
    private CourseService courseService;

    /**
     * 查看所有的课程
     * @param request
     * @return
     */
    @RequestMapping("/workbench/showInfo/queryAllCoursesForTea.do")
    public @ResponseBody Object queryAllCourses(HttpServletRequest request){
        List<Course> courses = courseService.queryAllCourses();
        request.setAttribute("courseList",courses);
        return "workbench/ShowInfo/CourseInfoForTea";
    }

    /**
     * 查看所有该老师所有的课程
     * @param session
     * @param request
     * @return
     */

    @RequestMapping("/workbench/ShowInfo/queryAllCourseForTeaByCreateBy.do")
    public @ResponseBody Object queryAllCourseForTeaByCreateBy(HttpSession session, HttpServletRequest request){
        List<Course> courses = courseService.queryAllCoursesForTea
                (((Teacher)session.getAttribute(Contants.SESSION_TEACHER)).getFullName());
        request.setAttribute("teaCourseList",courses);
        return "workbench/ShowInfo/CourseInfoForTea";
    }
}
