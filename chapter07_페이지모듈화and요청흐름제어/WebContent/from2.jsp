<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String v1 = request.getParameter("v1");
	
	request.setAttribute("test1", "한조");

	if(v1 == null || v1.equals("r")){
		response.sendRedirect("./to.jsp");		
	}else{
%>
	<jsp:forward page="/to.jsp"></jsp:forward>
<%
	}
%>
<%--
/from2.jsp?v1=f   ==> 결과 : 한조
/from2.jsp        ==> 결과 : null
--%>