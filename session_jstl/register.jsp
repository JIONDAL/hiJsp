<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	<form action="registerService.jsp" method="post" id="f">
		<input type="text" name="id" id="id" placeholder="아이디"><br>
		<input type="password" name="pw" id="pw" placeholder="비밀번호"><br>
		<input type="password" name="confirmPw" id="confirmPw" placeholder="비밀번호 확인"><br>
		<input type="text" name="name" id="name" placeholder="이름"><br>
		<input type="text" name="email" id="email" placeholder="이메일"><br>
		<input type="submit" value="회원 가입" >
		<input type="button" value="취소" onclick="location.href='index.jsp'">
	</form>
</body>
</html>







