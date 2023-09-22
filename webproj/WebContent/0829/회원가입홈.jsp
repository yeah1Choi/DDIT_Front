<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	text-align: center;
	color: blue;
}

table {
	border: 1px solid blue;
	margin: 30px auto;
	text-align: center
}

th, td {
	border: 1px solid blue;
	width: 200px;
	padding: 20px;
}
th {
	background: blue;
	color: white;
}
</style>
</head>
<body>
	<h1>JSP : Java Server Page</h1>
	<%
		request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("name");
	String userAdd = request.getParameter("address");
	String userEmail = request.getParameter("email");
	String userGender = request.getParameter("gender");
	String userInfo = request.getParameter("info");
	%>

	<table>
		<tr>
			<th>이름</th>
			<td><%=userName%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=userAdd%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=userEmail%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=userGender%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=userInfo%></td>
		</tr>
	</table>
</body>
</html>