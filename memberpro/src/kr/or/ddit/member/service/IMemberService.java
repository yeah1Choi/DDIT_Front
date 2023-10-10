package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberService {
	// 메소드 선언

	// 전체 리스트 가져오기
	public List<MemberVO> selectMember();

	// id, pass 검색 데이터 가져오기
	public MemberVO selectById(Map<String, Object> map);
	
	// 아이디 중복 검사
	public String idcheck (String id);

	// 우편번호 검색
	public List<ZipVO> selectByDong (String dong);

	// 저장하기
	public int insertMember (MemberVO vo);
}
