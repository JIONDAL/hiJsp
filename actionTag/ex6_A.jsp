<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex6_A</title>
</head>
<body>
	<%
		pageContext.setAttribute("id", "pageId");
		request.setAttribute("id", "requestId");
		session.setAttribute("id", "sessionId");
		application.setAttribute("id", "applicationId");
		
		//request.getRequestDispatcher("ex6_B.jsp").forward(request, response);
	%>
	<jsp:forward page="ex6_B.jsp" />
</body>
</html>







