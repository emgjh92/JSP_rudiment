package com.ja.freeboard.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.freeboard.model.BoardDao;

public class DeleteContentProcessHandler implements CommandHandler {
//+++++++++++++++++++++++++++++++++20200421 코드 추가+++++++++++++++++++++++++++++++++++++++
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		new BoardDao().delete(b_no);
		
		
		return "redirect:./main_page.do";
	}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}
