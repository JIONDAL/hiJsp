<%@page import="session.PageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style type="text/css">
	a {text-decoration: none; color:black}
</style>
</head>
<body>
	<c:catch var ="catchException">
		<c:set var="currentPage" value="${ Integer.parseInt(param.currentPage)}" />
	</c:catch>
	<c:if test = "${catchException != null}">
		<c:set var="currentPage" value="1" />
	</c:if>

	<c:set var="pageBlock" value="4" /> <%--  한 페이지에 보일 데이터의 수 --%> 
	<c:set var="end" value="${pageBlock * currentPage}" /><%-- 테이블에서 가져올 마지막 행번호 --%> 
	<c:set var="begin" value="${end - pageBlock + 1}" /><%-- 테이블에서 가져올 시작 행번호 --%>
	<jsp:useBean id="memberDao" class="session.MemberDAO"/>
	<c:set var="members" value="${memberDao.selectAll(begin, end, param.select, param.search)}" />
	<c:set var="totalCount" value="${memberDao.count(param.select, param.search)}" />
	${memberDao.disConnection()}
	
	<c:choose>
		<c:when test="${members.isEmpty() }">
			<h3>데이터가 존재하지 않습니다.</h3>
		</c:when>
		<c:otherwise>
			<table border=1>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
				</tr>
				<c:forEach var="member" items="${members }">
					<tr>
						<td>${member.id }</td>
						<td>${member.pw }</td>
						<td>${member.name }</td>
						<td>${member.email }</td>
					</tr>
				</c:forEach>
			</table>
			<div>
<c:set var="url" value='${"list.jsp?select="}${param.select }${"&search=" }${param.search }${"&currentPage="}'/>
				${ PageService.printPage(url, currentPage, totalCount, pageBlock) } 
			</div>
			<form action="list.jsp">
				<select name="select">
					<option value="">전체</option>
					<option value="id">아이디</option>
					<option value="email">이메일</option>
				</select>
				<input type="text" name="search" />
				<input type="submit" value="검색" />
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>







