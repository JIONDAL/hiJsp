<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3</title>
</head>
<body>
	<%
		String data1 = "100";
		String data2 = "1.2";
		
		int intData = Integer.parseInt(data1);
		double doubleData = Double.parseDouble(data2);
		double result = intData + doubleData ;
	%>
	<h3> 결과는 <%= intData + doubleData %> 입니다.</h3>
	<h3> 결과는 <% out.print(intData + doubleData ); %> 입니다.</h3>
</body>
</body>
</html>







