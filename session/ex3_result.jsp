<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.print("아이디 : " + session.getAttribute("id") + "<br>");
	
	String[] likes = (String[])session.getAttribute("likes");
	out.print("취미 : ");
	for(String like : likes){
		out.print(like + " ");
	}
	out.print("<br>");
	// http://localhost:8085/jsp_exam/session/ex3_make.jsp
%>