<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 클라이언트 요청시 전송데이터 받기

// service객체 얻기
IMemberService service = MemberServiceImpl.getService();
// service메소드 호출 -> List로 결과값 얻기
List<MemberVO> list = service.selectMember();
// List 결과로 json객체 배열형태의 응답결과를 생성한다
// view 페이지로 이동 - viewSelect.jsp - list 결과를 갖고
// controller와 view페이지가 list결과를 공유해야한다
// request와 reponse객체가 공유되는 forward방식

request.setAttribute("listvalue",list);
// request 객체는 이미 포함되어 있어 따로 생성하지 않아도 호출이 가능하다

RequestDispatcher disp = request.getRequestDispatcher("viewSelect.jsp");

disp.forward(request, response);
%>