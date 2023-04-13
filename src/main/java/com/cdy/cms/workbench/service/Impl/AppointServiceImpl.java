package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.workbench.mapper.CourseMapper;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.AppointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AppointServiceImpl implements AppointService {
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public int insertAppointClass(Course course) {
        return courseMapper.insert(course);
    }

    @Override
    public int deleteAppointClass(String[] id) {
        return courseMapper.deleteAppointClass(id);
    }

    @Override
    public int updateAppointClass(Course course) {
        return courseMapper.updateAppointClass(course);
    }
}
