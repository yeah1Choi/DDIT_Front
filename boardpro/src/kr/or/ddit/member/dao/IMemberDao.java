package kr.or.ddit.member.dao;

import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {
	// id, pass 검색 데이터 가져오기
	public MemberVO selectById(Map<String, Object> map);
}
