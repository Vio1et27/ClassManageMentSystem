package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.workbench.mapper.ClassroomMapper;
import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassRoomServiceImpl implements ClassRoomService {
    @Autowired
    private ClassroomMapper classroomMapper;
    @Override
    public Classroom queryClassRoomById(String id) {
        return classroomMapper.selectByClassRoomId(id);
    }

    @Override
    public Classroom queryClassRoomByName(String name) {
        return classroomMapper.selectByClassRoomName(name);
    }

    @Override
    public Classroom queryClassRoomByCourseName(String courseName) {
        return classroomMapper.selectByClassRoomCourse(courseName);
    }

    @Override
    public List<Classroom> queryAllClassrooms() {
        return classroomMapper.queryAllClassrooms();
    }
}
