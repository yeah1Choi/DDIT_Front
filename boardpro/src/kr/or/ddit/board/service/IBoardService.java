package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;

public interface IBoardService {
	// 리스트 가져오기 - 한 페이지당 3개씩 가져오기
	public List<BoardVO> selectBoardList(Map<String, Object> map);
	
	// 전체 글 갯수 구하기
	public int getTotalCount(Map<String, Object> map);
	
	// 저장
	public int insertBoard(BoardVO vo);
	
	// 삭제 - 삭제 선택에 따라 파라미터 선정이 달라짐(예, 다중선택 후 삭제?)
	public int deleteBoard(int boardNo);
	
	// 수정 - 한개만 수정한다고 해도 전체가 수정되는 느낌?.. insert와 같은 맥락으로 이해..
	public int updateBoard(BoardVO vo);
	
	// 조회수 증가 - BOARDTAB 테이블의 HIT 컬럼 증가
	public int updateHit(int boardNo);
	
	// 페이지별 정보 구하기 - start, end, 총 페이지 수 구하기
	public PageVO pageInfo(int page, String stype, String sword);
}
