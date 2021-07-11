package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.Ghouse;
import com.javalec.project_zagoga.dto.GhouseRoom;
import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.dto.RoomImages;
import com.javalec.project_zagoga.mapper.sql.*;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.vo.HostVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface HostMapper {

    @SelectProvider(type = HostSQL.class, method = "loadUserBySecurityNo")
    HostVO loadUserBySecurityNo(@Param("sc_no") int sc_no);

    @SelectProvider(type = HostSQL.class, method = "loadForFindWD")
    int loadForFindWD(@Param("authValue") AuthValue authValue, @Param("name") String name, @Param("jumin") String jumin);

    @InsertProvider(type = HostSQL.class, method = "insertHost")
    void insertHost(@Param("authValue") AuthValue authValue, @Param("host") Host host);

    @SelectProvider(type = HostSQL.class, method = "findID")
    String findID(String name, String jumin);

	/*@InsertProvider(value = HostSQL.class, method = "pw_check")
    String pw_check(String no);*/

    @SelectProvider(type = HostSQL.class, method = "getOneHost")
    HostVO getOneHost(int h_no);

    @UpdateProvider(type = HostSQL.class, method = "updateInfo")
    int updateInfo(@Param("host") Host host);

    @SelectProvider(type = HostSQL.class, method = "hostList")
    List<HostVO> hostList();

    @SelectProvider(type = HostSQL.class, method = "myGhouse")
    Ghouse myGhouse(int h_no);

//    @SelectProvider(type = HostSQL.class, method = "myPageGhouseInfo")
//    Ghouse myPageGhouseInfo(String h_no);

    @DeleteProvider(type = HostSQL.class, method = "HostGhouseDelete")
    void HostGhouseDelete(int gh_no, int h_no);

    @SelectProvider(type = HostSQL.class, method = "roomAndGhouse")
    List<GhouseRoom> roomAndGhouse(String h_no);

    @SelectProvider(type = HostSQL.class, method = "mypageRoomInfo")
    List<RoomImages> mypageRoomInfo(@Param("r_no")int r_no);
}
