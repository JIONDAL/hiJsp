<%@page import="session_quiz.MemberDTO"%>
<%@page import="session_quiz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	String pw = request.getParameter("pw");
	String confirm = request.getParameter("confirm");
	String userName = request.getParameter("userName");
	String address = request.getParameter("address");
	String mobile = request.getParameter("mobile");
	
	if(pw == null || pw.isEmpty()){
		response.sendRedirect("update.jsp");
		return;
	}
	
	if(pw.equals(confirm) == false){
		response.sendRedirect("update.jsp");
		return;
	}
	
	MemberDAO memberDao = new MemberDAO();
	memberDao.update(id, pw, userName, address, mobile);
	String msg = "회원 수정 완료", path = "index.jsp";
	memberDao.disConnection();
	
	// 세션의 값을 삭제 또는 직접 수정
	// session.invalidate();
	session.setAttribute("userName", userName);
	session.setAttribute("address", address);
	session.setAttribute("mobile", mobile);
%>
<script>alert('<%=msg%>'); location.href='<%=path%>';</script>




