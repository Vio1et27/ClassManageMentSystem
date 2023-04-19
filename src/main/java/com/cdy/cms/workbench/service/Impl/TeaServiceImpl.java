package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.settings.mapper.TeacherMapper;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.workbench.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TeaServiceImpl implements TeaService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public Teacher queryTeacherInfoById(String id) {
        return teacherMapper.selectByTeacherId(id);
    }

    @Override
    public Teacher queryTeacherInfoByName(String fullName) {
        return teacherMapper.selectByTeacherFullName(fullName);
    }

    @Override
    public List<Teacher> selectTeaByConditionForPage(Map<String, Object> map) {
        return teacherMapper.selectTeaByConditionForPage(map);
    }

    @Override
    public int queryCountOfTeaByCondition(Map<String, Object> map) {
        return teacherMapper.queryCountOfTeaByCondition(map);
    }
}
