package com.cdy.cms.workbench.service;

import com.cdy.cms.settings.pojo.Student;
import com.cdy.cms.settings.pojo.Teacher;

import java.util.List;

public interface TeaService {
    Teacher queryTeacherInfoById(String id);

    Teacher queryTeacherInfoByName(String fullName);
}
