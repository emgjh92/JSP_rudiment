<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 생성</title>
</head>
<body>

<form action="/chapter03/viewParameter.jsp" method="post">
<!-- <form action="./chap03/viewParameter.jsp" method="get"> -->
<!-- <form action="http://localhost:8181/chap03/viewParameter.jsp" method="get"> -->

이름 : <input type="text" name="name" size="10"><br>
주소 : <input type="text" name="address" size="30"><br>

좋아하는 동물 :
 	<input type="checkbox" name="pet" value="dog"> 강아지
	<input type="checkbox" name="pet" value="cat"> 고양이
	<input type="checkbox" name="pet" value="pig"> 돼지
<br>
<input type="submit" value="전송">
</form>



</body>
</html>