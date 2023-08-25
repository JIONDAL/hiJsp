<%@page import="session.MemberDTO"%>
<%@page import="session.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//INSERT INTO session_exam VALUES('admin','1234', '관리자', 'admin@admin.com');
	
	MemberDAO memberDao = new MemberDAO();
	MemberDTO memberDto = memberDao.selectId(id);
	memberDao.disConnection();
	if(memberDto != null && memberDto.getPw().equals(pw)){
		session.setAttribute("id", memberDto.getId());
		session.setAttribute("name", memberDto.getName());
		session.setAttribute("email", memberDto.getEmail());
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("login.jsp");
	}
	
	//if("admin".equals(id) && "1234".equals(pw)){
	//	session.setAttribute("id", "admin");
	//	response.sendRedirect("index.jsp");
	//}else{
	//	response.sendRedirect("login.jsp");
	//}
%>

