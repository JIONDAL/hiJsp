<%@page import="session.MemberDTO"%>
<%@page import="session.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%-- actionTag.LoginDTO loginDto = new actionTag.LoginDTO(); --%>    
<jsp:useBean id="loginDto" class="actionTag.LoginDTO" />

<%--loginDto.setId(request.getParameter("id")); --%>
<%--loginDto.setPw(request.getParameter("pw")); --%>
<%-- <jsp:setProperty property="id" name="loginDto"/>
<jsp:setProperty property="pw" name="loginDto"/> --%>

<jsp:setProperty property="*" name="loginDto"/>

<%--
loginDto.getId();
loginDto.getPw(); 
아이디 : <jsp:getProperty property="id" name="loginDto"/><br>
비밀번호 : <jsp:getProperty property="pw" name="loginDto"/>
--%>

<%
	if("admin".equals(loginDto.getId()) && "1234".equals(loginDto.getPw())){
		session.setAttribute("id", "admin");
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("login.jsp");
	}
%>

