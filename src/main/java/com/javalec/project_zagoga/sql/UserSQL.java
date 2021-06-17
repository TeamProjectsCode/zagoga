package com.javalec.project_zagoga.sql;

import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class UserSQL {

    private static final String TABLE = "USERS";

    public static final String GET_USERS_LIST = "select * from "+TABLE;

//    작성 방법은 아래 페이지 참조
//    https://mybatis.org/mybatis-3/ko/statement-builders.html
    public String checkUserMailAndPwd(String u_mail, String u_pwd) {
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("U_MAIL = #{u_mail}")
                .AND()
                .WHERE("U_PWD = #{u_pwd}")
                .toString();
    }


    public String getUserByUNo(int u_no) {
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("U_NO = #{u_no}")
                .toString();
    }

    public String insertUser(Map<String, Object> user_map) {
        return new SQL() {{
            INSERT_INTO(TABLE);
            for(String key: user_map.keySet()){
                if(key.equals("u_no")){ continue; }
                VALUES(key.toUpperCase(), "#{"+key+"}");
            }
//
//            VALUES("U_MAIL", "#{u_mail}");

        }}.toString();
    }

}
