<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectResult</title>
</head>
<body>
	<h2>입력한 정보는 아래와 같습니다.</h2>
	<%
		request.setCharacterEncoding("utf-8");
		String edu = request.getParameter("edu");
		String country = request.getParameter("country");
		String[] likes = request.getParameterValues("like");
		out.print("학력 : " + edu + "<br>");
		out.print("국가 : " + country + "<br>");
		out.print("관심 분야 : ");
		for(int i = 0; i < likes.length; i++){
			out.print(likes[i] + " ");
		}
	%>
	
</body>
</html>