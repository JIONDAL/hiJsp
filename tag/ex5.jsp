<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex5</title>
</head>
<body>
	<%
	for(int i = 1; i < 7; i++)
		out.print( String.format("<h%d> h%d : Hello JSP </h%d>", i, i, i));
	%>
</body>
</html>