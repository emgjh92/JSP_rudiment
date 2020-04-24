package com.ja.rubato.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.rubato.model.BoardDao;

//+++++++++++++++++++++++++++++++++20200421 코드 추가+++++++++++++++++++++++++++++++++++++++
public class UpdateContentProcessHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String b_title = request.getParameter("b_title");
		String b_content = request.getParameter("b_content");
		
		new BoardDao().update(b_no, b_title, b_content);
		
		return "redirect:./board_list.do";
	}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}
