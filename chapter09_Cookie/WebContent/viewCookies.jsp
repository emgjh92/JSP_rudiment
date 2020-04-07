<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Cookie [] arr = request.getCookies();
	
	if(arr != null){
	for(Cookie c : arr){
		out.print(c.getName() + "=" + c.getValue());
		out.print("<br>");
		}	
	}

%>

</body>
</html>


