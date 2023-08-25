<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3_result</title>
</head>
<body>
<%
	// POST method로 한글 데이터 전달 시 깨짐
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String address = request.getParameter("address");
	out.print("이름 : " + name + "<br>");
	out.print("주소 : " + address + "<br>");
	//String like = request.getParameter("like");
	//out.print("좋아하는 것 : " + like + "<br>");
	String[] likes = request.getParameterValues("like");
	for(String like : likes)
		out.print("좋아하는 것 : " + like + "<br>");
%>
</body>
</html>

















