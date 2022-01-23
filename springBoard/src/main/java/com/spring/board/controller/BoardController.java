package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	// �Խñ� ���
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(HttpServletRequest request,Locale locale, Model model,PageVo pageVo) throws Exception{
		
		// Type ��
		String[] codeId = request.getParameterValues("codeId");
		if (codeId != null) {
			for(int i=0; i<codeId.length; i++) {
				System.out.println("String[] codeId : "+codeId[i].toString());
			}
		}
		
		System.out.println(Arrays.toString(codeId));
		
		// ī�װ� �κ�
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		comCodeList = boardService.codeIdNameList();
		

		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);;
		}
		
		pageVo.setCodeId(codeId);
		
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}
	
	// �� ����
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	
	// �۾��� ������ �̵�
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception{
		
		// ī�װ� ��¿�
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		comCodeList = boardService.codeIdNameList();
		
		model.addAttribute("comCodeList", comCodeList);
		
		return "board/boardWrite";
	}
	
//	// �۾��� �׼�
//	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String boardWriteAction(Locale locale,BoardVo boardVo,PageVo pageVo
//			,@RequestParam(value="param[]") List<String> param[] ) throws Exception{
//		
//		int size = param.length;
//		System.out.println("param.length : " + param.length);
//		
//		for(int i=0; i<size; i++) {
//	        System.out.println("������ Ȯ�� : "+param[i]);
//	    }
//		
//		HashMap<String, String> result = new HashMap<String, String>();
//		CommonUtil commonUtil = new CommonUtil();
//		
//		int resultCnt = boardService.boardInsert(boardVo);
//		int page = 1;
//		
//		if(pageVo.getPageNo() == 0){
//			pageVo.setPageNo(page);
//		}
//		String pageNo = Integer.toString(pageVo.getPageNo());
//		
//		result.put("success", (resultCnt > 0)?"Y":"N");
//		result.put("pageNo", pageNo);
//		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
//		
//		System.out.println("callbackMsg::"+callbackMsg);
//		
//		return callbackMsg;
//	}

	
	  // �۾��� �׼�
	  
	  @RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	  @ResponseBody public String boardWriteAction(Locale locale,BoardVo boardVo,PageVo pageVo) throws Exception{
	  
	  HashMap<String, String> result = new HashMap<String, String>();
	  CommonUtil commonUtil = new CommonUtil();

	  int resultCnt = boardService.boardInsert(boardVo);
	  int page = 1;
	  
	  if(pageVo.getPageNo() == 0){
		  pageVo.setPageNo(page); 
	  }
	  
	  String pageNo = Integer.toString(pageVo.getPageNo());
	  
	  result.put("success", (resultCnt > 0)?"Y":"N");
	  result.put("pageNo", pageNo);
	  String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	  
	  System.out.println("callbackMsg::"+callbackMsg);
	  
	  return callbackMsg;
	  }
	  
	  @RequestMapping(value = "/board/boardWriteAction1.do", method = RequestMethod.POST)
	  @ResponseBody
	  public String boardWriteAction1(Locale locale,BoardVo boardVo,PageVo pageVo
		/* ,@RequestParam(value="param[]" ) List<BoardVo> param */) throws Exception{

		  HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();
			
			int resultCnt = boardService.boardInsert(boardVo);
			
			
//			System.out.println("Ÿ�� : " + boardVo.getBoardWriteList().get(0).getBoardType()
//								+ "Ÿ��Ʋ : " + boardVo.getBoardWriteList().get(0).getBoardTitle()
//								+ "���� : " + boardVo.getBoardWriteList().get(0).getBoardTitle()
//								+ "Cnt : " + boardVo.getBoardWriteList().get(0).getBoardTitle());

			
			  int page = 1;
			  
			  if(pageVo.getPageNo() == 0){
				  pageVo.setPageNo(page); 
			  }
			  
			  String pageNo = Integer.toString(pageVo.getPageNo());
			  
			  result.put("success", (resultCnt > 0)?"Y":"N");
			  result.put("pageNo", pageNo);
			  String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			  
			  System.out.println("callbackMsg::"+callbackMsg);
			  
			  return callbackMsg;
	  }
	 
	
	// �Խñ� ���� ��
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardModify.do", method = RequestMethod.GET)
	public String boardModify(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		comCodeList = boardService.codeIdNameList();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardModify";
	}
	
	
	// ������Ʈ
	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdate(BoardVo boardVo) throws Exception {
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = boardVo.getBoardNum();
		
		boardService.boardUpdate(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		
	}
	
	// ����
	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDelete(BoardVo boardVo) throws Exception {
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt;
		resultCnt =  boardVo.getBoardNum();
		
		boardService.boardDelete(resultCnt);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		
//		return "redirect:/board/boardList.do";
		
	}
	
	// ���
	@RequestMapping(value = "/board/boardHeader.do")
	public String boardHeader(){
		
		return "board/boardHeader";
	}
	
	// boardList �α��� ��ư
	@RequestMapping(value = "/board/userLogin.do")
	public String userLogin(){
		
		return "board/userLogin";
	}
	
	// boardList ȸ������ ��ư
	@RequestMapping(value = "/board/userJoin.do")
	public String userJoin(){
		
		return "board/userJoin";
	}
	
	
	// Ÿ����ȸ AJAX
		@RequestMapping(value="/board/boardTypeList.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
		@ResponseBody
		public String BoardTypeList(Locale locale,HttpServletRequest request,Model model) throws Exception {
			String[] boardType;
			boardType=request.getParameterValues("codeId");
			for(int i=0; i<boardType.length;i++) {
				System.out.println("Checked Type : [" + i + "] : " + boardType[i] );
			}
			
			
			PageVo pageVo = new PageVo();
			pageVo.setPageNo(1);
			pageVo.setCodeId(boardType); // ������vo �ڵ���̵� boardType �ֱ�
			
			List<BoardVo> boardList = new ArrayList<BoardVo>();
			boardList = boardService.SelectBoardList(pageVo);
			
			int totalCnt = 0;
			totalCnt = boardService.selectBoardCnt(); 
			
			HashMap<String, String> codeMap = new HashMap<String, String>();
			List<ComCodeVo> codeList = new ArrayList<ComCodeVo>();
			codeList = boardService.codeIdNameList();
			
			for(int i=0; i<4;i++) {
				codeMap.put(codeList.get(i).getCodeId(),codeList.get(i).getCodeName());
			}
			
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("list", boardList);
			result.put("totalCnt", totalCnt);
			result.put("codeMap", codeMap);
			
			String resultList = commonUtil.getJsonCallBackString(" ", result);
			System.out.println("resultList : " + resultList);
			
			model.addAttribute("codeMap",codeMap);
			model.addAttribute("totalCnt", totalCnt);
			return resultList;
		}
	

}
