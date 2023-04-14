package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.workbench.mapper.CourseMapper;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseSeviceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> queryAllCourses() {
        return courseMapper.queryAllCourses();
    }
}
