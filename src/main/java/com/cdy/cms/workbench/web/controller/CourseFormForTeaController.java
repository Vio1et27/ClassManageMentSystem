package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.commons.pojo.ReturnObject;
import com.cdy.cms.commons.utils.DateUtils;
import com.cdy.cms.commons.utils.UUIDUtils;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
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
import java.text.ParseException;
import java.util.*;

@Controller
public class CourseFormForTeaController {
    @Autowired
    private CourseService courseService;

    @Autowired
    private ClassRoomService classRoomService;
    @RequestMapping("/workbench/ShowInfo/toCourseInfoForTea.do")
    public String toCourseInfoForTea(HttpServletRequest request){
        List<Classroom> classroomList = classRoomService.queryAllEmptyClassrooms();
        List<String> classroomNameList = new ArrayList<>();
        for(Classroom classroom:classroomList){
            classroomNameList.add(classroom.getClassroomName());
        }
        request.setAttribute("emptyclassrooms",classroomNameList);
        return "workbench/ShowInfo/CourseInfoForTea";
    }

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





    @RequestMapping("/workbench/ShowInfo/queryAllCourseForTeaByCreateBy.do")
    public @ResponseBody Object queryAllCourseForTeaByCreateBy(String classroomName, String curriculum,
                                                              String startDate, String endDate,
                                                              Integer pageNo, Integer pageSize, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        map.put("classroomName", classroomName);
        map.put("curriculum", curriculum);
        map.put("startDate", startDate);
        map.put("createBy", ((Teacher)session.getAttribute(Contants.SESSION_TEACHER)).getFullName());
        map.put("endDate", endDate);
        map.put("beginNo", (pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Course> courseList = courseService.selectCourseByCreateBy(map);
        int totalRows = courseService.queryCountOfCourseByCreateBy(map);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("courseList", courseList);
        retMap.put("totalRows", totalRows);
        return retMap;
    }
    @RequestMapping("/workbench/ShowInfo/saveAppointCourse.do")
    public @ResponseBody Object saveAppointCourse(String classroomName,String curriculum,
                                                  String startDate,String endDate,
                                                HttpSession session) throws ParseException {
        //先插入课程，后将对应教室名的教室的对应课程修改
        ReturnObject returnObject = new ReturnObject();
        Course course = new Course();
        course.setClassroomName(classroomName);
        course.setCurriculum(curriculum);
        course.setStartDate(startDate);
        course.setEndDate(endDate);
        course.setCreateBy(((Teacher)session.getAttribute(Contants.SESSION_TEACHER)).getFullName());
        course.setCourseManagementId(UUIDUtils.getUUID());
        course.setCreateTime(DateUtils.formatDateTimeToDate(DateUtils.formatDateTimeToString(new Date())));
        course.setUpdateTime(course.getCreateTime());
        try {
            int cnt = courseService.insertAppointCourse(course);
            cnt+= classRoomService.updateClassroomCourse(curriculum, classroomName);
            if(cnt > 0){
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙，请稍后重试");
            }
        } catch (Exception e) {
            e.printStackTrace();
            returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，请稍后重试");
        }
        return returnObject;
    }
}
