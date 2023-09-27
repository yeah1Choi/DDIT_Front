package kr.or.ddit.Buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.Buyer.vo.BuyerVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;
/*
	sqlSession 객체 가져오기
	싱글톤을 위한 자신의 객체 생성한 후 리턴하기
	
	생성자를 정의하지 않으면 알아서 default 생성자를 갖고 있음
*/
public class BuyerDaoImpl implements IBuyerDao {
	
	private SqlSession session;
	
	private static IBuyerDao dao;
	
	public static IBuyerDao getInstance() {
		if(dao == null) dao = new BuyerDaoImpl();
		return dao;
	}

	@Override
	public List<BuyerVO> selectName() {
		session = MyBatisUtil.getSqlSession();
		List<BuyerVO> list = null;
		
		try {
			list = session.selectList("buyer.selectName");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return list;
	}

	@Override
	public BuyerVO selectById(String id) {
		session = MyBatisUtil.getSqlSession();
		BuyerVO vo = null;
		
		try {
			vo = session.selectOne("buyer.selectById", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return vo;
	}
}