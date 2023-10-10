package kr.or.ddit.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.reply.vo.ReplyVO;

public class ReplyDaoImpl implements IReplyDao {
	private static IReplyDao dao;
	
	private SqlSession sqlSession;
	
	public static IReplyDao getInstance() {
		if(dao == null) dao = new ReplyDaoImpl();
		return dao;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		sqlSession = MyBatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("reply.~~", vo);
			
			if (cnt > 0) {
				System.out.println("데이터가 성공적으로 추가되었습니다.");
				sqlSession.commit();
			} else {
				System.out.println("데이터 추가를 실패했습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public int deleteReply(int replyNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyVO> listReply(int replyNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
