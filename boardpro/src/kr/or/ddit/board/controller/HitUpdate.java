package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/HitUpdate.do")
public class HitUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전송데이터받기
		int num = Integer.parseInt(request.getParameter("num"));
		//service 객체
		IBoardService service = BoardServiceImpl.getInstance();
		// service 메소드 호출
		int res = service.updateHit(num);
		// 결과값을 request에 저장
		request.setAttribute("result",res);
		// view 페이지 설정(result.jsp) - forward
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

}