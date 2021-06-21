package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.sql.UserSQL;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface UsersMapper {

    @Select(UserSQL.GET_USERS_LIST)
    List<Users> getUsersList();

    @SelectProvider(type= UserSQL.class, method = "checkUserMailAndPwd")
    Users checkUserMailAndPwd(@Param("u_mail") String u_mail, @Param("u_pwd") String u_pwd);

    @SelectProvider(type = UserSQL.class, method = "getUserByUNo")
    Users get(@Param("u_no") int u_no);

    @InsertProvider(type = UserSQL.class, method = "insertUser")
    int insert(HashMap<String, Object> user_map);

    @UpdateProvider(type = UserSQL.class, method = "updateUser")
    int update(HashMap<String, Object> user_map);

    @DeleteProvider(type = UserSQL.class, method = "deleteUser")
    int delete(int u_no);
}
