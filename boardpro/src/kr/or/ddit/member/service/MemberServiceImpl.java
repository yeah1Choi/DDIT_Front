package kr.or.ddit.member.service;

import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

/*
	dao 객체 필요
	싱글톤을 위한 자기자신의 객체를 생성해서 리턴하는 메소드
*/
public class MemberServiceImpl implements IMemberService {

	private IMemberDao dao;

	private static IMemberService service;

	// 생성자
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getDao();
	}

	public static IMemberService getService() {
		if (service == null)
			service = new MemberServiceImpl();
		return service;
	}

	@Override
	public MemberVO selectById(Map<String, Object> map) {
		MemberVO vo = null;
		vo = dao.selectById(map);
		return vo;
	}

}