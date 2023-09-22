<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP : Java Server Page</h1>
	<%
		request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("id");
	String userPass = request.getParameter("password");
	String userName = request.getParameter("name");
	String userEmail = request.getParameter("email");
	String userTel = request.getParameter("tel");
	String userAdd = request.getParameter("address");
	%>
	<h4>비밀번호 : disabled</h4>
	<%=userPass%>
	<br>
	<h4>주소 : readonly</h4>
	<%=userAdd%>
</body>
</html>