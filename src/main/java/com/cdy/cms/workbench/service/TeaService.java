package com.cdy.cms.workbench.service;

import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;

import java.util.List;
import java.util.Map;

public interface TeaService {
    Teacher queryTeacherInfoById(String id);

    Teacher queryTeacherInfoByName(String fullName);

    List<Teacher> selectTeaByConditionForPage(Map<String,Object> map);

    int queryCountOfTeaByCondition(Map<String,Object> map);
}
