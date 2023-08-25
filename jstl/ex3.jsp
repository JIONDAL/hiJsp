<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3</title>
</head>
<body>
	<%
		String data1 = "자바 변수의 데이터";
		pageContext.setAttribute("data2", data1);
	%>
	<%=data1 %>
	<c:set var="data3" value="jstl 변수의 데이터" />
	<c:set var="data4" value="<%=data1 %>" />
	
	data1 : ${data1 } <br>
	data2 : ${pageScope.data2 } <br>
	data3 : ${pageScope.data3 } <br>
	data4 : ${pageScope.data4 }
</body>
</html>




