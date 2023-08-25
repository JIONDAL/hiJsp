<%@page import="session.PageService"%>
<%@page import="session_board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="session_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/session_quiz/header.jsp" %>
<div align="center">
	<h1>게시글 목록</h1>
	<%
		String cp = request.getParameter("currentPage");
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		int pageBlock = 3; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		BoardDAO boardDao = new BoardDAO();
		
		ArrayList<BoardDTO> boards = boardDao.selectAll(begin, end);
		int totalCount = boardDao.count();
		boardDao.disConnection();
		
		if(boards.isEmpty()){
			out.print("<h3>등록 데이터가 없습니다.</h3>");
			return;
		}
		String url = "boardForm.jsp?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
	%>
	<table border=1>
		<tr>
			<th width="50">No.</th>
			<th width="250">제목</th>
			<th width="100">작성자</th>
			<th width="100">작성일</th>
			<th width="60">조회수</th>
		</tr>
		<%for(BoardDTO board : boards) {%>
			<tr>
				<td><%=board.getNo() %></td>
				<td onclick="location.href='boardContent.jsp?no=<%=board.getNo() %>'">
					<%=board.getTitle() %>
				</td>
				<td><%=board.getId() %></td>
				<td><%=board.getWriteDate() %></td>
				<td><%=board.getHits() %></td>
			</tr>
		<%} %>
		<tr>
			<td colspan="4">
				<%=result %>
			</td>
			<td><button type="button" onclick="location.href='boardWrite.jsp'">글쓰기</button></td>
		</tr>
	</table>
</div>
<%@ include file="/session_quiz/footer.jsp" %>










