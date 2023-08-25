<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex4_login</title>
</head>
<body>
<%--
0. ex4_login -> ex4_loginCheck
1. 체크박스를 클릭하고 로그인 시 ID/PW가 일치하면 
   ex4_login.jsp 에서 아이디의 값을 출력해주세요.
2. 체크박스를 클릭하고 로그인 시 ID/PW가 틀리면 
   ex4_login.jsp 에서 아이디의 값을 출력하지 않아요.
3. 체크박스를 클릭하지 않고 로그인 성공/실패 두 경우 모두 
	ex4_login.jsp 에서 아이디의 값을 출력하지 않아요.
 --%>
 <%
 	Cookie[] cookies = request.getCookies();
 	String id = "";
	for(Cookie cookie : cookies){
		if(cookie.getName().equals("userId")){
			id = cookie.getValue();
		}
	}
 %>
	<form action="ex4_loginCheck.jsp" method="get">
		<input type="text" placeholder="아이디" name="id" value="<%=id%>"> <br>
		<input type="password" placeholder="비밀번호" name="pw" ><br> 
		<% 
		if(id.isEmpty()){
			out.print("<input type='checkbox' name='remember' value='true' />아이디 기억하기"); 
		}else{
		%>
			<input type="checkbox" name="remember" value="true" checked="checked"/>아이디 기억하기 
		<%
		}
		%>
		<br><input type="submit" value="로그인" >
		<input type="reset" value="취소" >	
	</form>
</body>
</html>

