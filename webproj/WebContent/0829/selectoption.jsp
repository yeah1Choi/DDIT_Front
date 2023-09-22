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
	color: #141E46;
}

table {
	margin: 30px auto;
}

td {
	border: 1px solid #141E46;
	background: #FFF5E0;
	text-align: center;
	height: 50px;
	width: 250px;
}

th {
	background: #141E46;
	color: #FFF5E0;
	font-weight: bold;
	height: 50px;
	width: 250px;
}
</style>
</head>
<body>
	<h1>JSP : Java Server Page</h1>
	<%
		request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("id");
	String userPass = request.getParameter("pass");
	String userBirth = request.getParameter("birth");
	String food = request.getParameter("food");

	String foodMulti[] = request.getParameterValues("foodmulti");

	String str = ""; /* 배열로부터 받은 문자열 데이터 저장 변수 */
	if(foodMulti != null && foodMulti.length > 0) { /* null exception 잡기위함 */
		for (int i = 0; i < foodMulti.length; i++) { 
			str += foodMulti[i] + "&nbsp;&nbsp;&nbsp;" ;
		}
	}
	%>

	<table border="1">
		<tr>
			<th>아이디</th>
			<td><%=userId%></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><%=userPass%></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%=userBirth%></td>
		</tr>
		<tr>
			<th>좋아하는 음식</th>
			<td><%=food%></td>
		</tr>
		<tr>
			<th>좋아하는 음식들</th>
			<td><%=str%></td>
		</tr>
	</table>
</body>
</html>