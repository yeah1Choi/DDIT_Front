<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
border: 1px solid blue;
margin: 30px auto;
}
td {
border: 1px solid blue;
width:200px;
height: 50px;
text-align: center;
font: 1.5rem;
}

h1 {
color: red;
text-align: center;
}
.head {
background: blue;
color: white;
font-weight: bold;
}
</style>
</head>
<body>
	<h1>JAP : Jave Server Page</h1>
	<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("id");
	String userName = request.getParameter("name");
	String userAddr = request.getParameter("addr");
	%>
	<table>
		<tr>
			<td class = "head">아이디</td>
			<td><%=userId%></td>
		</tr>
		<tr>
			<td class = "head">이름</td>
			<td><%=userName%></td>
		</tr>
		<tr>
			<td class = "head">비밀번호</td>
			<td><%=userAddr%></td>
		</tr>
	</table>
</body>
</html>