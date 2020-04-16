<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- https://tomcat.apache.org/download-taglibs.cgi 의 jar 파일들을 lib에 넣어주자 -->
    <%
   		session.setAttribute("sessionNick", "한조");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- p1.jsp과 같은 내용을 JSTL을 써서 만들어 보자 -->
	
	<c:if test="${!empty sessionNick}">
		${sessionNick }님 환영합니다. <br>
	</c:if>
	
	<c:if test="${empty sessionNick}">
		비회원으로 접근하였습니다. <br>
	</c:if>
	
	
	<c:choose>
		<c:when test="${!empty sessionNick}">
			${sessionNick }님 환영합니다 <br>
		</c:when>
		<c:otherwise>
			비회원으로 접근하였습니다.<br>
		</c:otherwise>
	</c:choose>
	
	
	
</body>
</html>