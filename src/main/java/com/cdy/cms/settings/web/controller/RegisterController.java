package com.cdy.cms.settings.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.commons.pojo.ReturnObject;
import com.cdy.cms.commons.utils.DateUtils;
import com.cdy.cms.commons.utils.UUIDUtils;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.settings.service.StudentService;
import com.cdy.cms.settings.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Date;

@Controller
public class RegisterController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;
    @RequestMapping("/settings/qx/Register/toStuRegister.do")
    public String toStuRegister(){
        return "settings/qx/Register/StudentRegister";
    }

    @RequestMapping("/settings/qx/Register/toRegister.do")
    public String toRegister(){
        return "settings/qx/Register/StudentRegister";
    }

    @RequestMapping("/settings/qx/Register/toTeaRegister.do")
    public String toTeaRegister(){
        return "settings/qx/Register/TeacherRegister";
    }

    @RequestMapping("/settings/qx/Register/registerForTeacher.do")
    public @ResponseBody Object registerForTeacher(Teacher teacher) throws ParseException {
        ReturnObject returnObject = new ReturnObject();
        teacher.setTeacherId(UUIDUtils.getUUID());
        teacher.setCreateTime(DateUtils.formatDateTimeToDate(DateUtils.formatDateTimeToString(new Date())));
        teacher.setExamineState("true");
        //创建时，更新时间等于创建时间，后续提供修改信息方法
        teacher.setUpdateTime(teacher.getCreateTime());

        try {
            int cnt = teacherService.insertTeacher(teacher);
            if (cnt > 0) {
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);
            } else {
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

    @RequestMapping("/settings/qx/Register/registerForStudent.do")
    public @ResponseBody Object registerForStudent(Student student) throws ParseException {
        ReturnObject returnObject = new ReturnObject();
        student.setStudentId(UUIDUtils.getUUID());
        student.setCreateTime(DateUtils.formatDateTimeToDate(DateUtils.formatDateTimeToString(new Date())));
        student.setExamineState("true");
        //创建时，更新时间等于创建时间，后续提供修改信息方法
        student.setUpdateTime(student.getCreateTime());

        try {
            int cnt = studentService.insertStudent(student);
            if (cnt > 0) {
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);
            } else {
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
