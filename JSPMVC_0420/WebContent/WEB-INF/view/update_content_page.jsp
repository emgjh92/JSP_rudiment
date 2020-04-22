<!--++++++++++++++++20200421 페이지 추가++++++++++++++++-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시글 수정</h1>
<form action="./update_content_process.do" method="post">
	작성자 : ${contentDataVo.memberVo.m_nick }<br>
	제목 : <input name="b_title" type="text" value="${contentDataVo.boardVo.b_title }"><br>
	내용 : <br>
	<textarea name="b_content" rows="10" cols="40">${contentDataVo.boardVo.b_content }</textarea><br>
	<input name="b_no" type="hidden" value="${contentDataVo.boardVo.b_no }">
	<input type="submit" value="글 수정">
</form>

</body>
</html>