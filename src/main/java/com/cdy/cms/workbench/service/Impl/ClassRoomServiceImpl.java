package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.workbench.mapper.ClassroomMapper;
import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public List<Classroom> selectClassroomByConditionForPage(Map<String, Object> map) {
        return classroomMapper.selectClassroomByConditionForPage(map);
    }

    @Override
    public int queryCountOfClassroomByCondition(Map<String, Object> map) {
        return classroomMapper.queryCountOfClassroomByCondition(map);
    }

    @Override
    public List<Classroom> selectClassroomByName(Map<String, Object> map) {
        return classroomMapper.selectClassroomByName(map);
    }

    @Override
    public int queryCountOfClassroomByName(Map<String, Object> map) {
        return classroomMapper.queryCountOfClassroomByName(map);
    }

    @Override
    public Classroom showClassroomDetailsForStudent(String classroomName) {
        return classroomMapper.showClassroomDetailsForStudent(classroomName);
    }

    @Override
    public List<Classroom> queryAllEmptyClassrooms() {
        return classroomMapper.queryAllEmptyClassrooms();
    }

    @Override
    public int updateClassroomCourse(String correspondingCourses, String classroomName) {
        return classroomMapper.updateClassroomCourse(correspondingCourses,classroomName);
    }
}
