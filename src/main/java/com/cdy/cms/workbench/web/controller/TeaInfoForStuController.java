package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.CourseService;
import com.cdy.cms.workbench.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TeaInfoForStuController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private TeaService teaService;

    /**
     * 显示该学生的所有老师信息
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("/workbench/ShowInfo/queryTeaInfoForStu.do")
    public String queryTeaInfoForStu(HttpSession session, HttpServletRequest request){
        String fullName = ((Student) session.getAttribute(Contants.SESSION_STUDENT)).getFullName();
        List<Course> courses = courseService.queryAllCoursesForStu(fullName);
        List<Teacher> list = new ArrayList<>();
        for (Course course : courses) {
            String teacherName = course.getCreateBy();
            Teacher teacher = teaService.queryTeacherInfoByName(teacherName);
            list.add(teacher);
        }

        //teaList用来在展示信息页面中引用 通过$
        request.setAttribute("teaList",list);
        return "workbench/ShowInfo/TeaInfoForStu";
    }
}
