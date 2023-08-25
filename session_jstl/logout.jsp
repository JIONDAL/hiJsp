<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:remove var="id" scope="session"/>
<c:remove var="name" scope="session"/>
<c:remove var="email" scope="session"/>

<script>
	alert('로그 아웃');
	location.href='index.jsp';
</script>

