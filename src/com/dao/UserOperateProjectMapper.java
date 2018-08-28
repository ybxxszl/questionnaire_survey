package com.dao;

import com.vo.UserOperateProject;
import com.vo.UserOperateProjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserOperateProjectMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int countByExample(UserOperateProjectExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int deleteByExample(UserOperateProjectExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int deleteByPrimaryKey(String userOperateProjectId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int insert(UserOperateProject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int insertSelective(UserOperateProject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    List<UserOperateProject> selectByExample(UserOperateProjectExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    UserOperateProject selectByPrimaryKey(String userOperateProjectId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int updateByExampleSelective(@Param("record") UserOperateProject record, @Param("example") UserOperateProjectExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int updateByExample(@Param("record") UserOperateProject record, @Param("example") UserOperateProjectExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int updateByPrimaryKeySelective(UserOperateProject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_operate_project
     *
     * @mbggenerated Sun Apr 08 13:14:19 CST 2018
     */
    int updateByPrimaryKey(UserOperateProject record);
}