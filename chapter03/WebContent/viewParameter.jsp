<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head><title>요청 파라미터 출력</title></head>
<body>
<b>request.getParameter() 메서드 사용</b><br>
name 파라미터 = <%= request.getParameter("name") %> <br>
address 파라미터 = <%= request.getParameter("address") %>
pet 파라미터 = <%= request.getParameter("pet") %>
<br>
두개값 이상 받기...
<%
	String[] pets = request.getParameterValues("pet");
	
	for(String pet : pets){
		out.println(pet + "<br>");
	}
%>

<br>
Enum 객체 사용하기<br>

<%
	Enumeration<String> names = request.getParameterNames();
	
	while(names.hasMoreElements()){
		String name = names.nextElement();
		String value = request.getParameter(name);
		
		out.println(name + ":" + value + "<br>");		
	}
%>


<br>
MAP객체 사용하기 <br>
<%
	Map<String, String[]> map = request.getParameterMap();
	String [] values = map.get("address");
	if (values != null) {
%>
	name = <%= values[0] %>
<%
	}
%>

</body>
</html>