package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

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
	public List<MemberVO> selectMember() {
//		List<MemberVO> list = null;
//		list = dao.selectMember();
//		return list;
		
		return dao.selectMember();
	}

	@Override
	public MemberVO selectById(Map<String, Object> map) {
		MemberVO vo = null;
		vo = dao.selectById(map);
		return vo;
	}

	@Override
	public String idcheck(String id) {
		String sameid = null;
		sameid = dao.idcheck(id);
		return sameid;
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		List<ZipVO> list = null;
		list = dao.selectByDong(dong);
		return list;
	}

	@Override
	public int insertMember(MemberVO vo) {
		int success = 0; 
		success = dao.insertMember(vo);
		return success;
	}
}