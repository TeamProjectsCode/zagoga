package com.javalec.project_zagoga.mapper.sql;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javalec.project_zagoga.dto.Users;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.vo.UsersVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

import java.util.HashMap;

public class UserSQL {

    private static final String TABLE = "USERS";
    private static final String SNS_TABLE = "SNS_USERS";

    public static final String GET_USERS_LIST = "select * from "+TABLE;

//    �옉�꽦 諛⑸쾿�� �븘�옒 �럹�씠吏� 李몄“
//    https://mybatis.org/mybatis-3/ko/statement-builders.html
//    public String loadUserByName(String username) {
//        return new SQL()
//                .SELECT("U_MAIL")
//                .FROM(TABLE)
//                .WHERE("U_MAIL = #{username}")
//                .toString();
//    }

    public String loadUserBySecurityNo(int sc_no) {
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("SC_NO = #{sc_no}")
                .toString();
    }

    public String loadForFindWD(AuthValue authValue, String name, String jumin) {
        return new SQL()
                .SELECT("count(*)")
                .FROM(TABLE)
                .WHERE("SC_NO = #{authValue.sc_no}")
                .AND()
                .WHERE("U_NAME = #{name}")
                .AND()
                .WHERE("U_JUMIN = #{jumin}")
                .toString();
    }

    public String loadUserBySNS(String snsID) {
        System.out.println("loadUserBySNS: "+snsID);
        return new SQL()
                .SELECT(TABLE+".*")
                .FROM(TABLE)
                .JOIN(SNS_TABLE+" SNS on "+TABLE+".U_NO = SNS.U_NO" )
                .WHERE("SNS.ID = #{snsID}")
                .toString();
//        �뀒�씠釉� 留뚮뱾�뼱�꽌 議곗씤 臾� �솗�씤�븯怨� �옉�꽦�븯湲�
    }


    public String getUserByUNo(int u_no) {
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("U_NO = #{u_no}")
                .toString();
    }


    public String insertUser(AuthValue authValue, Users user) {
        return new SQL()
                .INSERT_INTO(TABLE)
                .VALUES("SC_NO", "#{authValue.sc_no}")
                .VALUES("U_MAIL", "#{authValue.username}")
                .VALUES("U_NAME", "#{user.u_name}")
                .VALUES("U_NICK", "#{user.u_nick}")
                .VALUES("U_GENDER", "#{user.u_gender}")
                .VALUES("U_JUMIN", "#{user.u_jumin}")
                .VALUES("U_PHONE", "#{user.u_phone}")
                .toString();
    }

    public String insertEmptyUser(UsersVO user) {
        return new SQL()
                .INSERT_INTO(TABLE)
                .VALUES("U_MAIL", "#{user.u_mail}")
                .VALUES("U_NAME", "#{user.u_name}")
                .VALUES("U_NICK", "#{user.u_nick}")
                .VALUES("U_GENDER", "#{user.u_gender}")
                .VALUES("U_JUMIN", "#{user.u_jumin}")
                .VALUES("U_PHONE", "#{user.u_phone}")
                .toString();
    }

    public String insertBySNS(String snsID, UsersVO user) {
        return new SQL() {{
            INSERT_INTO(SNS_TABLE);
            VALUES("ID", "#{snsID}");
            VALUES("U_NO", "#{user.u_no}");
        }}.toString();
    }

    public String updateUserNickPhone(Users user) {
        return new SQL() {{
            UPDATE(TABLE);
            SET("U_NICK = #{user.u_nick}");
//            SET("U_PWD = #{user.u_pwd}");
//            SET("U_GENDER = #{user.u_gender}");
//            SET("U_JUMIN = #{user.u_jumin}");
            SET("U_PHONE = #{user.u_phone}");
            WHERE("U_NO = #{user.u_no}");
        }}.toString();
    }

    public String deleteUser(int u_no) {
        return new SQL()
                .DELETE_FROM(TABLE)
                .WHERE("U_NO = #{u_no}")
                .toString();
    }

    public String nickCheck(String u_nick){
        return new SQL()
                .SELECT("count(*)")
                .FROM(TABLE)
                .WHERE("U_NICK = #{U_NICK}")
                .toString();
    }

    public String check_mail(String u_mail){
        return new SQL()
                .SELECT("count(*)")
                .FROM(TABLE)
                .WHERE("U_MAIL=#{U_MAIL}")
                .toString();
    }
    public String findID(String name,String jumin){
        return new SQL()
                .SELECT ("U_MAIL")
                .FROM(TABLE)
                .WHERE("U_NAME=#{name} AND U_JUMIN=#{jumin}")
                .toString();
    }
    public String pw_check(String no) {
    	return new SQL()
    			.SELECT("U_PWD")
    			.FROM(TABLE)
    			.WHERE("U_NO = #{no}")
    			.toString();
    }
    public String userList() {
    	return new SQL()
    			.SELECT("*")
    			.FROM(TABLE)
    			.toString();
    }

}
