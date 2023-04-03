package com.cdy.cms.settings.service.Impl;

import com.cdy.cms.settings.mapper.TeacherMapper;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.settings.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    /**
     * 注册,插入一个老师
     * @param teacher
     * @return
     */
    @Override
    public int insertTeacher(Teacher teacher) {
        return teacherMapper.insert(teacher);
    }

    @Override
    public Teacher queryUserByJobNumAndPwd(Map<String, Object> map) {
        return teacherMapper.queryUserByJobNumAndPwd(map);
    }
}
