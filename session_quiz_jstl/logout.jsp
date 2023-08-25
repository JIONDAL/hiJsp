<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
	session.invalidate();
	response.sendRedirect("index.jsp");
--%>

<c:remove var="id" scope="session"/>
<c:remove var="userName" scope="session"/>
<c:remove var="address" scope="session"/>
<c:remove var="mobile" scope="session"/>

<c:redirect url="index.jsp" />
