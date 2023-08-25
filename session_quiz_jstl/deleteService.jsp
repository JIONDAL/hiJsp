<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8" />

<c:choose>
	<c:when test="${empty sessionScope.id }">
		<c:redirect url="login.jsp"/>
	</c:when>
	<c:when test="${empty param.pw}">
		<c:redirect url="delete.jsp"/>
	</c:when>
	<c:when test="${param.pw != param.confirmPw }">
		<c:redirect url="delete.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:useBean id="memberDao" class="session_quiz.MemberDAO"/>
		<c:set var="memberDto" value="${memberDao.selectId(sessionScope.id)}" />
		<c:choose>
			<c:when test="${memberDto.pw != param.pw }">
				${memberDao.disConnection() }
				<c:redirect url="delete.jsp"/>
			</c:when>
			<c:otherwise>
				${memberDao.delete(sessionScope.id) }
				${memberDao.disConnection() }
				<c:remove var="id" scope="session"/>
				<c:remove var="userName" scope="session"/>
				<c:remove var="address" scope="session"/>
				<c:remove var="mobile" scope="session"/>
				<c:redirect url="index.jsp"/>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>






