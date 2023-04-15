package com.cdy.cms.workbench.service;

import com.cdy.cms.workbench.mapper.ClassroomMapper;
import com.cdy.cms.workbench.pojo.Classroom;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface ClassRoomService {

    Classroom queryClassRoomById(String id);

    Classroom queryClassRoomByName(String name);

    Classroom  queryClassRoomByCourseName(String courseName);

    List<Classroom> queryAllClassrooms();
}
