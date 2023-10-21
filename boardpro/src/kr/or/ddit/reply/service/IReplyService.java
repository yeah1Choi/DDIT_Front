package kr.or.ddit.reply.service;

import java.util.List;

import kr.or.ddit.reply.vo.ReplyVO;

public interface IReplyService {
	// 댓글 작성(저장) - 반환값 : int, 파라미터값 : vo, 메소드명 : insertReply 
	public int insertReply(ReplyVO vo);
	
	// 댓글 삭제 - 반환값 : int, 파라미터값 : int, 메소드명 : deleteReply 
	public int deleteReply(int rnum);
	
	// 댓글 수정 - 반환값 : int, 파라미터값 : vo, 메소드명 : updateReply 
	public int updateReply(ReplyVO vo);
	
	// 댓글 리스트 - 반환값 : List, 파라미터값 : int, 메소드명 : listReply 
	public List<ReplyVO> listReply(int bnum);
}
