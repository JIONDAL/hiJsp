<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   	String id = request.getParameter("id");
   	String pwd = request.getParameter("pw");
%>
   	
   	아이디 : <%=request.getParameter("id")%> <br>
   	비밀번호 : <%=pwd%> <br>
   	
   	<br>
   	
   	아이디 : ${param.id} <br>
   	비밀번호 : ${param.pw}<br>