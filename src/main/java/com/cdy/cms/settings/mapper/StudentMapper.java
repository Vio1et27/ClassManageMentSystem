package com.cdy.cms.settings.mapper;

import com.cdy.cms.settings.pojo.Student;

import java.util.Map;

public interface StudentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Mon Apr 10 15:27:13 CST 2023
     */
    int deleteByPrimaryKey(String studentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Mon Apr 10 15:27:13 CST 2023
     */
    int insert(Student record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Mon Apr 10 15:27:13 CST 2023
     */
    int insertSelective(Student record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Mon Apr 10 15:27:13 CST 2023
     */
    Student selectByPrimaryKey(String studentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Mon Apr 10 15:27:13 CST 2023
     */
    int updateByPrimaryKeySelective(Student record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Mon Apr 10 15:27:13 CST 2023
     */
    int updateByPrimaryKey(Student record);

    Student queryUserByStunNumAndPwd(Map<String,Object> map);
}