package com.javalec.project_zagoga.mapper.sql;

import com.javalec.project_zagoga.dto.Host;
import org.apache.ibatis.jdbc.SQL;

public class HostSQL {
    private static final String TABLE = "HOST";
    private static final String GET_ALL_HOST = "select * from "+TABLE;

    public String insertHost(Host host){
        return new SQL().toString();
    }

    public String findID(String name, String jumin){ // 아아디 찾기
        return new SQL()
                .SELECT("H_EMAIL")
                .FROM(TABLE)
                .WHERE("H_NAME=#{name} AND H_JUMIN=#{jumin}")
                .toString();
    }
    
}


