package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class BoardDaoImpl implements IBoardDao {
	
	private static IBoardDao dao;
	
	private SqlSession sqlSession;
	
	public static IBoardDao getInstance() {
		if(dao == null) dao = new BoardDaoImpl();
		return dao;
	}

	@Override
	public List<BoardVO> selectBoardList(Map<String, Object> map) {
		sqlSession = MyBatisUtil.getSqlSession();
		List<BoardVO> list = null;
		
		try {
			list = sqlSession.selectList("board.selectBoardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return list;
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateHit(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
