<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
	<!-- 아이디/패스워드에 데이터가 없으면 loginForm.jsp로 이동  -->
	<!-- 아이디/패스워드가 틀리면 loginFailed.jsp로 이동  -->
	<!-- 아이디/패스워드가 맞으면 loginIndex.jsp로 이동 -->
	<form action="loginResult.jsp" method="post">
		<input type="text" placeholder="아이디" name="id"> <br>
		<input type="password" placeholder="비밀번호" name="pw" ><br> 
		<input type="submit" value="로그인" >
		<input type="reset" value="취소" >	
	</form>
</body>
</html>









