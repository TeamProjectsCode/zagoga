package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.mapper.sql.SecuritySQL;
import com.javalec.project_zagoga.vo.AuthInfo;
import org.apache.ibatis.annotations.*;

@Mapper
public interface AuthMapper {

    @SelectProvider(value = SecuritySQL.class, method = "loadUserByName")
    AuthValue loadUserByName(@Param("username") String username);

    @Options(useGeneratedKeys = true, keyProperty = "authValue.sc_no")
    @InsertProvider(value = SecuritySQL.class, method = "insertAuthValue")
    void insertAuthValue(@Param("authValue") AuthValue authValue);

    @UpdateProvider(value = SecuritySQL.class, method = "updatePW")
    void updatePW(int sc_no, String encPwd);
}
