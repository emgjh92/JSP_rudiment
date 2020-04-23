package com.ja.rubato.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginPageHandler implements CommandHandler{
	
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
			
		//return "redirect:/main_page.do";
		return "/WEB-INF/view/index.jsp";
	}
}
