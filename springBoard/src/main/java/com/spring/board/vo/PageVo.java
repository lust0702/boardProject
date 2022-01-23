package com.spring.board.vo;

public class PageVo {
	
	private int pageNo = 0;
	private String[] CodeId;
	
	public String[] getCodeId() {
		return CodeId;
	}

	public void setCodeId(String[] codeId) {
		this.CodeId = codeId;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
}
