<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//클라이언트 전송시 데이터 받기

//DB를 이용한 crud 처리를 한다

//crud 처리결과로 응답데이터를 생성 -> json 배열 객체 
// select * from member;
%>
[
	{ 
		  "name"  : "홍길동",
		  "id"    : "a001", 
		  "tel"   : "010-1234-5678",
		  "addr"  : "대전 중구 오류동",
		  "email" : "honggildong@ddit.or.kr"
	}
	,{ 
		  "name"  : "개나리",
		  "id"    : "a002", 
		  "tel"   : "010-9876-5432",
		  "addr"  : "대전 서구 둔산동",
		  "email" : "gaenari@ddit.or.kr"
	}
	,{ 
		  "name"  : "진달래",
		  "id"    : "a003", 
		  "tel"   : "010-1472-5836",
		  "addr"  : "대전 유성구 장대동",
		  "email" : "jindalrae@ddit.or.kr"
	}
]