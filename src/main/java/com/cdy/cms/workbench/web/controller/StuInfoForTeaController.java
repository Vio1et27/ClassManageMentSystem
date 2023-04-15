package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.CourseService;
import com.cdy.cms.workbench.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StuInfoForTeaController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private StuService stuService;

    /**
     * 显示该教师的所有学生信息
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("/workbench/ShowInfo/queryStuInfoForTea.do")
    public String queryStuInfoForTea(HttpSession session, HttpServletRequest request){
        String createBy = ((Teacher) session.getAttribute(Contants.SESSION_TEACHER)).getFullName();
        List<Course> courses = courseService.queryAllCoursesForTea(createBy);
        List<Student> list = new ArrayList<>();
        for (Course course : courses) {
            String students = course.getStudents();
            Student student = stuService.queryStudentByName(students);
            list.add(student);
        }

        //stuList用来在展示信息页面中引用 通过$
        request.setAttribute("stuList",list);
        return "workbench/ShowInfo/StuInfoForTea";
    }
}
