<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3_make</title>
<style>
	a{
		text-decoration:none;
		color : black
	}
</style>
</head>
<body>
	<%
		session.setAttribute("id", "user");
		session.setAttribute("likes", new String[]{"집에 있기", "잠을 많이 자기"});
	%>
	<a href="ex3_result.jsp" >세션 확인하러 가기 </a>
</body>
</html>











