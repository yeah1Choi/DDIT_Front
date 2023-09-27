<%@page import="kr.or.ddit.Buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 저장한 데이터 꺼내기
	BuyerVO vo = (BuyerVO)request.getAttribute("result");

	// json 데이터 만들기
%>
{
	"buyer_id"       : "<%= vo.getBuyer_id() %>",
	"buyer_name"     : "<%= vo.getBuyer_name() %>",
	"buyer_lgu"      : "<%= vo.getBuyer_lgu() %>",
	"buyer_bank"     : "<%= vo.getBuyer_bank() %>",
	"buyer_bankno"   : "<%= vo.getBuyer_bankno() %>",
	"buyer_bankname" : "<%= vo.getBuyer_bankname() %>",
	"buyer_zip"      : "<%= vo.getBuyer_zip() %>",
	"buyer_add1"     : "<%= vo.getBuyer_add1() %>",
	"buyer_add2"     : "<%= vo.getBuyer_add2() %>",
	"buyer_mail"     : "<%= vo.getBuyer_mail() %>"
}