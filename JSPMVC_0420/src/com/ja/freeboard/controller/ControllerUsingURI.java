package com.ja.freeboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.freeboard.controller.command.CommandHandler;

/**
 * Servlet implementation class ControllerUsingURI
 */
//@WebServlet("/ControllerUsingURI") 
//web.xml에서 대신 설정
public class ControllerUsingURI extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommandFactory commandFactory; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerUsingURI() {
        super();
        // TODO Auto-generated constructor stub
        commandFactory = new CommandFactory();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("넘어온 명령어" + request.getRequestURI());
		
		
		//프로젝트 명 지우기 (URI에 넘어오는 값에서 프로젝트 명(/JAVAMVC_0420) 지우기)
		String command = request.getRequestURI();
		//command.substring("/JSPMVC_0420".length()); //이런식도 가능하긴 하나 가변길이에 대처하기 어렵다
		command = command.substring(request.getContextPath().length());
		
		System.out.println("명령어 : " + command);
		
		
		
		CommandHandler handler = commandFactory.getCommandHandler(command);
		
		String view = null;
		
		if(handler != null) {
			view = handler.process(request, response);
		}else {
			System.out.println("[경고]명령어에 매핑된 객체가 없습니다");
		}
		
		if(view != null) {
			if(view.startsWith("redirect:")) {
				
				view = view.substring("redirect:".length()); //문자열 앞의 redirect: 짤라내기
				
				response.sendRedirect(view); 
				
				//redirect 의 경우
			}
			else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
				
				//forwarding 의 경우
			}
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
