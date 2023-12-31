package kr.or.ddit.lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.lprod.service.ILprodService;
import kr.or.ddit.lprod.service.LprodServiceImpl;
import kr.or.ddit.lprod.vo.LprodVO;

@WebServlet("/selectLprod.do")
public class SelectLprod extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 클라이언트 요청시 전송 데이터 받기
		
		//service 객체 얻기
		ILprodService service = LprodServiceImpl.getInstance();
		
		// service 메소드 호출 - List 결과값
		List<LprodVO> list = service.selectLprod();
		
		// list 결과값을 request에 저장
		request.setAttribute("result", list);
		
		// jsp 페이지 설정 - Dispatcher
		RequestDispatcher disp = request.getRequestDispatcher("/0927/lprodList.jsp");
		
		// forward
		disp.forward(request, response);
	}
}