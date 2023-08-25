<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectForm</title>
</head>
<body>
<form action="selectResult.jsp" method="post">
	<table>
		<tr><td>학력</td>
			<td>
				<select name="edu">
					<option>재학생</option>
					<option>학사</option>
					<option>석사</option>
					<option>박사</option>
				</select>
			</td>
		</tr>
		<tr>
			<td> 소속 국가 </td>
			<td><select name="country" size="4">
				<option>대한민국</option>
				<option>미국</option>
				<option>중국</option>
				<option>일본</option>
			</select>
			</td>
		</tr>
		<tr>
			<td> 관심 분야 </td>
			<td>
			<select name="like" size="4" multiple>
				<option>IT 컨설팅</option>
				<option>프로그래머</option>
				<option>시스템엔지니어</option>
				<option>네트워크엔지니어</option>
			</select>
			</td>
		</tr>
	</table>
	<input type="submit" value="전송">
	<input type="reset" value="초기화">
</form>
</body>
</html>