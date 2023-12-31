<%@page import="session.PageService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="session.MemberDTO"%>
<%@page import="session.MemberDAO"%>
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
	<%
		String cp = request.getParameter("currentPage");
		String search = request.getParameter("search");
		String select = request.getParameter("select");
		if(select == null){
			select = "";
		}
		
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 4; // 한 페이지에 보일 데이터의 수 
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
	
		MemberDAO memberDao = new MemberDAO();
		ArrayList<MemberDTO> members = memberDao.selectAll(begin, end, select, search);
		int totalCount = memberDao.count(select, search);
		memberDao.disConnection();
		if(members.isEmpty()){
			out.print("<h3>등록 후 이용하세요.</h3>");
			return;
		}
	%>
	<table border=1>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
<%-- 		<%
		for(MemberDTO member : members){ 
		%>
			<tr>
				<td><%=member.getId() %></td>
				<td><%=member.getPw() %></td>
				<td><%=member.getName() %></td>
				<td><%=member.getEmail() %></td>
			</tr>
		<%}
		
		%> --%>
		<% pageContext.setAttribute("members", members); %>
		
		<c:forEach var="member" items="${members }">
			<tr>
				<td>${member.getId() }</td>
				<td>${member.pw }</td>
				<td>${member.name }</td>
				<td>${member.email }</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<%
			String url = "list.jsp?select="+select+"&search="+search+"&currentPage=";
		%>
		${ PageService.printPage(url, currentPage, totalCount, pageBlock) }
		<%= PageService.printPage(url, currentPage, totalCount, pageBlock) %>
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
</body>
</html>







