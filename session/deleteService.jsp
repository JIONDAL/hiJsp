<%@page import="session.MemberDTO"%>
<%@page import="session.MemberDAO"%>
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
	
	// deleteService.jsp
	
	/*
		delete.jsp, deleteService.jsp
		 - 로그인한 사용자만 접근 가능.
		 
		deleteService.jsp
		 - delete.jsp에서 전달한 데이터 검증.
		 - session_exam에 저장된 비밀번호와
		   사용자가 입력한 비밀번호와 일치하면 테이블 정보 삭제
		 - 삭제 완료 시 session 삭제 후 index.jsp로 이동
		 - 삭제 실패 시 delete.jsp로 이동
		 
	*/
%>






