<%@page import="session_board.BoardDTO"%>
<%@page import="session_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/session_quiz/header.jsp"%>

<%
	String n = request.getParameter("no");
	int no = 0;
	try{
		no = Integer.parseInt(n);
	}catch(Exception e){
		response.sendRedirect("boardContent.jsp?no="+no);
		return;
	}
	
	BoardDAO boardDao = new BoardDAO();
	BoardDTO board = boardDao.searchForModify(no);
	boardDao.disConnection();
	
	if(board == null){
		response.sendRedirect("boardContent.jsp?no="+no);
		return;
	}
	
	if(board.getFileName() == null)
		board.setFileName("");
	
%>
<div align="center">
<form action="boardModifyService.jsp" method="post">
	<input type="hidden" name="no" value="<%=board.getNo() %>" />
	<h1>글 수정</h1>
	<table border='1'>
		<tr>
			<th width="100">작성자</th>
			<td width="200"><%=board.getId() %></td>
			<th width="100">조회수</th>
			<td width="200"><%=board.getHits() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=board.getWriteDate() %></td>
			<th>다운로드</th>
			<td><%=board.getFileName() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">
				<input style="width:100%;" type="text" name="title" value="<%=board.getTitle()%>" />
			</td>
		</tr>
		<tr>
			<th>문서내용 수정</th>
			<td colspan="3">
				<textarea rows="10" cols="30" style="width:100%" name="content"><%=board.getContent() %>
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="button" onclick="location.href='boardForm.jsp'">목록</button>
				<input type="submit" value="수정">
				<button type="button" onclick="history.back()">이전</button> 
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="/session_quiz/footer.jsp"%>