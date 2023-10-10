package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/boardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 전송데이터 받기
		int spage = Integer.parseInt(request.getParameter("page"));
		// 최초 실행시는 없음
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");

		System.out.println("page : " + spage);
		System.out.println("stype : " + stype);
		System.out.println("sword : " + sword);
		
		//
		IBoardService service = BoardServiceImpl.getInstance();
	}
}