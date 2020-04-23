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

		ArrayList<ContentDataVo> contentList = new ArrayList<ContentDataVo>();
		ArrayList<BoardVo> boardlist = new BoardDao().selectAll();
		
		MemberDao memberDao = new MemberDao();
		
		for(BoardVo boardVo : boardlist) {
			//코드상의 JOIN
			MemberVo memberVo = memberDao.selectByNo(boardVo.getM_no());
			
			ContentDataVo contentDataVo = new ContentDataVo(memberVo,boardVo);
			
			contentList.add(contentDataVo);
			
		
		}
		
		request.setAttribute("contentList", contentList);

		return "/WEB-INF/view/board_list.jsp";
	}
	//************************************************************************
}
