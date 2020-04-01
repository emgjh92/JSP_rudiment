<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
내용 리스트 : <br>

<%
	String query ="select * from Test_0330";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Statement stm = conn.createStatement(); //접속 후 실행과 관련된 statement를 실행하는 것
	
	ResultSet rs = stm.executeQuery(query);
	
	while(rs.next()){
		String content = rs.getString("t_content");
		String date = rs.getString("t_write_date");
		
		out.println("내용 : " + content + ", 작성일 : "+ date);
		out.println("<br>");
	}

%>
<a href="./input.jsp">글 입력</a>
</body>
</html>