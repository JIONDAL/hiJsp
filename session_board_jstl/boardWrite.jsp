<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/session_quiz_jstl/header.jsp"%>

<c:choose>
	<c:when test="${empty sessionScope.id }">
		<c:redirect url="../session_quiz_jstl/login.jsp"/>
	</c:when>
</c:choose>

<div align="center">
	<form action="boardWriteService.jsp" method='post' enctype="multipart/form-data">
		<table>
			<caption>
				<font size="5"><b>게시글 등록</b></font>
			</caption>
			<tr>
				<th width="100px">제목</th>
				<td><input style="width: 100%;" type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea style="width: 100%;" rows="10" cols="30" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기"> 
					<input type="button" value="목록"	 onclick="location.href='boardForm.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/session_quiz_jstl/footer.jsp"%>



