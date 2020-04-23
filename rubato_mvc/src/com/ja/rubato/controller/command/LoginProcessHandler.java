//************************20200421 코드 추가********************************


package com.ja.rubato.controller.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ja.rubato.model.MemberDao;
import com.ja.rubato.vo.MemberVo;

public class LoginProcessHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		
		MemberVo memberVo = new MemberDao().selectByIdAndPw(m_id,m_pw);
		
		if(memberVo!=null) {
			//로그인 성공 ==> 세션에 값을 넣어준 후 main page로 redirect 시켜준다
			request.getSession().setAttribute("sessionUserInfo", memberVo);
			
			return "redirect:./index.do";
		}
		else {
			//로그인 실패
			return "/WEB-INF/view/login_fail.jsp";
		}
		
		
		//return null;
	}

}
//************************************************************************