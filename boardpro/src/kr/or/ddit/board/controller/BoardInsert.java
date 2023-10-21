package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/BoardInsert.do")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 전송데이터 받기
		String writerData = request.getParameter("writer");
		String subjectData = request.getParameter("subject");
		String passData = request.getParameter("password");
		String mailData = request.getParameter("mail");
		String contentData = request.getParameter("content");
		
		// vo에 설정
		BoardVO vo = new BoardVO();
		
		vo.setWriter(writerData);
		vo.setSubject(subjectData);
		vo.setPassword(passData);
		vo.setMail(mailData);
		vo.setContent(contentData);
		
		// 글쓴이의 IP주소를 가져오는 방법
		vo.setWip(request.getRemoteAddr());
		
		// service 객체
		IBoardService service = BoardServiceImpl.getInstance();
		// service 메소드 - 결과값 int
		int res = service.insertBoard(vo);
		// 결과값을 request에 저장
		request.setAttribute("result", res);
		//  view 페이지 설정 - forward - 비동기는 view로 가야함
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

}