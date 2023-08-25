<%@page import="session_quiz.MemberDTO"%>
<%@page import="session_quiz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	
	if(pw == null || pw.isEmpty()){
		response.sendRedirect("delete.jsp");
		return;
	}
	
	if(pw.equals(confirmPw) == false){
		response.sendRedirect("delete.jsp");
		return;
	}
	
	MemberDAO memberDao = new MemberDAO();
	MemberDTO memberDto = memberDao.selectId(id);
	
	if(pw.equals(memberDto.getPw()) == false){
		response.sendRedirect("delete.jsp");
		//out.print("<script>alert('비밀번호가 틀렸습니다.'); location.href='delete.jsp';</script>");
		return;
	}
	
	memberDao.delete(id);
	memberDao.disConnection();
	
	session.invalidate();
	response.sendRedirect("index.jsp");
%>






