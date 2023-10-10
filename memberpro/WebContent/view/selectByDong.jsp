<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ZipVO> list = (List<ZipVO>)request.getAttribute("result");

Gson gson = new Gson();
String result = gson.toJson(list); // gson을 문자열의 리스트로 저장?

out.print(result);
out.flush(); // 모든 결과 데이터를 밀어버림
%>