package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;

public class BoardServiceImpl implements IBoardService {
	private IBoardDao dao;
	private static IBoardService service;
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	public static IBoardService getInstance() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}

	@Override
	public List<BoardVO> selectBoardList(Map<String, Object> map) {
		return dao.selectBoardList(map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		return dao.getTotalCount(map);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		return dao.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return dao.updateBoard(vo);
	}

	@Override
	public int updateHit(int boardNo) {
		return dao.updateHit(boardNo);
	}
	
	@Override
	public PageVO pageInfo(int page, String stype, String sword) {
		// DB와 관련 없이 일반 단순 로직 처리
		PageVO vo = new PageVO();
		
		// 전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		
		int count = this.getTotalCount(map);
		
		// 전체 페이지수 구하기
		int perList = PageVO.getPerList(); // 한 페이지에 출력되는 글 갯수
		int totalPage = (int)Math.ceil((double)count / perList);
		
		// start, end 값 구하기 - 1페이지 1,3  2페이지  4,6  3페이지 7,9 ~ 7페이지 19,21
		int start = (page - 1) * perList + 1;
		int end = start + perList - 1;
		if(end > count) end = count;
		
		// 시작페이지와 마지막페이지 구하기 - 1페이지 1,2  2페이지 1,2  3페이지 3,4  4페이지 3,4
		int perPage = PageVO.getPerPage(); // 현재 브라우저에 출력되는 페이지 갯수
		int startPage = ((page - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}
}