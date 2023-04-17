package com.cdy.cms.workbench.service.Impl;

import com.cdy.cms.workbench.mapper.CourseMapper;
import com.cdy.cms.workbench.pojo.Course;
import com.cdy.cms.workbench.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CourseSeviceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> queryAllCourses() {
        return courseMapper.queryAllCourses();
    }

    @Override
    public List<Course> queryAllCoursesForTea(String createBy) {
        return courseMapper.queryAllCoursesForTea(createBy);
    }

    @Override
    public List<Course> queryAllCoursesForStu(String students) {
        return courseMapper.queryAllCoursesForStu(students);
    }

    @Override
    public int appointCourseForStu(String classroomName[], String students) {
        return courseMapper.appointCourseForStu(classroomName,students);
    }

    @Override
    public List<Course> selectCourseByConditionForPage(Map<String, Object> map) {
        return courseMapper.selectCourseByConditionForPage(map);
    }

    @Override
    public int queryCountOfCourseByCondition(Map<String, Object> map) {
        return courseMapper.selectCountOfCourseByCondition(map);
    }

    @Override
    public List<Course> selectCourseByName(Map<String, Object> map) {
        return courseMapper.selectCourseByName(map);
    }

    @Override
    public int queryCountOfCourseByName(Map<String, Object> map) {
        return courseMapper.selectCountOfCourseByName(map);
    }
}
