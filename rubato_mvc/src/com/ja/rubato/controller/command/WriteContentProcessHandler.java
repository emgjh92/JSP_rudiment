package com.ja.rubato.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.rubato.model.BoardDao;
import com.ja.rubato.vo.MemberVo;
//+++++++++++++++++++++++++++++++++20200421 코드 추가+++++++++++++++++++++++++++++++++++++++
public class WriteContentProcessHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String b_title = request.getParameter("b_title");
		String b_content = request.getParameter("b_content");
		MemberVo memberVo = (MemberVo)request.getSession().getAttribute("sessionUserInfo");
		int m_no = memberVo.getM_no();
		
		new BoardDao().insert(m_no, b_title, b_content);

		return "redirect:./board_list.do"; //글을 다 쓴 후 메인 페이지로 리다이렉트
	}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

}
