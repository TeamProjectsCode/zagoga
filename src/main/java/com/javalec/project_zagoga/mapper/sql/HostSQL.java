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
/*    public String pw_check(String no) {
    	return new SQL()
    			.SELECT("U_PWD")
    			.FROM(TABLE)
    			.WHERE("U_NO = #{no}")
    			.toString();
    }*/

    public String getOneHost(int h_no) {
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("H_NO = #{h_no}")
                .toString();
    }

    public String updateInfo(Host host) {
        return new SQL()
                .UPDATE(TABLE)
                .SET("H_BANK = #{host.h_bank}")
                .SET("H_PHONE = #{host.h_phone}")
                .WHERE("H_NO = #{host.h_no}")
                .toString();
    }

    public String findID(String name, String jumin){ // �븘�븘�뵒 李얘린
        return new SQL()
                .SELECT("H_MAIL")
                .FROM(TABLE)
                .WHERE("H_NAME=#{name} AND H_JUMIN=#{jumin}")
                .toString();
    }
    public String hostList() {
    	return new SQL()
    			.SELECT("*")
    			.FROM(TABLE)
    			.toString();
    }

    public String myGhouse(int h_no){
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .toString();
    }

//    public String myPageGhouseInfo(String h_no){
//        return new SQL()
//                .SELECT()
//    }

    public String HostGhouseDelete(int gh_no, int h_no){
        return new SQL()
                .DELETE_FROM("IMAGES")
                .WHERE("I_HNO = #{h_no}")
                .toString();
    }

    public String roomAndGhouse(String h_no){
        return new SQL()
                .SELECT("*")
                .FROM("GHOUSE")
                .JOIN("ROOMS R on GHOUSE.GH_NO = R.R_GHNO")
                .WHERE("GH_HNO = #{h_no}")
                .ORDER_BY("R_NO")
                .toString();
    }

    public String mypageRoomInfo(int r_no){
        return new SQL()
                .SELECT("*")
                .FROM("ROOMS")
                .JOIN("IMAGES I on ROOMS.R_NO = I.I_RNO")
                .WHERE("I_RNO = #{r_no}")
                .ORDER_BY("I_NO DESC")
                .toString();
    }
    public String hostInfo(String h_bizno) {
    	return new SQL()
    			.SELECT("*")
    			.FROM(TABLE)
    			.WHERE("H_BIZNO = #{h_bizno}")
    			.toString();
    }

    public String ImagesDelete(int r_no){
        return new SQL()
                .DELETE_FROM("IMAGES")
                .WHERE("I_RNO = #{r_no}")
                .toString();
    }
    public String RoomDelete(int r_no){
        return new SQL()
                .DELETE_FROM("ROOMS")
                .WHERE("R_NO = #{r_no}")
                .toString();
    }
    public String getHostByNo(int h_no) {
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("H_NO = #{h_no}")
                .toString();
    }

    public String admin_approve(int h_no){
        return new SQL()
                .UPDATE(TABLE)
                .SET("H_ACTIVE= 1")
                .WHERE("H_NO=#{h_no}")
                .toString();
    }
    public String admin_reject(int h_no){
        return new SQL()
                .UPDATE(TABLE)
                .SET("H_ACTIVE= 2")
                .WHERE("H_NO=#{h_no}")
                .toString();
    }
}


