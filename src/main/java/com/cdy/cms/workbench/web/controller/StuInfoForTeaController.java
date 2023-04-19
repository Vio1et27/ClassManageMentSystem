package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.CourseService;
import com.cdy.cms.workbench.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StuInfoForTeaController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private StuService stuService;




    @RequestMapping("/workbench/ShowInfo/queryStuForTeaByStuName.do")
    public @ResponseBody Object queryAllStuForTeaByStuName( String stuName, String stuNum,
                                                            String stuAge,  String stuGender,
                                                           Integer pageNo, Integer pageSize, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        map.put("fullName", stuName);
        map.put("studentNumber",stuNum);
        map.put("age", stuAge);
        map.put("gender", stuGender);
        map.put("beginNo",(pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Course> courseList = courseService.queryAllCoursesForTea
                (((Teacher) session.getAttribute(Contants.SESSION_TEACHER)).getFullName());
        List<Student> stuForTeaByNameList = new ArrayList<>();
        for(Course course:courseList){
            Student student = stuService.queryStudentByName(course.getStudents());
            if (student != null) {
                stuForTeaByNameList.add(student);
            }

        }
        int totalRows = stuForTeaByNameList.size();
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("stuForTeaByNameList", stuForTeaByNameList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }
    /*
                        stuName:stuName,
                        stuNum:stuNum,
                        stuAge:stuAge,
                        stuGender:stuGender,
                        pageNo:pageNo,
                        pageSize:pageSize
     */
    @RequestMapping("/workbench/ShowInfo/queryStuByConditionForTea.do")
    public @ResponseBody Object queryStuByConditionForTea(String stuName, String stuNum,
                                                              String stuAge, String stuGender,
                                                              Integer pageNo, Integer pageSize) {

        Map<String, Object> map = new HashMap<>();
        map.put("fullName", stuName);
        map.put("studentNumber",stuNum);
        map.put("age", stuAge);
        map.put("gender", stuGender);
        map.put("beginNo",(pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Student> studentList = stuService.selectStuByConditionForPage(map);
        int totalRows = stuService.queryCountOfStuByCondition(map);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("stuForTeaList", studentList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }
    @RequestMapping("/workbench/ShowInfo/toStuInfoForTea.do")
    public String toStuInfoForTea(){
        return "workbench/ShowInfo/StuInfoForTea";
    }
}
