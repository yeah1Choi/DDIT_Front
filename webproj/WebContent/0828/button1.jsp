<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border: 1px solid orange;
	margin: 30px auto;
}

td {
	border: 1px solid orange;
	text-align: center;
	width: 100px;
	height: 50px;
}

h1 {
	text-align: center;
}

.head {
	background: orange;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>JSP : Java Server Page</h1>
	<%
		// 클라이언트에서 전송된 데이터 가져오기
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("id");
	String userName = request.getParameter("name");
	String intro = request.getParameter("area");
	
	// intro에는 엔터기호(\r\n)이 포함
	// : \n을 <br>태그로 변환
	intro = intro.replaceAll("\n","<br>");
	%>

	<table>
		<tr>
			<td class="head">아이디</td>
			<td><%=userId%></td>
		</tr>
		<tr>
			<td class="head">이름</td>
			<td><%=userName%></td>
		</tr>
		<tr>
			<td class="head">자기소개</td>
			<td><%=intro%></td>
		</tr>
	</table>
</body>
</html>