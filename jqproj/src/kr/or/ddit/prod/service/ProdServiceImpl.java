package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdServiceImpl implements IProdService {
	
	private IProdDao dao;
	private static IProdService service;
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
	}
	public static IProdService getInstance() {
		if(service == null) service = new ProdServiceImpl();
		return service;
	}
	@Override
	public List<ProdVO> selectByLgu(String lgu) {
		List<ProdVO> list = null;
		list = dao.selectByLgu(lgu);
		return list;
	}

	@Override
	public ProdVO selectByIdDetail(String pid) {
		ProdVO vo = null;
		vo = dao.selectByIdDetail(pid);
		return vo;
	}

}
