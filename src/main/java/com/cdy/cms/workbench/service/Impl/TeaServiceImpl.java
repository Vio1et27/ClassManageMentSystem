package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.settings.mapper.TeacherMapper;
import com.cdy.cms.settings.pojo.Teacher;
import com.cdy.cms.workbench.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeaServiceImpl implements TeaService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public Teacher queryTeacherInfoById(String id) {
        return teacherMapper.selectByTeacherId(id);
    }
}
