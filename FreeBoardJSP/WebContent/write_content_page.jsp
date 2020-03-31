<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String sessionNick = (String)session.getAttribute("sessionNick");

/* 
DB 내용

CREATE TABLE FB_Board(
    b_no NUMBER(8),
    m_no NUMBER(8),
    b_title VARCHAR2(400),
    b_content VARCHAR2(1000),
    b_writedate DATE
);

CREATE sequence FB_Board_seq;

INSERT INTO FB_Board VALUES(
FB_Board_seq.nextval,1,'제목입니다','내용입니다',SYSDATE
);


select * from FB_Board;

*/
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="./write_content_process.jsp" method="post">
		작성자 : <%=sessionNick %><br>
		제목 : <input type="text" name="title"><br>
		내용 : <br>
		<textarea rows="7" cols="40" name="content"></textarea><br>
		<input type="submit" value="작성완료">
	</form>
</body>
</html>