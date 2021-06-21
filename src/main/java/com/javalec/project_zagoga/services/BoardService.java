package com.javalec.project_zagoga.services;

import com.javalec.project_zagoga.dto.Board;
import com.javalec.project_zagoga.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BoardService {
	private final BoardMapper boardMapper;
	public BoardService(BoardMapper boardMapper) {

		this.boardMapper=boardMapper;
	}
	
	public List<Board> getList(){

		return this.boardMapper.getList();
	}
}
