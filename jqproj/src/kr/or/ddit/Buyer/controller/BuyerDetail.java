package kr.or.ddit.Buyer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.Buyer.service.BuyerServiceImpl;
import kr.or.ddit.Buyer.service.IBuyerService;
import kr.or.ddit.Buyer.vo.BuyerVO;

/**
 * Servlet implementation class BuyerDetail
 */
@WebServlet("/BuyerDetail.do")
public class BuyerDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 클라이언트 요청시 전송데이터 받기
		String bId = request.getParameter("id");
		// service 객체 얻기
		IBuyerService service = BuyerServiceImpl.getInstance();
		// service 메소드 호출 - 결과값 얻기 - selectById 메소드의 파라미터는 id, 리턴값은 vo
		BuyerVO vo = service.selectById(bId);
		// request에 저장 - view로 전달 위함
		request.setAttribute("result", vo);
		// forward를 위한 객체 얻기 - view 페이지 설정
		RequestDispatcher disp = request.getRequestDispatcher("/0926/buyerDetail.jsp");
		// forward
		disp.forward(request, response);
	}

}
