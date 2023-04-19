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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @RequestMapping("/workbench/ShowInfo/toTeaInfoForStu.do")
    public String toTeaInfoForStu(){
        return "workbench/ShowInfo/TeaInfoForStu";
    }

    @RequestMapping("/workbench/ShowInfo/queryTeaForStuByStuName.do")
    public @ResponseBody Object queryTeaForStuByStuName(String TeaName, String TeaNum,
                                                        String TeaPos, String TeaGender,
                                                           Integer pageNo, Integer pageSize, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        map.put("fullName", TeaName);
        map.put("gender",TeaGender);
        map.put("teacherJobNumber", TeaNum);
        map.put("position", TeaPos);
        map.put("beginNo",(pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Course> courseList = courseService.queryAllCoursesForStu( (((Student) session.getAttribute(Contants.SESSION_STUDENT)).getFullName()));
        List<Teacher> teaForStuByNameList = new ArrayList<>();
        for(Course course:courseList){
            Teacher teacher = teaService.queryTeacherInfoByName(course.getCreateBy());
            if (teacher != null) {
                teaForStuByNameList.add(teacher);
            }

        }
        int totalRows = teaForStuByNameList.size();
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("teaForStuByNameList", teaForStuByNameList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }
    /*
                        TeaName: TeaName,
                        TeaNum: TeaNum,
                        TeaPos: TeaPos,
                        TeaGender: TeaGender,
                        pageNo: pageNo,
                        pageSize: pageSize
     */
    @RequestMapping("/workbench/ShowInfo/queryTeaByConditionForStu.do")
    public @ResponseBody Object queryTeaByConditionForStu(String TeaName, String TeaNum,
                                                          String TeaPos, String TeaGender,
                                                          Integer pageNo, Integer pageSize) {

        Map<String, Object> map = new HashMap<>();
        map.put("fullName", TeaName);
        map.put("gender",TeaGender);
        map.put("teacherJobNumber", TeaNum);
        map.put("position", TeaPos);
        map.put("beginNo",(pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Teacher> teacherList = teaService.selectTeaByConditionForPage(map);
        int totalRows = teaService.queryCountOfTeaByCondition(map);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("teaForStuList", teacherList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }
}
