package com.cdy.cms.workbench.service;

import com.cdy.cms.workbench.pojo.Course;

import java.util.List;

public interface CourseService {
    List<Course> queryAllCourses();

    List<Course> queryAllCoursesForTea(String createBy);

    List<Course> queryAllCoursesForStu(String students);

    Course appointCourseForStu(String curriculum);


}
