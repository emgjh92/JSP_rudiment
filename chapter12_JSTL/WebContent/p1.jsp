<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session.setAttribute("sessionNick","한조");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String nick = (String)session.getAttribute("sessionNick");
	
	if(nick == null){
		out.println("비회원으로 접근하였습니다.");
	}else{
		out.println(nick+"님 환영합니다.");
	}
%>
</body>
</html>