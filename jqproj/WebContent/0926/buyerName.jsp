<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.Buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿에서 저장한 결과데이터 꺼내기
List<BuyerVO> list = (List<BuyerVO>)request.getAttribute("result");

//결과 json Obj객체 데이터 생성
%>
[
<% 
 	for(int i = 0;i<list.size();i++) {
 		BuyerVO vo = list.get(i);
 		if(i>0) out.print(",");
%>
		{   
			"buyer_id" : "<%= vo.getBuyer_id() %>", 
			"buyer_name" : "<%= vo.getBuyer_name() %>"
		}
<% 
	}
%>
]