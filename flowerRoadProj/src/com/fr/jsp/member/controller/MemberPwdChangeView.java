package com.fr.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.service.MemberService;
import com.fr.jsp.member.model.vo.Member;

@WebServlet("/pwdChangeView.me")
public class MemberPwdChangeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MemberPwdChangeView() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		System.out.println(id);
		
		Member m = new Member(id);
		
		MemberService ms = new MemberService();
		
		m = ms.pwdChangeView(m);
		
		if(m != null){
			/*HttpSession session = request.getSession();
			session.setAttribute("session", m);*/
			request.getRequestDispatcher("/views/myPage/myPage_pwdChange.jsp")
			.forward(request, response);
			
		}else{
			System.out.println("존재하지 않는 ID 입니다.");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
