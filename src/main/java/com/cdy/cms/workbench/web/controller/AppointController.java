package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.commons.pojo.ReturnObject;
import com.cdy.cms.commons.utils.UUIDUtils;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.AppointService;
import com.cdy.cms.workbench.service.ClassRoomService;
import com.cdy.cms.workbench.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class AppointController {
    @Autowired
    private AppointService appointService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private ClassRoomService classRoomService;
    //预约教室，提供预约教室（insert）创建预约方法

    //这是给老师用来创建课程的
    @RequestMapping("/workbench/AppointClassroom/appointClass.do")
    public @ResponseBody Object appointClass(Course course, HttpSession session){
        ReturnObject returnObject = new ReturnObject();
        course.setCreateTime(new Date());
        course.setUpdateTime(course.getCreateTime());
        course.setCourseManagementId(UUIDUtils.getUUID());
        course.setCreateBy(((Teacher)session.getAttribute(Contants.SESSION_TEACHER)).getFullName());
        int cnt = appointService.insertAppointClass(course);
        try {
            if(cnt > 0){
                returnObject.setCode("1");
                session.setAttribute(Contants.SESSION_COURSE,course);
            }else{
                returnObject.setCode("0");
                returnObject.setMessage("系统忙，请稍后重试");
            }
        } catch (Exception e) {
            e.printStackTrace();
            returnObject.setCode("0");
            returnObject.setMessage("系统忙，请稍后重试");
        }
        return returnObject;
    }

    //删除预约教室，提供删除方法（delete）
    @RequestMapping("/workbench/AppointClassroom/deleteAppointClass.do")
    public @ResponseBody Object deleteAppointClass(String classroomName[]){
        //删除后将原来教室的课程删除
        int cnt = classRoomService.deleteClassrooomCourse(classroomName);
        cnt+= appointService.deleteAppointClass(classroomName);
        ReturnObject returnObject = new ReturnObject();
        try {
            if(cnt > 0){
                returnObject.setCode("1");
            }else{
                returnObject.setCode("0");
                returnObject.setMessage("系统忙，请稍后重试");
            }
        } catch (Exception e) {
            e.printStackTrace();
            returnObject.setCode("0");
            returnObject.setMessage("系统忙，请稍后重试");
        }
        return returnObject;
    }
    //修改预约教室，提供修改方法（update）
    @RequestMapping("/workbench/AppointClassroom/updateAppointClass.do")
    public @ResponseBody Object updateAppointClass(String classroomName,String curriculum,
                                                   String startDate,String endDate,String oldName){
        /*Course course = new Course();
        course.setClassroomName(classroomName);
        course.setCurriculum(curriculum);
        course.setStartDate(startDate);
        course.setEndDate(endDate);
        course.setUpdateTime(new Date());*/
        /*classroomName: classroomName,
                curriculum: classroomCourse,
                startDate: classroomStartDate,
                endDate: classroomEndDate,
                oldName:oldName,*/
        Date date = new Date();
        int cnt = appointService.updateAppointClass(classroomName,curriculum,startDate,endDate,oldName,date);
        //更新后将原来教室的课程删除
        cnt+=classRoomService.deleteClassrooomOneCourse(oldName);
        //并且将更新后的课程设置为更新后的教室
        cnt+=classRoomService.changeOldClassroomCourse(classroomName,curriculum);
        ReturnObject returnObject = new ReturnObject();
        try {
            if(cnt > 0){
                returnObject.setCode("1");
            }else{
                returnObject.setCode("0");
                returnObject.setMessage("系统忙，请稍后重试");
            }
        } catch (Exception e) {
            e.printStackTrace();
            returnObject.setCode("0");
            returnObject.setMessage("系统忙，请稍后重试");
        }
        return returnObject;
    }

    //一跳转到页面，执行queryAllCourses方法，查询所有已预约的教室 -> 该方法在CourseFormController中写好了

    /**
     * 跳转到主页面
     * @param request
     * @return
     */
    public String index(HttpServletRequest request){
        return "";
    }

    /**
     * 学生选课功能,根据课程名字选择
     * @param classroomName
     * @param session
     * @return
     */
    @RequestMapping("/workbench/AppointClassroom/appointCourseForStu.do")
    public @ResponseBody Object appointCourseForStu(String classroomName[],HttpSession session){
        ReturnObject returnObject = new ReturnObject();
        try {
            int cnt = courseService.appointCourseForStu(classroomName
                    ,((Student)session.getAttribute(Contants.SESSION_STUDENT)).getFullName());
            if(cnt > 0){
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);
                System.out.println("预约成功!");
            }else{
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙,请稍后重试...");
            }
        } catch (Exception e) {
            e.printStackTrace();
            returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙,请稍后重试...");
        }
        return returnObject;
    }

    @RequestMapping("/workbench/activity/returnEditInfoByName.do")
    public @ResponseBody Object returnEditInfoByName(String classroomName){
        Course course = courseService.returnEditInfoByName(classroomName);
        return course;
    }
}
