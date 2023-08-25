<%@page import="session_quiz.MemberDAO"%>
<%@page import="session_quiz.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userInfo</title>
</head>
<body>
	<%@ include file="/session_quiz/header.jsp" %>

	<%
		String seesionId = (String)session.getAttribute("id");
		if(seesionId == null){
			response.sendRedirect("login.jsp");
			return;
		}
		
		String reqId = request.getParameter("id");
		if(reqId == null){
			response.sendRedirect("memberInfo.jsp");
			return;
		}
		
		if(reqId.equals(seesionId) == false){
			response.sendRedirect("memberInfo.jsp");
			return;
		}
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO member= memberDao.selectId(reqId);
		memberDao.disConnection();
	%>
	<div align="center">
		<h1>개인 정보</h1>
		아이디 : <%=member.getId() %> <br> 
		비밀번호 : <%=member.getPw() %><br>
		이름 : <%=member.getUserName() %> <br>
		주소 : <%=member.getAddress() %> <br>
		전화번호 : <%=member.getMobile() %> <br><br>
		<button type="button" onclick="location.href='update.jsp'">회원 수정</button>
		<button type="button" onclick="location.href='delete.jsp'">회원 삭제</button>
	</div>	
		<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>



















