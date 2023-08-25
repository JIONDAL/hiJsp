<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){%>
	<form action="loginService.jsp" method="post">
		<input type="text" placeholder="아이디" name="id"> <br>
		<input type="password" placeholder="비밀번호" name="pw" ><br> 
		<input type="submit" value="로그인" >
		<input type="button" value="취소" onclick="location.href='index.jsp'">
	</form>
	<%}else{%>
		<%=id %>님이 로그인 했습니다.<br>
		<button onclick="location.href='index.jsp'">초기 화면</button>
	<%} %>
</body>
</html>










