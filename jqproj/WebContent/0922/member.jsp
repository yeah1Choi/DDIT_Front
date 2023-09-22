<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// Ŭ���̾�Ʈ ���۽� ������ �ޱ� - id, pass
// ���� ����� ����

// DB�� �̿��� crud ó���� �Ѵ�
// MyBatisUtil => mybatis-config.xml ������ ���� �ؼ� 
// => Factory ���� => SqlSession�� ���� => 
// => MybatisUtil���� SqlSession�� ���´�
SqlSession sql = MyBatisUtil.getSqlSession();

// SqlSession���� mapper ������ sql���� �����Ѵ� => ������� ��´�
// select * from member
List<MemberVO> memlist = sql.selectList("member.selectMember");

// crud ó������� ���䵥���͸� ���� - json �迭��ü
%>

[
<%
	for (int i = 0; i < memlist.size(); i++) {
	MemberVO memVo = memlist.get(i);
	if (i > 0) out.print(",");
	// json ��ü ����
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
