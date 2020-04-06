<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- 
	
	
	null
	null
	잘부탁드려요	
	브리기테
	==> scope1.jsp 을 실행 시킨 후 url 에서 scope2.jsp로 바꾼 경우 결과값
	
	null
	null
	null
	브리기테
	===> 위 과정을 거친 후 새로운 종류의 브라우저에서 scope2.jsp 를 킨 경우 결과 값
	===> 브라우저 별로 세션을 관리하기 때문
	
	 -->
</body>
</html>