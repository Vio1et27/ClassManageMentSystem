package com.cdy.cms.settings.mapper;

import com.cdy.cms.settings.pojo.Teacher;

public interface TeacherMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Mon Apr 03 16:41:07 CST 2023
     */
    int deleteByPrimaryKey(Integer teacherId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Mon Apr 03 16:41:07 CST 2023
     */
    int insert(Teacher record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Mon Apr 03 16:41:07 CST 2023
     */
    int insertSelective(Teacher record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Mon Apr 03 16:41:07 CST 2023
     */
    Teacher selectByPrimaryKey(Integer teacherId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Mon Apr 03 16:41:07 CST 2023
     */
    int updateByPrimaryKeySelective(Teacher record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table teacher
     *
     * @mbggenerated Mon Apr 03 16:41:07 CST 2023
     */
    int updateByPrimaryKey(Teacher record);
}