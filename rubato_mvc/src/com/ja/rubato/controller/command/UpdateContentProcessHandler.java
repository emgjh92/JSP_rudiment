package com.ja.rubato.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.rubato.model.BoardDao;

//+++++++++++++++++++++++++++++++++20200421 코드 추가+++++++++++++++++++++++++++++++++++++++
public class UpdateContentProcessHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		/*
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		int b_read_count = Integer.parseInt(request.getParameter("b_read_count"));
		b_read_count++;
		new BoardDao().update2(b_no, b_read_count);*/
		return "redirect:./board_list.do";
	}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}
