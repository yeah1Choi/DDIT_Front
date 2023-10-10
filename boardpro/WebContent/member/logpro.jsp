<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN/OUT</title>
<script type="text/javascript" src="http://localhost/boardpro/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	// 로그인
	$('#login').on('click', function(){
		// 입력한 아이디와 패스워드 값을 가져옴
		idvalue = $('#id').val().trim();
		passvalue = $('#pass').val().trim();
		
		// 입력데이터 형식 체크 - 정규식
		
		// 로그인 처리 - 서버로 보내기
		$.ajax({
			url : '<%=request.getContextPath()%>/logpro.do',
			data : {"id" : idvalue, "pass" : passvalue},
			type : 'post',
			success : function(res){
				location.href = "<%=request.getContextPath()%>/member/index.jsp";
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			},
			dataType : 'html'
		})
	})
	// 로그아웃
	$('#logout').on('click',function(){
		$.ajax({
			url : '<%=request.getContextPath()%>/logout.do',
			type : 'get',
			success : function(res){
				location.href = "<%=request.getContextPath()%>/member/index.jsp";
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			},
			dataType : 'html'
		})
	})
})
</script>
</head>
<body>
	<%
	// 로그인 체크 - 서블릿에서 저장한 session값을 얻어온다.
	MemberVO vo = (MemberVO) session.getAttribute("loginOK");
	String check = (String) session.getAttribute("check");

	if (vo == null) { // 로그아웃 상태 - 로그인 폼이 온다
	%>
		<input type="text" id="id" placeholder="id">
		<input type="password" id="pass" placeholder="pass">
		<button type="button" id="login">로그인</button> <br>
	<%
		} else if (vo != null) { // 로그인 상태 - 로그아웃 폼이 온다
	%>
		<span><%= vo.getMem_id() %>님 환영합니다 ! </span>
		<button type="button" id="logout">로그아웃</button>
	<%
		}

	if (check == "false") { // 로그인 완료
	%>
		<span id="check">로그인 오류 또는 비회원입니다...</span>
	<%
		}
	%>
</body>
</html>