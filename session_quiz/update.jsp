<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/session_quiz/header.jsp" %>
<%
	// 로그인한 사용자만 볼 수 있다.
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}
	// 수정할 정보를 출력한다.(비밀번호 제외)
%>
<div align="center">
	<h1>회원 수정</h1>
	<table ><tr><td>
	<form action="updateService.jsp" method="post" id="f">
		<input type="text" value="<%=id %>" id="id"> (*필수 항목) <br>
		<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
		<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm"
		onchange="pwCheck()">
		<label id="label" ></label><br>
		<input type="text" name="userName" id="userName" value="<%=session.getAttribute("userName") %>" ><br>
		<input type="text" name="address" value="<%=session.getAttribute("address") %>"><br>
		<input type="text" name="mobile" value="<%=session.getAttribute("mobile") %>"><br>
		<input type="button" value="회원수정" onclick="allCheck()">
		<input type="button" value="취소" onclick="location.href='index.jsp'"><br>
	</form>
	</td></tr></table>
</div>

<%@ include file="footer.jsp" %>



