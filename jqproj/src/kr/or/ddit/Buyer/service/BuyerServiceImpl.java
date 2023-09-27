package kr.or.ddit.Buyer.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.Buyer.dao.BuyerDaoImpl;
import kr.or.ddit.Buyer.dao.IBuyerDao;
import kr.or.ddit.Buyer.vo.BuyerVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;
/*
	dao 객체 얻어오기 - 생성자 이용
	싱글톤을 위한 자신의 객체 생성해서 리턴
*/
public class BuyerServiceImpl implements IBuyerService {

	private IBuyerDao dao;
	private static IBuyerService service;
	
	private BuyerServiceImpl() { // controller에서 접근을 막기위해 private으로 접근제한자
		dao = BuyerDaoImpl.getInstance();
	}
	
	// 자신의 객체 생성
	public static IBuyerService getInstance() {
		if(service == null) service = new BuyerServiceImpl();
		return service;
	}

	@Override
	public List<BuyerVO> selectName() {
		List<BuyerVO> list = null;
		list = dao.selectName();
		return list;
	}

	@Override
	public BuyerVO selectById(String id) {
		BuyerVO vo = null;
		vo = dao.selectById(id);
		return vo;
	}
}