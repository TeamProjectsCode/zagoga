package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.Users;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface AjaxMapper {
    @Select("SELECT COUNT(U_NICK) FROM USERS WHERE U_NICK=#{nick}")
    public int ajaxTest1(String nick);

}
