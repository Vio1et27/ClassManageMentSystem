package com.cdy.cms.workbench.service;

import com.cdy.cms.workbench.mapper.ClassroomMapper;
import com.cdy.cms.workbench.pojo.Classroom;
import com.cdy.cms.workbench.pojo.Course;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface ClassRoomService {

    Classroom queryClassRoomById(String id);

    Classroom queryClassRoomByName(String name);

    Classroom  queryClassRoomByCourseName(String courseName);

    List<Classroom> queryAllClassrooms();

    List<Classroom> selectClassroomByConditionForPage(Map<String,Object> map);

    int queryCountOfClassroomByCondition(Map<String,Object> map);

    List<Classroom> selectClassroomByName(Map<String,Object> map);

    int queryCountOfClassroomByName(Map<String,Object> map);

    Classroom showClassroomDetailsForStudent(String classroomName);

    List<Classroom> queryAllEmptyClassrooms();

    int updateClassroomCourse(String correspondingCourses,String classroomName);
}
