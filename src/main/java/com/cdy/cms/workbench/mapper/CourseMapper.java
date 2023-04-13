package com.cdy.cms.workbench.mapper;

import com.cdy.cms.workbench.pojo.Course;

public interface CourseMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table course_management
     *
     * @mbggenerated Thu Apr 13 23:58:23 CST 2023
     */
    int deleteAppointClass(String courseManagementId[]);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table course_management
     *
     * @mbggenerated Thu Apr 13 23:58:23 CST 2023
     */
    int insert(Course record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table course_management
     *
     * @mbggenerated Thu Apr 13 23:58:23 CST 2023
     */
    int insertSelective(Course record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table course_management
     *
     * @mbggenerated Thu Apr 13 23:58:23 CST 2023
     */
    Course selectByPrimaryKey(String courseManagementId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table course_management
     *
     * @mbggenerated Thu Apr 13 23:58:23 CST 2023
     */
    int updateAppointClass(Course record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table course_management
     *
     * @mbggenerated Thu Apr 13 23:58:23 CST 2023
     */
    int updateByPrimaryKey(Course record);
}