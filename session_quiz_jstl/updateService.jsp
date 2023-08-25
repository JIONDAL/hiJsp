<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8" />

<c:choose>
	<c:when test="${empty sessionScope.id }">
		<c:redirect url="login.jsp"/>
	</c:when>
	<c:when test="${empty param.pw}">
		<c:redirect url="update.jsp"/>
	</c:when>
	<c:when test="${param.pw != param.confirm }">
		<c:redirect url="update.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:useBean id="memberDao" class="session_quiz.MemberDAO"/>
		${memberDao.update(sessionScope.id, param.pw, param.userName, param.address, param.mobile) }
		${memberDao.disConnection() }
		<c:remove var="id" scope="session"/>
		<c:remove var="userName" scope="session"/>
		<c:remove var="address" scope="session"/>
		<c:remove var="mobile" scope="session"/>
		<c:set var="msg" value="${'회원 수정 완료' }" />
		<c:set var="path" value="${'index.jsp' }" />
	</c:otherwise>
</c:choose>

<script>alert('${msg}'); location.href='${path}';</script>




