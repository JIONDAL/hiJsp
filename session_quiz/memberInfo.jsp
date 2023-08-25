<%@page import="session.PageService"%>
<%@page import="session_quiz.MemberDAO"%>
<%@page import="session_quiz.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
</head>
<body>
	<%@ include file="/session_quiz/header.jsp" %>
	<div align="center">
		<h1>회원 목록</h1>
		
		<%
			String search = request.getParameter("search");
			String select = request.getParameter("select");
			if(select == null)
				select = "";
			
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
			
			MemberDAO memberDao = new MemberDAO();
			ArrayList<MemberDTO> members = null;
			int totalCount = 0;
			if(select.isEmpty()){
				 members = memberDao.selectAll(begin, end);
				 totalCount = memberDao.count();
			}else{
				 members = memberDao.selectAll(begin, end, select, search);
				 totalCount = memberDao.count(select, search);
			}
			
			memberDao.disConnection();
			if(members.isEmpty() == true){
				out.print("<h1> 등록된 데이터가 존재하지 않습니다. </h1>");
				return;
			}else{
		%>
		<table border=1>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
			<%for(MemberDTO member : members){ %>
				<tr>
					<td onclick="location.href='userInfo.jsp?id=<%=member.getId() %>'">
						<%=member.getId() %>
					</td>
					<td><%=member.getUserName() %></td>
					<td><%=member.getMobile() %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
		<div>
			<%
				String url = "memberInfo.jsp?select="+select+"&search="+search+"&currentPage=";
			%>
			<%= PageService.printPage(url, currentPage, totalCount, pageBlock) %>
		</div>
		<%} %>
		<form action="memberInfo.jsp">
			<select name="select">
				<option value="">전체</option>
				<option value="id">아이디</option>
				<option value="mobile">전화번호</option>
			</select>
			<input type="text" name="search" />
			<input type="submit" value="검색" />
		</form>
	</div>
	<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>






























