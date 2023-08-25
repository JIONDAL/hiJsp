<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2</title>
</head>
<body>
	<h2>합계 구하기</h2>
	<%
		int total = 0;
		int oddTotal = 0, evenTotal = 0;
	
		for (int i = 1; i <= 100; i++) {
			total += i;
			if (i % 2 == 0)
				evenTotal += i;
			else
				oddTotal += i;
		}
	%>
	1 + 2 + 3 + .... + 100 =	<%=total%>
	<br> 1 ~ 100 까지의 짝수의 합 :	<%=evenTotal%>
	<br> 1 ~ 100 까지의 홀수의 합 :	<%=oddTotal%>
	<br>
</body>
</html>









