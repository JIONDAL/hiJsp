<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/session_quiz/header.jsp" %>

<div align="center">
	<h1>회원 등록</h1>
	<table ><tr><td>
	<form action="registerService.jsp" method="post" id="f">
		<input type="text" name="id" placeholder="아이디" id="id"> (*필수 항목) <br>
		<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
		<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm"
		onchange="pwCheck()">
		<label id="label" ></label><br>
		<input type="text" name="userName" id="userName" placeholder="이름" ><br>
		<input type="text" name="address" placeholder="주소" ><br>
		<input type="text" name="mobile" placeholder="전화번호" ><br>
		<input type="button" value="회원가입" onclick="allCheck()">
		<input type="button" value="취소" onclick="location.href='index.jsp'"><br>
	</form>
	</td></tr></table>
</div>

<%@ include file="footer.jsp" %>



