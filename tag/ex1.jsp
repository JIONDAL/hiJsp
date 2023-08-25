<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex1</title>
</head>
<body>
	<%--
		<%@ Directive %> : 자바 페이지 환경 설정(exam : include file, import )
		<%! Declaration %> : 자바 코드 작성(클래스에 작성 방식, field, method)
		<%= Expression %> : out.print()와 같은 출력문 작성
		<% Scriptlet %> : 자바 코드 작성( 메서드 안에 작성 방식)
	 --%>
	 
	 <%
 	 	int data = 10;
	 	out.print("data : " + data + "<br>");
	 	int i;
	 	for(i = 0; i < 10; i++){
	 		out.print("i : " + i+ "<br>");
	 	} 
	 %>
	 
	 data 변수에 담긴 값 :
	 <%
		 out.print(data);
	 %>
	 <br>
	 
	 data 변수에 담긴 값 : <%=data%> <br>
	 
	 <!-- HTML 주석 -->
	 <%-- JSP 주석 --%>
	 <%
	 	// 자바 주석
	 %>
</body>
</html>







