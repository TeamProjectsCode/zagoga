package com.javalec.project_zagoga.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AjaxMapper {
    @Select("SELECT COUNT(U_NICK) FROM USERS WHERE U_NICK=#{nick}")
    int ajaxTest1(String nick);

}
