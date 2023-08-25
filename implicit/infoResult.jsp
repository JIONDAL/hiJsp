<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoResult</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String intro = request.getParameter("intro");
	%>
	<p>입력한 정보는 아래와 같습니다.</p>
	ID : <%=id %><br>
	Password : <%=pw %><br>
	자기소개 : 
	<pre><%=intro %></pre>
</body>
</html>






