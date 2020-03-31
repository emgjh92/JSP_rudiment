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
	
	<!-- 
		get 방식 : URL에 정보 노출이 된다, 값의 크기 한계 존재 (URL로 천만줄을 넘길 순 없다), 한글 처리 까다로움 (URL Encoder 사용)
		post 방식 : URL에 정보 노출이 되지 않는다, 값의 크기 한계 존재하지 않음, 한글 처리 쉬움
	-->

	<form action="./join_member_process.jsp" method="post">
		ID : <input type="text" name="id"><br>
		PW : <input type="password" name="pw"><br>
		NICK : <input type="text" name="nick"><br>
		Phone : <input type="text" name="phone"><br>
	<input type="submit" value="회원가입"><br>
	</form>

</body>
</html>