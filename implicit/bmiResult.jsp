<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String he = request.getParameter("height");
	String we = request.getParameter("weight");
	double height = 0, weight = 0;
	try {
		height = Double.parseDouble(he);
		weight = Double.parseDouble(we);
	} catch (NumberFormatException e) {
		response.sendRedirect("bmiForm.jsp");
	}
	
	double std = (height - 100) * 0.9;
	double over = weight / std * 100;
	String message ="";
	
	if (over >= 130)
		message = "고도비만";
	else if (over >= 120)
		message = "비만";
	else if (over >= 110)
		message = "과체중";
	else if (over >= 100)
		message = "정상";
	else
		message = "저체중";
	
	out.print(name + "님의 비만도는 " + String.format("%.2f", over) + "%로 " + message + "입니다.");
	/*출력 예제 : 홍길동님의 비만도는 112.15% 로 과체중 입니다. */
%>