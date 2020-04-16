<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session.setAttribute("nick", "한조");
    	request.setAttribute("xxx",1);
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	${nick } 님 환영 합니다. <br>
	
	${empty id } <br> <!-- true -->
	${!empty id } <br> <!-- false -->
	
	${sessionNick == writer } <br> <!-- 예시로 이런 것도 가능하다 -->
	<!-- 여기선 두쪽다 선언 안된 false=false 라서 true로 뜬다 -->
	<!-- 
	${sessionNick == writer && aaa ==bb } 	
	 --> <!-- 이런식으로도 가능하다 -->
	 
	${xxx + 4} <br>  <!-- 어느정도의 연산 또한 가능하다 -->
	
</body>
</html>