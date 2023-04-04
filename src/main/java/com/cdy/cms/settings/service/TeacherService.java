package com.cdy.cms.settings.service;

import com.cdy.cms.settings.pojo.Teacher;

import java.util.Map;

public interface TeacherService {
    /**
     * 注册，插入一个老师
     * @param teacher
     * @return
     */
    int insertTeacher(Teacher teacher);

    /**
     * 登录，通过教职工号和密码查询老师
     * @param map
     * @return
     */

    Teacher queryUserByJobNumAndPwd(Map<String,Object> map);
}
