<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%

    	//     setAttribute ==> (키, 값)
    	
    	pageContext.setAttribute("v1","안녕하세요");
    	request.setAttribute("v1", "반갑습니다");
    	session.setAttribute("v1","잘부탁드려요");
    	application.setAttribute("v1","브리기테");
    	
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=pageContext.getAttribute("v1") %><br>
	<%=request.getAttribute("v1") %><br>
	<%=session.getAttribute("v1") %><br>
	<%=application.getAttribute("v1") %><br>

</body>
</html>