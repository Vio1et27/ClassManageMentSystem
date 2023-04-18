package com.cdy.cms.workbench.service;

import com.cdy.cms.workbench.pojo.Course;

import java.util.List;
import java.util.Map;

public interface CourseService {
    List<Course> queryAllCourses();

    List<Course> queryAllCoursesForTea(String createBy);

    List<Course> queryAllCoursesForStu(String students);

    int appointCourseForStu(String classroomName[],String students);

    List<Course> selectCourseByConditionForPage(Map<String,Object> map);

    int queryCountOfCourseByCondition(Map<String,Object> map);

    List<Course> selectCourseByName(Map<String,Object> map);

    int queryCountOfCourseByName(Map<String,Object> map);

    Course queryCourseByClassroomName(String classroomName);

    List<Course> selectCourseByCreateBy(Map<String,Object> map);

    int queryCountOfCourseByCreateBy(Map<String,Object> map);

    int insertAppointCourse(Course course);

    Course returnEditInfoByName(String classroomName);
}
