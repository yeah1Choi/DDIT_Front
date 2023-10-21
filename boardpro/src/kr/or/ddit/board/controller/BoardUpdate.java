package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/BoardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 전송데이터 받기 - vo에 저장
		BoardVO vo = new BoardVO();

		try {
			BeanUtils.populate(vo, request.getParameterMap());
			// getParameterMap() : vo의 값을 키값으로 가짐
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// wip 추가
		vo.setWip(request.getRemoteAddr());

		// service 객체
		IBoardService service = BoardServiceImpl.getInstance();

		// service 메소드 호출
		int res = service.updateBoard(vo);

		request.setAttribute("result", res);

		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

}