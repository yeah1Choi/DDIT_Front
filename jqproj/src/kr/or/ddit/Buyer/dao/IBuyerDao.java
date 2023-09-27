package kr.or.ddit.Buyer.dao;

import java.util.List;

import kr.or.ddit.Buyer.vo.BuyerVO;

public interface IBuyerDao {
	public List<BuyerVO> selectName();
	public BuyerVO selectById(String id);
}
