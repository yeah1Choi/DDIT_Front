<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	color: red;
}

table {
	border: 2px solid blue;
}

td {
	border: 1px solid blue;
	width: 200px;
	height: 50px;
	text-align: center;
}
</style>
</head>
<body>
	<h1>JSP : Java Server Page</h1>
	<p>HTML에 Java언어를 이용하여 웹페이지를 만듬</p>
	<p>JSP는 서버에서 실행되는 프로그램</p>
	<p>Java언어 기술시 &lt;% %> 기호 사이에 기술한다</p>
	<p>Java 실행 후 결과는 &lt;%= %>를 이용하여 출력한다</p>

	<%
		// 클라이언트가 자료 제출시 입력한 데이터를 가져온다 - 연결된 html에서 input name 속성을 적는다
	String userId = request.getParameter("id");
	String userPass = request.getParameter("pass");

	// userId와 userPass를 이용하여 데이터 베이스 crud처리를 한다
	// 처리결과를 response를 통해 클라이언트로 보낸다
	%>

	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=userId%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=userPass%></td>
		</tr>
	</table>
</body>
</html>