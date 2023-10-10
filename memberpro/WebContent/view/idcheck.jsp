<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String res = (String)request.getAttribute("result");

if(res == null) { // 아이디 중복 아님 - 사용가능
%>
	{
		"flag" : "사용 가능 아이디입니다"
	}
<%	
} else { // 아이디 중복 - 사용불가능
%>
	{
		"flag" : "사용 불가능 아이디입니다"
	}	
<%	
}
%>