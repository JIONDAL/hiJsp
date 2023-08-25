<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="memberDto" class="session_quiz.MemberDTO"/>
<jsp:setProperty property="*" name="memberDto"/>
<c:choose>
	<c:when test="${empty memberDto.id or empty memberDto.pw}">
		<c:redirect url="register.jsp"/>
	</c:when>
	<c:when test="${memberDto.pw != param.confirm }">
		<c:redirect url="register.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:useBean id="memberDao" class="session_quiz.MemberDAO"/>
		<c:set var="check" value="${memberDao.selectId(memberDto.id) }"/>
		<c:choose>
			<c:when test="${empty check}">
				${memberDao.register(memberDto.id, memberDto.pw, 
				memberDto.userName, memberDto.address, memberDto.mobile)}
				<c:set var="msg" value="회원 가입 완료"/>
				<c:set var="path" value="index.jsp"/>
			</c:when>
			<c:otherwise>
				<c:set var="msg" value="회원 가입 실패"/>
				<c:set var="path" value="register.jsp"/>
			</c:otherwise>
		</c:choose>
		${memberDao.disConnection() }
	</c:otherwise>
</c:choose>
<script>alert('${msg}'); location.href='${path}';</script>   
<%--
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String confirm = request.getParameter("confirm");
	String userName = request.getParameter("userName");
	String address = request.getParameter("address");
	String mobile = request.getParameter("mobile");
	
	if(id == null || id.isEmpty()){
		response.sendRedirect("register.jsp");
		return;
	}
	
	if(pw == null || pw.isEmpty()){
		response.sendRedirect("register.jsp");
		return;
	}
	
	if(pw.equals(confirm) == false){
		response.sendRedirect("register.jsp");
		return;
	}
	
	MemberDAO memberDao = new MemberDAO();
	MemberDTO memberDto = memberDao.selectId(id);
	
	String msg = "", path = "";
	if(memberDto == null){
		memberDao.register(id, pw, userName, address, mobile);
		msg = "회원 가입 완료";
		path = "index.jsp";
	}else{
		msg = "회원 가입 실패";
		path = "register.jsp";
	}
	
	memberDao.disConnection();
	<script>alert('<%=msg%>'); location.href='<%=path%>';</script>
--%>





