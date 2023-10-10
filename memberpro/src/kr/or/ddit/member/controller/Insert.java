package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("mem_id");
		String userPass = request.getParameter("mem_pass");
		String userNm = request.getParameter("mem_name");
		String userBir = request.getParameter("mem_bir");
		String userTel = request.getParameter("mem_hp");
		String userMail = request.getParameter("mem_mail");
		String userZip = request.getParameter("mem_zip");
		String userAdd1 = request.getParameter("mem_add1");
		String userAdd2 = request.getParameter("mem_add2");
		
		IMemberService service = MemberServiceImpl.getService();
		
		MemberVO vo = new MemberVO();
		
		vo.setMem_id(userId);
		vo.setMem_pass(userPass);
		vo.setMem_name(userNm);
		vo.setMem_bir(userBir);
		vo.setMem_hp(userTel);
		vo.setMem_mail(userMail);
		vo.setMem_zip(userZip);
		vo.setMem_add1(userAdd1);
		vo.setMem_add2(userAdd2);
		// service 메소드 호출 - int
		int res = service.insertMember(vo);
		// int 저장
		request.setAttribute("result", res);
		request.setAttribute("name", userNm);
		// view 페이지 설정 - forward
		request.getRequestDispatcher("/view/insert.jsp").forward(request, response);
	}
}