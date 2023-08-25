<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("data", "pageContext");
	request.setAttribute("data", "request");
	session.setAttribute("data", "session");
	application.setAttribute("data", "appliction");
%>
범위 지정 없음 : ${data } <br>
pageContext : ${pageScope.data } <br>
request : ${requestScope.data } <br>
session : ${sessionScope.data } <br>
application : ${applicationScope.data } <br>

<a href="ex7_B.jsp">이동</a>








