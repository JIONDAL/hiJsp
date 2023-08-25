<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
<!-- 
	registerService.jsp 생성 후 register.jsp에서 전달한 데이터를 받아 변수에 저장
	MemberDAO.java에 register()를 작성 후 
	session_exam 테이블에 아이디,비밀번호,이름,이메일 정보를 저장
	아이디는 중복되지 않음.
 -->
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







