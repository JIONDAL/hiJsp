<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2</title>
</head>
<body>
	정수형 : ${10 }<br>
	실수형 : ${10.123 }<br>
	문자열형 : ${"홍길동" }<br>
	문자열형 : ${'홍길동' }<br>
	논리형 : ${true }<br>
	null데이터 : ${null }<br>
	연산 : ${10 + 123}<br>
	연산 : <%=10+123 %><br>
	
	null데이터 : ${empty null }<br>
	빈문자열데이터 : ${empty "" }<br>
	문자열형 : ${empty '홍길동' }<br>
</body>
</html>







