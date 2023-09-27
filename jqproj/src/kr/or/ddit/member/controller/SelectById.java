package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class SelectById
 * 클래스 이름과 서블릿 이름이 다를 수 있지만 
 * ajax 설정의 url 주소를 서블릿 이름과 완전히 일치해야함
 */
@WebServlet("/SelectById.do")
public class SelectById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectById() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 클라이언트 요청시 전송데이터 받기
		String userId = request.getParameter("id");
		String userPass = request.getParameter("pass");
		
		// service 객체 얻기
		IMemberService service = MemberServiceImpl.getService();
		
		// service 메소드 호출하기 - 결과값 받기 => MemberVO
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", userId);
		map.put("pass", userPass);
		
		MemberVO vo = service.selectById(map);
		
		// 결과값을 view페이지로 이동하기 위해 저장
		request.setAttribute("result", vo);
		
		// forward를 위한 객체 생성 - 생성 시 new가 아닌 get메서드로 생성
		RequestDispatcher disp = request.getRequestDispatcher("/0926/viewSelectOne.jsp");
		
		// forward 실행
		disp.forward(request, response);
	}

}
