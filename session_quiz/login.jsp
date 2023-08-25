<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/session_quiz/header.jsp" %>
<div align="center">
	<h1>로그인</h1>
	<table ><tr><td>
	<form action="loginService.jsp" method="post" id="f">
		<input type="text" name="id" placeholder="아이디" id="id"><br>
		<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
		<input type="button" value="로그인" onclick="loginCheck()">
		<input type="button" value="취소" onclick="location.href='index.jsp'"><br>
	</form>
	</td></tr></table>
</div>
<%@ include file="footer.jsp" %>



