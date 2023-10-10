package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.ZipVO;

@WebServlet("/selectByDong.do")
public class SelectByDong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8"); // post 방식에는 인코딩 필수
		// 전송데이터 받기 - "dong"
		String userAdd = request.getParameter("dong");
    	// Service객체 얻기
    	IMemberService service = MemberServiceImpl.getService();
    	// service 메소드 호출 - 결과값은 List
    	List<ZipVO> list = service.selectByDong(userAdd);
    	// list에 결과 저장
    	request.setAttribute("result", list);
    	// jsp view 페이지 설정 - forward
    	request.getRequestDispatcher("/view/selectByDong.jsp").forward(request, response);
	}
}