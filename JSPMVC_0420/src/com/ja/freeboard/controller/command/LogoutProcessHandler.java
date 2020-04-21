package com.ja.freeboard.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutProcessHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request,HttpServletResponse response){
		request.getSession().invalidate(); //세션 invalidate (로그아웃)
		
		return "redirect:./main_page.do";
		
	}
}
