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
		response.sendRedirect("boardForm.jsp");
		return;
	}
	
	BoardDAO boardDao = new BoardDAO();
	BoardDTO board = boardDao.selectNo(no);
	boardDao.disConnection();
	
	if(board == null){
		response.sendRedirect("boardForm.jsp");
		return;
	}
	
	if(board.getFileName() == null)
		board.setFileName("");
	
%>
<script>
	function deleteCheck(){
		result = confirm('진짜로 삭제하겠습니까?');
		if(result == true){
			location.href='boardDeleteService.jsp?no=<%=board.getNo()%>'
		}
	}
</script>
<div align="center">
	<h1>글 내용</h1>
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
			<!-- boardDownload.jsp?id=admin&fileName=test.txt&no=13 -->
			<td onclick="location.href='boardDownload.jsp?id=<%=board.getId() %>&fileName=<%=board.getFileName() %>&no=<%=board.getNo()%>'">
			<%=board.getFileName() %>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><%=board.getTitle() %></td>
		</tr>
		<tr>
			<th>문서내용</th>
			<td colspan="3"><%=board.getContent() %></td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="button" onclick="location.href='boardForm.jsp'">목록</button>
				<button type="button" onclick="location.href='boardModify.jsp?no=<%=board.getNo()%>'">수정</button>
				<button type="button" onclick="deleteCheck()">삭제</button> 
			</td>
		</tr>
	</table>
</div>
<%@ include file="/session_quiz/footer.jsp"%>






