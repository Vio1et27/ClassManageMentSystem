package com.cdy.cms.settings.mapper;

import com.cdy.cms.settings.pojo.Student;

import java.util.Map;

public interface StudentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Tue Apr 04 08:17:36 CST 2023
     */
    int deleteByPrimaryKey(Integer studentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Tue Apr 04 08:17:36 CST 2023
     */
    int insert(Student record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Tue Apr 04 08:17:36 CST 2023
     */
    int insertSelective(Student record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Tue Apr 04 08:17:36 CST 2023
     */
    Student selectByPrimaryKey(Integer studentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Tue Apr 04 08:17:36 CST 2023
     */
    int updateByPrimaryKeySelective(Student record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table student
     *
     * @mbggenerated Tue Apr 04 08:17:36 CST 2023
     */
    int updateByPrimaryKey(Student record);

    Student queryUserByStunNumAndPwd(Map<String,Object> map);
}