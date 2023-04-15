package com.cdy.cms.settings.service.Impl;

import com.cdy.cms.settings.mapper.StudentMapper;
import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public int insertStudent(Student student) {
        return studentMapper.insert(student);
    }

    @Override
    public Student queryUserByStuNumAndPwd(Map<String, Object> map) {
        return studentMapper.queryUserByStunNumAndPwd(map);
    }


}
