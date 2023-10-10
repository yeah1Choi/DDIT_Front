package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;
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
	public List<MemberVO> selectMember() {
		sqlSession = MyBatisUtil.getSqlSession();
		List<MemberVO> list = null;
		try {
			list = sqlSession.selectList("member.selectMember");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list;
	}

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
	// 아이디 중복 체크
	@Override
	public String idcheck(String id) {
		sqlSession = MyBatisUtil.getSqlSession();
		String sameid = null;
		try {
			sameid = sqlSession.selectOne("member.idcheck", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return sameid;
	}
	// 우편번호 찾기
	@Override
	public List<ZipVO> selectByDong(String dong) {
		sqlSession = MyBatisUtil.getSqlSession();
		List<ZipVO> list = null;
		try {
			list = sqlSession.selectList("member.selectByDong", dong);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list;
	}

	@Override
	public int insertMember(MemberVO vo) {
		sqlSession = MyBatisUtil.getSqlSession();
		int success = 0;
		try {
			success = sqlSession.insert("member.insertMember", vo);
			
			if (success > 0) {
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
		return success;
	}
}