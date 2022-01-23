package com.spring.board.dao;

import java.util.List;
import java.util.Map;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

public interface BoardDao {

	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(BoardVo boardVo) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;
	
//	ADD CODE
	
	public void boardUpdate(BoardVo boardVo) throws Exception;
	
	public void boardDelete(int boardNum) throws Exception;
	
	public List<ComCodeVo> codeIdNameList() throws Exception;
	
	public BoardVo selectBoardType(BoardVo boardVo) throws Exception;
	
//	

}