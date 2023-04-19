package com.cdy.cms.workbench.service;

import com.cdy.cms.settings.pojo.Student;

import java.util.List;
import java.util.Map;

public interface StuService {
    Student queryStudentById(String id);

    Student queryStudentByName(String fullName);

    List<Student> selectStuByConditionForPage(Map<String,Object> map);

    int queryCountOfStuByCondition(Map<String,Object> map);
}
