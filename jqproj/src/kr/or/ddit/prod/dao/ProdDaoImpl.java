package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {

	private static IProdDao dao;
	private SqlSession sqlSession;
	
	public static IProdDao getInstance() {
		if(dao == null) dao = new ProdDaoImpl();
		return dao;
	}
	
	@Override
	public List<ProdVO> selectByLgu(String lgu) {
		sqlSession = MyBatisUtil.getSqlSession();
		List<ProdVO> list = null;
		
		try {
			list = sqlSession.selectList("prod.selectByLgu", lgu);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return list;
	}

	@Override
	public ProdVO selectByIdDetail(String pid) {
		sqlSession = MyBatisUtil.getSqlSession();
		ProdVO vo = null;
		
		try {
			vo = (ProdVO) sqlSession.selectList("prod.selectByIdDetail", pid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return vo;
	}

}
