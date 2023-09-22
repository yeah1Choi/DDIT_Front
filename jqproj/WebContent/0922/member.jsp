<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// 클라이언트 전송시 데이터 받기 - id, pass
// 지금 현재는 없음

// DB를 이용한 crud 처리를 한다
// MyBatisUtil => mybatis-config.xml 파일을 재료로 해서 
// => Factory 생성 => SqlSession을 생성 => 
// => MybatisUtil에서 SqlSession을 얻어온다
SqlSession sql = MyBatisUtil.getSqlSession();

// SqlSession으로 mapper 파일의 sql문을 실행한다 => 결과값을 얻는다
// select * from member
List<MemberVO> memlist = sql.selectList("member.selectMember");

// crud 처리결과로 응답데이터를 생성 - json 배열객체
%>

[
<%
	for (int i = 0; i < memlist.size(); i++) {
	MemberVO memVo = memlist.get(i);
	if (i > 0) out.print(",");
	// json 객체 생성
%>

<%-- json object --%>
{
	"id" : "<%= memVo.getMEM_ID() %>",
	"name" : "<%= memVo.getMEM_NAME() %>",
	"hp" : "<%= memVo.getMEM_HP() %>",
	"addr" : "<%= memVo.getMEM_ADD1() %> <%= memVo.getMEM_ADD2() %>",
	"mail" : "<%= memVo.getMEM_MAIL() %>",
	"pass" : "<%= memVo.getMEM_PASS() %>"
}

<%
	}
%>
]
