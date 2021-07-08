package com.javalec.project_zagoga.mapper.sql;

import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.vo.HostVO;
import org.apache.ibatis.jdbc.SQL;

public class HostSQL {
    private static final String TABLE = "HOST";
    private static final String GET_ALL_HOST = "select * from "+TABLE;

    public String loadUserBySecurityNo(int sc_no) {
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("H_NO = #{sc_no}")
                .toString();
    }

    public String loadForFindWD(AuthValue authValue, String name, String jumin) {
        return new SQL()
                .SELECT("count(*)")
                .FROM(TABLE)
                .WHERE("SC_NO = #{authValue.sc_no}")
                .AND()
                .WHERE("H_NAME = #{name}")
                .AND()
                .WHERE("H_JUMIN = #{jumin}")
                .toString();
    }

    public String insertHost(AuthValue authValue, Host host){
        return new SQL()
                .INSERT_INTO(TABLE)
                .VALUES("H_NO", "#{authValue.sc_no}")
                .VALUES("H_MAIL", "#{authValue.username}")
                .VALUES("H_BRAND", "#{host.h_brand}")
                .VALUES("H_BIZNO", "#{host.h_bizno}")
                .VALUES("H_NAME", "#{host.h_name}")
                .VALUES("H_JUMIN", "#{host.h_jumin}")
                .VALUES("H_PHONE", "#{host.h_phone}")
                .VALUES("H_BANK", "#{host.h_bank}")
                .toString();
    }
    public String pw_check(String no) {
    	return new SQL()
    			.SELECT("U_PWD")
    			.FROM(TABLE)
    			.WHERE("U_NO = #{no}")
    			.toString();
    }

    public String findID(String name, String jumin){ // 아아디 찾기
        return new SQL()
                .SELECT("H_MAIL")
                .FROM(TABLE)
                .WHERE("H_NAME=#{name} AND H_JUMIN=#{jumin}")
                .toString();
    }
    
}


