package com.cdy.cms.workbench.service;

import com.cdy.cms.workbench.pojo.Course;

public interface AppointService {
    int insertAppointClass(Course course);

    int deleteAppointClass(String id[]);

    int updateAppointClass(Course course);
}
