package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트 요청시 전송데이터 받기
		String userId = request.getParameter("id");
		// service 객체 받기
		IMemberService service = MemberServiceImpl.getService();
		// service 메소드 호출, 결과값 받기
		String res = service.idcheck(userId); 
		// 결과값을 view로 이동하기 위해 저장
		request.setAttribute("result", res);
		// forward를 위한 객체 생성
		RequestDispatcher disp = request.getRequestDispatcher("/view/idcheck.jsp");
		// forward 실행
		disp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
