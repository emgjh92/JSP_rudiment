package com.ja.rubato.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.rubato.controller.command.CommandHandler;

public class LogoutProcessHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request,HttpServletResponse response){
		request.getSession().invalidate(); //세션 invalidate (로그아웃)
		
		return "redirect:./index.do";
		
	}
}

