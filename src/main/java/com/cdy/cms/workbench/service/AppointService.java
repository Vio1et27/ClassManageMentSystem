package com.cdy.cms.workbench.service;

import com.cdy.cms.workbench.pojo.Course;

import java.util.Date;

public interface AppointService {
    int insertAppointClass(Course course);

    int deleteAppointClass(String classroomName[]);

    int updateAppointClass(String classroomName, String curriculum,
                           String startDate, String endDate, String oldName, Date date);
}
