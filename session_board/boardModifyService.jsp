<%@page import="session_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String n = request.getParameter("no");
	
 	int no = 0;
	try{
		no = Integer.parseInt(n);
	}catch(Exception e){
		response.sendRedirect("boardModify.jsp?no="+no);
		return;
	}
	
	if(title == null || title.isEmpty()){
		response.sendRedirect("boardModify.jsp?no="+no);
		return;
	} 
	
	BoardDAO boardDao = new BoardDAO();
	boardDao.modify(no, title, content); 
	boardDao.disConnection();
	
	response.sendRedirect("boardForm.jsp");
	
%>











