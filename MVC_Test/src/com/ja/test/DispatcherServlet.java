package com.ja.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.test.handler.MainPageHandler;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//System.out.println(request.getRequestURI());
		
		String view = null;
		
		if(request.getRequestURI().equals("/MVC_Test/main_page.do")) {
			view = new MainPageHandler().process(request, response);
		}else if(request.getRequestURI().equals("/MVC_Test/read_page.do")) {
			//....
		}
		
		if(view != null) {
			
			if(view.contains("redirect:")) {
				view = view.substring(view.indexOf("redirect:"));
				response.sendRedirect(view);
			}else {
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(view);
		        dispatcher.forward(request, response);
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
