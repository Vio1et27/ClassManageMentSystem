package com.cdy.cms.workbench.web.controller;

import com.cdy.cms.commons.pojo.ReturnObject;
import com.cdy.cms.commons.utils.UUIDUtils;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.AppointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class AppointController {
    @Autowired
    private AppointService appointService;
    //预约教室，提供预约教室（insert）创建预约方法
    @RequestMapping("/workbench/AppointClassroom/appointClass.do")
    public @ResponseBody Object appointClass(Course course){
        ReturnObject returnObject = new ReturnObject();
        course.setCreateTime(new Date());
        course.setUpdateTime(course.getCreateTime());
        course.setCourseManagementId(UUIDUtils.getUUID());
        int cnt = appointService.insertAppointClass(course);
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

    //删除预约教室，提供删除方法（delete）
    @RequestMapping("/workbench/AppointClassroom/deleteAppointClass.do")
    public @ResponseBody Object deleteAppointClass(String id[]){
        int cnt = appointService.deleteAppointClass(id);
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
    public @ResponseBody Object updateAppointClass(Course course){
        course.setUpdateTime(new Date());
        int cnt = appointService.updateAppointClass(course);
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

    //一跳转到页面，执行queryAllCourses方法，查询所有已预约的教室
    public String index(HttpServletRequest request){
        return "";
    }
}
