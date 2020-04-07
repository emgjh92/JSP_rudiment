<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("홍길동", "utf-8"));
	response.addCookie(cookie);
	
	Cookie cookie1 = new Cookie("name","qqqqqq");
	response.addCookie(cookie1);
	
	Cookie cookie2 = new Cookie("v1","hello");
	response.addCookie(cookie2);
	
	Cookie cookie4 = new Cookie("name","ddddd");
	cookie4.setMaxAge(60); //60초 후에 브라우저에서 쿠키 expire
	response.addCookie(cookie4);
	
%>
<html>
<head><title>쿠키생성</title></head>
<body>

<%= cookie.getName() %> 쿠키의 값 = "<%= cookie.getValue() %>"
</body>
</html>