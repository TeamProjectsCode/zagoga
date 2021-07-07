package com.javalec.project_zagoga.mapper.sql;

import org.apache.ibatis.jdbc.SQL;

public class AdminSQL {

    private static final String TABLE = "ADMIN";

    public String loadUserBySecurityNo(int sc_no) {
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("A_NO = #{sc_no}")
                .toString();
    }
}
