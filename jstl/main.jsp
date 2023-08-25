<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id  = (String)session.getAttribute("id");
%>
<div align="center" class="main_div">
더할 나위 없다.<br>
로그인 아이디 : <%=session.getAttribute("id") %>
</div>