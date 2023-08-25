<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.id }">
		<form action="loginService.jsp" method="post">
			<input type="text" placeholder="아이디" name="id"> <br>
			<input type="password" placeholder="비밀번호" name="pw" ><br> 
			<input type="submit" value="로그인" >
			<input type="button" value="취소" onclick="location.href='index.jsp'">
		</form>
	</c:when>
	<c:otherwise>
		${sessionScope.id }님이 로그인 했습니다.<br>
		<button onclick="location.href='index.jsp'">초기 화면</button>
	</c:otherwise>
</c:choose>
</body>
</html>










