<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String remember = request.getParameter("remember");
	
	if(remember != null && remember.equals("true")){ //아이디 기억하기 체크박스에 체크를 함
		if("admin".equals(id) && "1234".equals(pw)){
			session.setAttribute("userId", "admin");
		}
	}else{
		session.removeAttribute("userId");
		//session.invalidate();
	}
	response.sendRedirect("ex4_login.jsp");
%>
