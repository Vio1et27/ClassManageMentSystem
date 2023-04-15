package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.settings.mapper.StudentMapper;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.workbench.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StuServiceImpl implements StuService {
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public Student queryStudentById(String id) {
        return studentMapper.selectByStudentId(id);
    }

    @Override
    public Student queryStudentByName(String fullName) {
        return studentMapper.selectByStudentFullName(fullName);
    }
}
