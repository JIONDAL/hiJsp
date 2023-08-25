<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("login.jsp");
			return;
		}
	%>
	<form action="deleteService.jsp" method="post">
		<input type="text" value="<%=id %>" readonly="readonly"> <br>
		<input type="password" placeholder="비밀번호" name="pw"><br> 
		<input type="password" placeholder="비밀번호 확인" name="confirmPw"><br> 
		<input type="submit" value="회원 탈퇴" >
		<input type="button" value="취소" onclick="location.href='index.jsp'">
	</form>
</body>
</html>







