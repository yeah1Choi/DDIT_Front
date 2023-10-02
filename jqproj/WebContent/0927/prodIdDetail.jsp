<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
ProdVO vo = (ProdVO)request.getAttribute("result");

Gson gson = new Gson();
String result = gson.toJson(vo);
out.print(result);
%>
<%-- { 
	"prod_id" : "<%=vo.getProd_id()%>", 
	"prod_name" : "<%=vo.getProd_name()%>",
	"prod_lgu" : "<%=vo.getProd_lgu()%>",
	"prod_buyer" : "<%=vo.getProd_buyer()%>",
	"prod_cost" : "<%=vo.getProd_cost()%>",
	"prod_price" : "<%=vo.getProd_price()%>",
	"prod_sale" : "<%=vo.getProd_sale()%>",
	"prod_outline" : "<%=vo.getProd_outline()%>",
	"prod_detail" : "<%=vo.getProd_detail()%>",
	"prod_size" : "<%=vo.getProd_size()%>",
	"prod_color" : "<%=vo.getProd_color()%>"
} --%>