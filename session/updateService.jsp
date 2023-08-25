<%@page import="session.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//updateService.jsp
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	if(pw == null || pw.isEmpty()){
		response.sendRedirect("update.jsp");
		return;
	}
	
	if(pw.equals(confirmPw) == false){
		response.sendRedirect("update.jsp");
		return;
	}
	
	MemberDAO memberDao = new MemberDAO();
	memberDao.update(id, pw, name, email);
	memberDao.disConnection();
	session.invalidate();
	response.sendRedirect("index.jsp");
	/*
		데이터 입력 값 존재 여부 확인(null, Empty)
		
		입력한 두 비밀번호 검증
		
		MemberDAO 안에 update()를 생성 후 테이블에 정보 수정
		id는 수정 대상이 아님
		
		수정 완료 시 session 정보를 삭제 후 index.jsp로 이동
		수정 실패 시 update.jsp로 이동
	*/
%>