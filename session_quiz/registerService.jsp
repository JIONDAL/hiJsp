<%@page import="session_quiz.MemberDTO"%>
<%@page import="session_quiz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String confirm = request.getParameter("confirm");
	String userName = request.getParameter("userName");
	String address = request.getParameter("address");
	String mobile = request.getParameter("mobile");
	
	if(id == null || id.isEmpty()){
		response.sendRedirect("register.jsp");
		return;
	}
	
	if(pw == null || pw.isEmpty()){
		response.sendRedirect("register.jsp");
		return;
	}
	
	if(pw.equals(confirm) == false){
		response.sendRedirect("register.jsp");
		return;
	}
	
	MemberDAO memberDao = new MemberDAO();
	MemberDTO memberDto = memberDao.selectId(id);
	
	String msg = "", path = "";
	if(memberDto == null){
		memberDao.register(id, pw, userName, address, mobile);
		msg = "회원 가입 완료";
		path = "index.jsp";
	}else{
		msg = "회원 가입 실패";
		path = "register.jsp";
	}
	
	memberDao.disConnection();
%>
<script>alert('<%=msg%>'); location.href='<%=path%>';</script>




