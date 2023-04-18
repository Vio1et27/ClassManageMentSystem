package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.workbench.mapper.CourseMapper;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.AppointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class AppointServiceImpl implements AppointService {
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public int insertAppointClass(Course course) {
        return courseMapper.insert(course);
    }

    @Override
    public int deleteAppointClass(String[] classroomName) {
        return courseMapper.deleteAppointClass(classroomName);
    }

    @Override
    public int updateAppointClass(String classroomName, String curriculum,
                                  String startDate, String endDate, String oldName, Date date) {
        return courseMapper.updateAppointClass(classroomName,curriculum,startDate,endDate,oldName,date);
    }


}
