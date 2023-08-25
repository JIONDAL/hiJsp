<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex6</title>
</head>
<body>
		<%
			String[] names = new String[]{"김변수", "이상수", "박참조"};
			pageContext.setAttribute("names", names);
			
			for(String name : names){
				out.print("이름 : " + name + "<br>");
			}
		%>
		<br><br>
		
		<c:forEach var="name" items="${names }">
			이름 : ${name } <br>
		</c:forEach>
		<br><br>
		
		<%-- 배열의 데이터 수 : ${names.length} --%>
		<c:forEach var="i" begin="0" end="2" step="1">
			이름 : ${names[i] } <br>
		</c:forEach>
		<br><br>
</body>
</html>









