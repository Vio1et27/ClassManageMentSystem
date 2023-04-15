package com.cdy.cms.workbench.service;

import com.cdy.cms.settings.pojo.Student;

public interface StuService {
    Student queryStudentById(String id);

    Student queryStudentByName(String fullName);
}
