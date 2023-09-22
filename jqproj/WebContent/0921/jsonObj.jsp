<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//클라이언트 전송시 데이터 받기

//DB를 이용한 crud 처리를 한다

//crud 처리결과로 응답데이터를 생성 -> json객체
// select * from member where mem_id = 'a001';
%>
{ 
  "name"  : "홍길동",
  "id"    : "a001", 
  "tel"   : "010-1234-5678",
  "addr"  : "대전 중구 오류동",
  "email" : "hong@ddit.or.kr"
}
