package kr.or.ddit.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;
/*
	Dao : Data Access Object 
	SqlSession 객체 필요
	Singleton을 위한 자신의 객체 생성해서 return하는 메소드 필요 (getdao)
*/
public class MemberDaoImpl implements IMemberDao {

	private static IMemberDao dao;
	
	private SqlSession sqlSession;
	
	public static IMemberDao getDao() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	} 
	
	// 생성자없다 - sqlSession을 갖고 여러번 사용이 안됨 
	//  DB쓰면서 데이터가 계속 달라지기 때문에  메소드마다 하나씩 사용 
	@Override
	public MemberVO selectById(Map<String, Object> map) {
		sqlSession = MyBatisUtil.getSqlSession();
		MemberVO vo = null;
		try {
			vo = sqlSession.selectOne("member.selectById", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return vo;
	}

}