package com.ja.rubato.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.rubato.model.*;
import com.ja.rubato.vo.*;


public class UpdateContentPageHandler implements CommandHandler {
//+++++++++++++++++++++++++++++++++20200421 코드 추가+++++++++++++++++++++++++++++++++++++++
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		BoardVo boardVo = new BoardDao().selectByNo(b_no);
		MemberVo memberVo = new MemberDao().selectByNo(boardVo.getM_no());
		
		ContentDataVo contentDataVo = new ContentDataVo(memberVo,boardVo);
		
		request.setAttribute("contentDataVo", contentDataVo);
		
		
		return "/WEB-INF/view/board_modify_page.jsp";
	}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

}
