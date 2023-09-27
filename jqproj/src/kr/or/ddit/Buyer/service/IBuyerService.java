package kr.or.ddit.Buyer.service;

import java.util.List;

import kr.or.ddit.Buyer.vo.BuyerVO;

public interface IBuyerService {
	public List<BuyerVO> selectName();
	public BuyerVO selectById(String id);
}
