<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// 클라이언트에서 전송되는 값을 받는다

// DB처리
SqlSession sql = MyBatisUtil.getSqlSession();

List<LprodVO> lprodList = sql.selectList("lprod.selectLprod");

// list로 json 객체 배열을 생성한다
%>

[
<%
	for (int i = 0; i < lprodList.size(); i++) {
	LprodVO lprvo = lprodList.get(i);
	if (i > 0) out.print(",");
%>
{ "id" : "<%=lprvo.getLprod_id()%>", 
"gu" : "<%=lprvo.getLprod_gu()%>",
"nm" : "<%=lprvo.getLprod_nm()%>" }
<%
	}
%>
]
