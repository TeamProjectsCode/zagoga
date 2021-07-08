package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.Host;
import com.javalec.project_zagoga.vo.AdminVO;
import com.javalec.project_zagoga.mapper.sql.AdminSQL;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

@Mapper
public interface AdminMapper {

    @SelectProvider(type = AdminSQL.class, method = "loadUserBySecurityNo")
    AdminVO loadUserBySecurityNo(@Param("sc_no") int sc_no);


}
