<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 서블릿에서 저장한 결과데이터 꺼내기
MemberVO vo = (MemberVO) request.getAttribute("result");

// 결과 json Obj객체 데이터 생성

if (vo != null) {
%>
{   
	"sw" : "ok",
	"id" : "<%=vo.getMEM_ID()%>", 
	"name" : "<%=vo.getMEM_NAME()%>",
	"hp" : "<%=vo.getMEM_HP()%>", 
	"mail" : "<%=vo.getMEM_MAIL()%>",
	"addr" : "<%=vo.getMEM_ADD1()%>" 
}
<%
	} else {
%>
	{
		"sw" : "no"
	}
<%
	}
%>