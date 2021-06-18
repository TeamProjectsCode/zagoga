package com.javalec.project_zagoga.mapper;

import com.javalec.project_zagoga.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface BoardMapper {
	
	@Select("SELECT * FROM GHOUSE")
	public List<Board> getList();
}
