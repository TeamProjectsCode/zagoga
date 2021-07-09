package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.BookingRoomGhouseUsers;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.vo.UsersVO;
import com.javalec.project_zagoga.mapper.sql.UserSQL;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UsersMapper {

    @Select(UserSQL.GET_USERS_LIST)
    List<UsersVO> getUsersList();

//    @SelectProvider(type= UserSQL.class, method = "loadUserByName")
//    Users loadUserByName(@Param("username") String username);
    @SelectProvider(type = UserSQL.class, method = "loadUserBySecurityNo")
    UsersVO loadUserBySecurityNo(@Param("sc_no") int sc_no);

    @SelectProvider(type = UserSQL.class, method = "loadForFindWD")
    int loadForFindWD(@Param("authValue") AuthValue authValue, @Param("name") String name, @Param("jumin") String jumin);

    @SelectProvider(type = UserSQL.class, method = "loadUserBySNS")
    UsersVO loadUserBySNS(@Param("snsID") String snsID);

    @SelectProvider(type = UserSQL.class, method = "getUserByUNo")
    UsersVO get(@Param("u_no") int u_no);


    @Options(useGeneratedKeys = true, keyProperty = "user.u_no")
    @InsertProvider(type = UserSQL.class, method = "insertUser")
    void insertUser(@Param("authValue") AuthValue authValue, @Param("user") Users user);
//    int insert(HashMap<String, Object> user_map);

    @Options(useGeneratedKeys = true, keyProperty = "user.u_no")
    @InsertProvider(type = UserSQL.class, method = "insertEmptyUser")
    void insertEmptyUser( @Param("user") UsersVO user);

    @InsertProvider(type = UserSQL.class, method = "insertBySNS")
    void insertBySNS(@Param("snsID") String snsID, @Param("user") UsersVO user);

    @UpdateProvider(type = UserSQL.class, method = "updateUserNickPhone")
//    int update(HashMap<String, Object> user_map);
    int updateUserNickPhone(@Param("user") Users user);

    @DeleteProvider(type = UserSQL.class, method = "deleteUser")
    int delete(int u_no);

    @SelectProvider(type = UserSQL.class, method = "nickCheck")
    int nickCheck(String u_nick);
    // �땳�꽕�엫 以묐났泥댄겕
    @SelectProvider(type = UserSQL.class, method = "check_mail")
    int check_mail(String u_mail);
    //�씠硫붿씪 以묐났泥댄겕
	@InsertProvider(value = UserSQL.class, method = "pw_check")
    String pw_check(String no);
	
    //이메일 중복체크
    @SelectProvider(type = UserSQL.class, method = "findID")
    String findID(String name, String jumin);
    
    @SelectProvider(type = UserSQL.class, method = "userList")
    List<Users> userList();
    
    @SelectProvider(type = UserSQL.class, method = "userInfo")
    List<Users> userInfo(String u_no);

    @SelectProvider(type = UserSQL.class, method = "getBook")
    List<BookingRoomGhouseUsers> getBook(String u_no);
}
