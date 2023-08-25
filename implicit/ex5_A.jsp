<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex5_A</title>
</head>
<body>
	<%
		//http://localhost:8085/jsp_exam/implicit/ex5_A.jsp
		request.getRequestDispatcher("ex5_B.jsp").forward(request, response);
	%>
</body>
</html>