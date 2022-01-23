package com.spring.board.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}
	
	@Override
	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.selectBoardList(pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCnt();
	}
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		
		int[] results= new int[boardVo.getBoardWriteList().size()];
		int result=1;
		
		for(int i=0; i<boardVo.getBoardWriteList().size();i++) {
			results[i]=boardDao.boardInsert(boardVo.getBoardWriteList().get(i));
			result *= results[i];
		}
		
		return result;
		
//		return boardDao.boardInsert(boardVo);
	}
	
//	ADD CODE
	
	public void boardUpdate(BoardVo boardVo) throws Exception {
		boardDao.boardUpdate(boardVo);
	}
	
	public void boardDelete(int boardNum) throws Exception {
		boardDao.boardDelete(boardNum);
	}
	
	@Override
	public List<ComCodeVo> codeIdNameList() throws Exception {
		return boardDao.codeIdNameList();
	}	
	
	

//	
	
}
