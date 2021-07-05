package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.mapper.sql.HostSQL;
import com.javalec.project_zagoga.mapper.sql.UserSQL;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

@Mapper
public interface HostMapper {

    @InsertProvider(value = HostSQL.class, method = "insertHost")
    public void insertHost(@Param("host")Host host);

    @SelectProvider(type = HostSQL.class, method = "findID")
    String findID(String name, String jumin);
}
