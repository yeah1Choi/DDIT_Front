<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 서블릿에서 저장한 데이터 꺼내기
int success = (Integer) request.getAttribute("result");
String userNM = (String)request.getAttribute("name");

if (success > 0) { // insert 성공
%>
{
"sw": "<%= userNM %>님의 가입을 축하합니다!"
}
<%
	} else { // insert 실패
%>
{
"sw": "가입에 실패했습니다..."
}
<%
	}
%>