package com.javalec.project_zagoga.sql;

import org.apache.ibatis.jdbc.SQL;

public class UserSQL {

    private static final String TABLE = "users";

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

//    public String insertUser() {
//        return new SQL()
//                .INSERT_INTO(TABLE)
//                .VALUES("U_MAIL", "#{}")
//                .VALUES()
//                .toString();
//    }


}
