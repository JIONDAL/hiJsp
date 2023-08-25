<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex1</title>
</head>
<body>
	<c:out value="hello" /> <br>
	<%="표현식으로 출력" %><br>
	<%out.print("메소드로 출력"); %><br>
	${"표현 언어로 출력"}<br>
</body>
</html>