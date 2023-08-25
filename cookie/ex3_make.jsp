<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3_make</title>
</head>
<body>
	<%
		Cookie cookie = new Cookie("popup", "popup");
		cookie.setMaxAge(30); // 60 * 60 * 24 * 7
		response.addCookie(cookie);
	%>
	<script>window.close()</script>
</body>
</html>













