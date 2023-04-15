package com.cdy.cms.settings.service;

import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;

import java.util.Map;

public interface StudentService {
    /**
     * 注册，插入一个学生
     * @param student
     * @return
     */
    int insertStudent(Student student);

    /**
     * 登录，通过学生学号和密码查询学生
     * @param map
     * @return
     */
    Student queryUserByStuNumAndPwd(Map<String,Object> map);

    //Student selectByStudentFullName(String fullName);
}
