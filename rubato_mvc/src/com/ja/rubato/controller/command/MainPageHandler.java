package com.ja.rubato.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.rubato.model.*;
import com.ja.rubato.vo.*;


import java.util.*;

public class MainPageHandler implements CommandHandler {
	//************************20200421 코드 추가********************************
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		int pagenumber;
		ArrayList<BoardVo> boardlist;
		ArrayList<ContentDataVo> contentList = new ArrayList<ContentDataVo>();
		
		try {
			pagenumber = Integer.parseInt(request.getParameter("paging"));
		} catch (NumberFormatException e) {
			pagenumber=1;
		} //그냥 board_list 로만 끝내도 되도록 exception 처리
		boardlist = new BoardDao().paging(pagenumber);

		
		MemberDao memberDao = new MemberDao();
		BoardDao boardDao = new BoardDao();
		int count = boardDao.count();
		
		for(BoardVo boardVo : boardlist) {
			//코드상의 JOIN
			MemberVo memberVo = memberDao.selectByNo(boardVo.getM_no());
			
			ContentDataVo contentDataVo = new ContentDataVo(memberVo,boardVo);
			
			contentList.add(contentDataVo);
			
		
		}
		
		request.setAttribute("contentList", contentList);
		request.setAttribute("boardlist", boardlist);

		request.setAttribute("count", count);
		//request.setAttribute("pagenumber", pagenumber);

		return "/WEB-INF/view/board_list.jsp";
	}
	//************************************************************************
}
