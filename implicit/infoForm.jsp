<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoForm</title>
</head>
<body>
	<form action="infoResult.jsp" method="post"> 
		<label>ID </label><input type="text" name="id"><br>
		<label>Password </label><input type="password" name="pw"><br>
		<label>자기소개 </label><br>
		<textarea rows="5" cols="30" name="intro"></textarea><br>
		<input type="submit" value="전송">
		<input type="reset" >
	</form>
</body>
</html>







