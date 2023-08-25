<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3_index</title>
</head>
<body>
	<%
		// 클라이언트의 쿠키를 확인 후 
		// 쿠키의 유무에 따라
		// script를 실행 / 미실행 
		Cookie[] cookies = request.getCookies();
		boolean status = true;
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("popup"))
				status = false;
		}
		
		if(status){
	%>
	<script>
		window.open(
				'ex3_popup.jsp',
				'',
				'width=300,height=300,left=400,top=200'
				)
	</script>
	<%} %>
</body>
</html>









