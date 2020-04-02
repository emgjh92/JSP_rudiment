<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<!-- 회원 양식 -->
	<form action="./join_member_process.jsp" method="post">
		ID : <input type="text" name="id"><br>
		PW : <input type="password" name="pw"><br>
		NICK : <input type="text" name="nick"><br>
		Phone : <input type="text" name="phone"><br>
	<input type="submit" value="회원가입"><br>
	</form>
	
</body>
</html>