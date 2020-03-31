<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	session.invalidate(); //세션을 날려버림
	
	response.sendRedirect("./main_page.jsp");
%>