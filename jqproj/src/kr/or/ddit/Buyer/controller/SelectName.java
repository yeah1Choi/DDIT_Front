package kr.or.ddit.Buyer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.Buyer.service.BuyerServiceImpl;
import kr.or.ddit.Buyer.service.IBuyerService;
import kr.or.ddit.Buyer.vo.BuyerVO;

@WebServlet("/SelectName.do")
public class SelectName extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트 요청시 전송 데이터 받기
		
		// service 객체 얻어오기
		IBuyerService service = BuyerServiceImpl.getInstance();
		// service 메소드 호출해서 결과값 list에 받기
		List<BuyerVO> list = service.selectName();
		// request에 결과를 저장한다
		request.setAttribute("result", list);
		// view 페이지 설정 - 
		RequestDispatcher disp = request.getRequestDispatcher("/0926/buyerName.jsp");
		// forward
		disp.forward(request, response);
	}

}
