<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	// 한글 데이터가 POST 방식으로 전달되면 한글깨짐 -> 인코딩
	// request.setCharacterEncoding("utf-8");
%>

<fmt:requestEncoding value="utf-8"/>
아이디 : ${param.id} <br>
비밀번호 : ${param.pw}