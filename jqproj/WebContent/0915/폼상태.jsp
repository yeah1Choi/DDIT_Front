<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
p {
	border: 2px dotted red;
	padding: 20px;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("id");
	String userPass = request.getParameter("pass");
	String userSel = request.getParameter("disSelect");
	String userAge = request.getParameter("age");
	%>

	<p><%=userId%>님 환영합니다</p>
	<p>pass : <%=userPass%></p>
	<p>select-option : <%=userSel%></p>
	<p>age : <%=userAge%></p>
	</body>
</html>