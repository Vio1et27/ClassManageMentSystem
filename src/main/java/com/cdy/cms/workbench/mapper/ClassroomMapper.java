package com.cdy.cms.workbench.mapper;

import com.cdy.cms.workbench.pojo.Classroom;

public interface ClassroomMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table classroom_information
     *
     * @mbggenerated Thu Apr 13 23:53:27 CST 2023
     */
    int deleteByPrimaryKey(String classroomInformationId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table classroom_information
     *
     * @mbggenerated Thu Apr 13 23:53:27 CST 2023
     */
    int insert(Classroom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table classroom_information
     *
     * @mbggenerated Thu Apr 13 23:53:27 CST 2023
     */
    int insertSelective(Classroom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table classroom_information
     *
     * @mbggenerated Thu Apr 13 23:53:27 CST 2023
     */
    Classroom selectByClassRoomId(String classroomInformationId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table classroom_information
     *
     * @mbggenerated Thu Apr 13 23:53:27 CST 2023
     */
    int updateByPrimaryKeySelective(Classroom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table classroom_information
     *
     * @mbggenerated Thu Apr 13 23:53:27 CST 2023
     */
    int updateByPrimaryKey(Classroom record);

    Classroom selectByClassRoomName(String name);
}