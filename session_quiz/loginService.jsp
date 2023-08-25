<%@page import="session_quiz.MemberDTO"%>
<%@page import="session_quiz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO memberDao = new MemberDAO();
	MemberDTO memberDto = memberDao.selectId(id);
	memberDao.disConnection();
	if(memberDto != null && memberDto.getPw().equals(pw)){
		session.setAttribute("id", memberDto.getId());
		session.setAttribute("userName", memberDto.getUserName());
		session.setAttribute("address", memberDto.getAddress());
		session.setAttribute("mobile", memberDto.getMobile());
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("login.jsp");
	}
%>

