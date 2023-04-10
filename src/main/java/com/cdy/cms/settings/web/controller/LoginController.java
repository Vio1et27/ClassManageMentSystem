package com.cdy.cms.settings.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.commons.pojo.ReturnObject;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.settings.service.StudentService;
import com.cdy.cms.settings.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;
    /**
     * 因保证安全性，当用户到index界面后又跳转到此controller，在此controller上执行真正的登录业务
     * @return 返回到登录界面,前缀和后缀同样省略
     */


    @RequestMapping("/settings/qx/Login/toLogin.do")
    public String toLogin(){
        return "settings/qx/Login/login";
    }

    /**
     * 登录成功/登录失败，返回相应信息,登陆失败返回ajax请求，显示登陆失败，登录成功即返回主菜单(写在前端中)
     * @return
     */

    @RequestMapping("/settings/qx/Login/LoginForTeacher.do")
    public @ResponseBody Object LoginForTeacher(String teacherJobNumber, String loginPwd, String isRemPwdForTea,
                                                HttpServletRequest request, HttpServletResponse response,
                                                HttpSession session){
        Map<String, Object> map = new HashMap<>();
        map.put("teacherJobNumber", teacherJobNumber);
        map.put("loginPwd", loginPwd);
        Teacher teacher = teacherService.queryUserByJobNumAndPwd(map);
        ReturnObject returnObject = new ReturnObject();
        if (teacher == null) {
            //登陆失败，用户名不存在或密码错误
            returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("登录失败，用户名不存在或密码错误");
        } else {
            String examineState = teacher.getExamineState();
            if (examineState.equals("false")) {
                //登陆失败，账号已过期
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("登录失败，状态已锁定");
            }else{
                //登录成功
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);
                session.setAttribute(Contants.SESSION_TEACHER,teacher);
                //登录成功，判断是否选择十天免登录
                if("true".equals(isRemPwdForTea)){
                    Cookie c1 = new Cookie("teacherJobNumber", teacherJobNumber);
                    Cookie c2 = new Cookie("loginPwd", loginPwd);
                    c1.setMaxAge(10*24*60*60);
                    c2.setMaxAge(10*24*60*60);
                    response.addCookie(c1);
                    response.addCookie(c2);
                }else{
                    Cookie c1 = new Cookie("teacherJobNumber", teacherJobNumber);
                    Cookie c2 = new Cookie("loginPwd", loginPwd);
                    c1.setMaxAge(0);
                    c2.setMaxAge(0);
                    response.addCookie(c1);
                    response.addCookie(c2);
                }
            }
        }
        return returnObject;
    }

    @RequestMapping("/settings/qx/Login/LoginForStudent.do")
    public @ResponseBody Object LoginForStudent(String studentNumber, String loginPwd, String isRemPwdForStu,
                                                HttpServletRequest request, HttpServletResponse response,
                                                HttpSession session){
        Map<String, Object> map = new HashMap<>();
        map.put("studentNumber", studentNumber);
        map.put("loginPwd", loginPwd);
        Student student = studentService.queryUserByStuNumAndPwd(map);
        ReturnObject returnObject = new ReturnObject();
        if (student == null) {
            //登陆失败，用户名不存在或密码错误
            returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("登录失败，用户名不存在或密码错误");
        } else {
            String examineState = student.getExamineState();
            if (examineState.equals("false")) {
                //登陆失败，账号已过期
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("登录失败，状态已锁定");
            }else{
                //登录成功
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);
                session.setAttribute(Contants.SESSION_STUDENT,student);
                //登录成功，判断是否选择十天免登录
                if("true".equals(isRemPwdForStu)){
                    Cookie c1 = new Cookie("studentNumber", studentNumber);
                    Cookie c2 = new Cookie("loginPwd", loginPwd);
                    c1.setMaxAge(10*24*60*60);
                    c2.setMaxAge(10*24*60*60);
                    response.addCookie(c1);
                    response.addCookie(c2);
                }else{
                    Cookie c1 = new Cookie("studentNumber", studentNumber);
                    Cookie c2 = new Cookie("loginPwd", loginPwd);
                    c1.setMaxAge(0);
                    c2.setMaxAge(0);
                    response.addCookie(c1);
                    response.addCookie(c2);
                }
            }
        }
        return returnObject;
    }

}
