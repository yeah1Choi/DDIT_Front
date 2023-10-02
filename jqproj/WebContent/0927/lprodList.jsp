<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 서블릿에서 저장한 데이터 꺼내기
List<LprodVO> list = (List<LprodVO>)request.getAttribute("result");

// 라이브러리(gson)를 이용해 아래 식을 간단히 작성
Gson gson = new Gson();
String result = gson.toJson(list);
out.print(result);
%>
<%-- [
<%
for(int i=0;i<list.size();i++) {
	LprodVO vo = list.get(i);
	if(i>0) out.print(",");
%>
{
	"lprod_gu" : "<%= vo.getLprod_gu() %>",
	"lprod_id" : "<%= vo.getLprod_id() %>",
	"lprod_nm" : "<%= vo.getLprod_nm() %>"
}
<%
}
%>
] --%>