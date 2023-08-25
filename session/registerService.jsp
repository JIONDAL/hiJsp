<%@page import="session.MemberDTO"%>
<%@page import="session.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	if(id == null || id.isEmpty()){
		response.sendRedirect("register.jsp");
		return;
	}
	
	if(pw == null || pw.isEmpty()){
		response.sendRedirect("register.jsp");
		return;
	}
	
	if(pw.equals(confirmPw) == false){
		response.sendRedirect("register.jsp");
		return;
	}
	
	MemberDAO memberDao = new MemberDAO();
	
	// 아이디 중복 확인
	MemberDTO memberDto = memberDao.selectId(id);
	
	String msg = "", path = "";
	if(memberDto == null){
		// 아이디가 중복이 아니면 테이블에 데이터 저장
		memberDao.register(id, pw, name, email);
		// 회원가입 후 페이지 이동
		//response.sendRedirect("index.jsp");
		msg = "회원 가입 완료";
		path = "index.jsp";
	}else{
		// 아이디 중복
		// 회원가입 후 페이지 이동
		//response.sendRedirect("register.jsp");
		msg = "회원 가입 실패";
		path = "register.jsp";
	}
	
	memberDao.disConnection();
%>
<script>alert('<%=msg%>'); location.href='<%=path%>';</script>




