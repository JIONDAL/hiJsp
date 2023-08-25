<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_result</title>
</head>
<body>
	<%
//	내장객체	HttpServletRequest request = new HttpServletRequest();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		out.print("아이디 : " + id + "<br>");
		out.print("비밀번호 : " + pw + "<br>");
	%>
</body>
</html>







