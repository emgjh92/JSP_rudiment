package com.ja.freeboard.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.freeboard.model.*;
import com.ja.freeboard.vo.*;
import java.util.*;

public class MainPageHandler implements CommandHandler {
	//************************20200421 코드 추가********************************
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<ContentDataVo> contentList = new ArrayList<ContentDataVo>();
		ArrayList<BoardVo> boardlist = new BoardDao().selectAll();
		
		MemberDao memberDao = new MemberDao();
		
		for(BoardVo boardVo : boardlist) {
			//코드상의 JOIN
			MemberVo memberVo = memberDao.selectByNo(boardVo.getM_no());
			
			ContentDataVo contentDataVo = new ContentDataVo(memberVo,boardVo);
			
			contentList.add(contentDataVo);
			
		}
		
		//request.getSession().setAttribute("contentList", contentList);
		//메모리에 세션이 소멸하지 않고 계속 유지가 된버린다. ==> 메모리 효율에 문제가 생긴다.
		
		request.setAttribute("contentList", contentList);

		return "/WEB-INF/view/main_page.jsp";
	}
	//************************************************************************
}
