
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:requestEncoding value="utf-8"/>    

<c:choose>
	<c:when test="${empty sessionScope.id }">
		<c:redirect url="login.jsp"/>
	</c:when>
	<c:when test="${empty param.pw }">
		<c:redirect url="update.jsp"/>
	</c:when>
	<c:when test="${param.pw != param.confirmPw }">
		<c:redirect url="update.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:useBean id="memberDao" class="session.MemberDAO"/>
		${memberDao.update(param.id, param.pw, param.name, param.email) }
		${memberDao.disConnection() }
		
		<c:remove var="id" scope="session"/>
		<c:remove var="name" scope="session"/>
		<c:remove var="email" scope="session"/>
		<c:redirect url="index.jsp"/>
	</c:otherwise>
</c:choose>
