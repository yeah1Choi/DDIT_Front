<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 클라이언트에서 전송되는 값을 받는다 -> id, pass
String userId = request.getParameter("id");
String userPass = request.getParameter("pass");

// DB에서 member테이블에서 id와 pass가 일치하는 사람 검색
SqlSession sql = MyBatisUtil.getSqlSession();

Map<String, Object> map = new HashMap<String, Object>();
map.put("id", userId);
map.put("pass", userPass);

MemberVO vo = null;
try {
	vo = sql.selectOne("member.selectById", map);
} catch (Exception e) {
	e.printStackTrace();
} finally {
	sql.commit();
	sql.close();
}

// 결과값 vo를 갖고 json데이터 생성

	if (vo != null) {
%>
	{ 	"sw" : "ok" ,
		"id" : "<%=vo.getMEM_ID()%>", 
		"name" : "<%=vo.getMEM_NAME()%>",
		"mail" : "<%=vo.getMEM_MAIL()%>", 
		"hp" : "<%=vo.getMEM_HP()%>",
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