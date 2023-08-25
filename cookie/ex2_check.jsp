<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_check</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
			out.print("쿠키 이름 : " + cookie.getName() + "<br>");
			out.print("쿠키 값 : " + cookie.getValue() + "<br><br>");
		}
	%>
</body>
</html>









