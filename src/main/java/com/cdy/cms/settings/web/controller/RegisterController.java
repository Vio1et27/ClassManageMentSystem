package com.cdy.cms.settings.web.controller;

import com.cdy.cms.commons.contants.Contants;
import com.cdy.cms.commons.pojo.ReturnObject;
import com.cdy.cms.commons.utils.DateUtils;
import com.cdy.cms.commons.utils.UUIDUtils;
import com.cdy.cms.settings.pojo.Teacher;
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

    @RequestMapping("/settings/qx/Register/registerForTeacher.do")
    public @ResponseBody Object registerForTeacher(Teacher teacher) throws ParseException {
        ReturnObject returnObject = new ReturnObject();
        teacher.setTeacherId(Integer.valueOf(UUIDUtils.getUUID()));
        teacher.setCreateTime(DateUtils.formatDateTimeToDate(DateUtils.formatDateTimeToString(new Date())));
        teacher.setExamineState("true");
        //创建时，更新时间等于创建时间，后续提供修改信息方法
        teacher.setUpdateTime(teacher.getCreateTime());
        int cnt = teacherService.insertTeacher(teacher);
        try {
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
