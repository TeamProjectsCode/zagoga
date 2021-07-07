package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.security.AuthValue;
import com.javalec.project_zagoga.vo.HostVO;
import com.javalec.project_zagoga.mapper.sql.HostSQL;
import com.javalec.project_zagoga.mapper.sql.UserSQL;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

@Mapper
public interface HostMapper {

    @SelectProvider(type = HostSQL.class, method = "loadUserBySecurityNo")
    HostVO loadUserBySecurityNo(@Param("sc_no") int sc_no);

    @SelectProvider(type = HostSQL.class, method = "loadForFindWD")
    int loadForFindWD(@Param("authValue") AuthValue authValue, @Param("name") String name, @Param("jumin") String jumin);

    @InsertProvider(value = HostSQL.class, method = "insertHost")
    void insertHost(@Param("authValue") AuthValue authValue, @Param("host") Host host);

    @SelectProvider(type = HostSQL.class, method = "findID")
    String findID(String name, String jumin);
}
