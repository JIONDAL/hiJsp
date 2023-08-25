<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 아이디/패스워드에 데이터가 없으면 loginForm.jsp로 이동  -->
<!-- 아이디/패스워드가 틀리면 loginFailed.jsp로 이동  -->
<!-- 아이디/패스워드가 맞으면 loginIndex.jsp로 이동 -->
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.isEmpty() || pw.isEmpty()){
		response.sendRedirect("loginForm.jsp");
	}else if("admin".equals(id) && "1234".equals(pw)){
		response.sendRedirect("loginIndex.jsp");
	}else{
		response.sendRedirect("loginFailed.jsp");
	}
%>