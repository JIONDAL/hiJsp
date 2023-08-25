<%@page import="session.PageService"%>
<%@page import="session_board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="session_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/session_quiz_jstl/header.jsp" %>
<div align="center">
	<h1>게시글 목록</h1>
		<c:catch var="except">
			<c:set var="currentPage" value="${Integer.parseInt(param.currentPage) }"/>
		</c:catch>
		
		<c:if test="${except != null }">
			<c:set var="currentPage" value="${1}"/>
		</c:if>
		
		<c:set var="pageBlock" value="${3}"/>
		<c:set var="end" value="${pageBlock * currentPage}"/>
		<c:set var="begin" value="${end - pageBlock + 1}"/>
		<jsp:useBean id="boardDao" class="session_board.BoardDAO" />
		<c:set var="boards" value="${boardDao.selectAll(begin, end)}"/>
		<c:set var="totalCount" value="${boardDao.count()}"/>
		${ boardDao.disConnection()}
		<c:choose>
			<c:when test="${empty boards }">
				<h1> 등록된 데이터가 존재하지 않습니다. </h1>
			</c:when>
			<c:otherwise>
			
	
		<table border=1>
			<tr>
				<th width="50">No.</th>
				<th width="250">제목</th>
				<th width="100">작성자</th>
				<th width="100">작성일</th>
				<th width="60">조회수</th>
			</tr>
			
			<c:forEach var="board" items="${ boards}">
				<tr>
					<td>${board.no }</td>
					<td onclick="location.href='boardContent.jsp?no=${board.no }'">
						${board.title }
					</td>
					<td>${board.id }</td>
					<td>${board.writeDate }</td>
					<td>${board.hits }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">
					<c:set var="url" value='${"boardForm.jsp?currentPage="}' />
					${PageService.printPage(url, currentPage, totalCount, pageBlock) }
				</td>
				<td><button type="button" onclick="location.href='boardWrite.jsp'">글쓰기</button></td>
			</tr>
		</table>
	</c:otherwise>
	</c:choose>
</div>
<%@ include file="/session_quiz_jstl/footer.jsp" %>










