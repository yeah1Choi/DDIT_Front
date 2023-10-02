package kr.or.ddit.prod.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

@WebServlet("/selectByIdDetail.do")
public class SelectByIdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 클라이언트 요청시 전송 데이터 받기
		String prodId = request.getParameter("pid");
		// service 객체 얻기
		IProdService service = ProdServiceImpl.getInstance();
		// service 메소드 호출
		ProdVO vo = service.selectByIdDetail(prodId);
		// list 결과값을 request에 저장
		request.setAttribute("result", vo);
		// jsp 페이지 설정 - Dispatcher // forward
		request.getRequestDispatcher("/0927/prodIdDetail.jsp").forward(request, response);
	}
}