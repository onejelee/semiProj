package com.fr.jsp.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.order.model.service.OrderService;
import com.fr.jsp.order.model.vo.Order;
import com.fr.jsp.common.PageInfo;

@WebServlet("/orderChk.or")
public class MemberOrderCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberOrderCheck() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		ArrayList<Order> list = null;
		OrderService oService = new OrderService();
		
		Member m = (Member)session.getAttribute("m");
		String id = m.getMemberId();
		// -- 페이지 처리 코드 부분 -- //
		
		int startPage; // 한번에 표시될 게시글들의 시작 페이지
		int endPage; // 한번에 표시될 게시글들의 마지막 페이지
		int maxPage; // 전체 페이지의 마지막 페이지
		int currentPage; // 현재 페이지
		int limit; //한 페이지당 게시글 수
				
		//게시판은 1페이지부터 시작한다.
		currentPage = 1;
			
		//한 페이지에 보여질 게시글 수
		limit = 10;
				
		//만약에 전달받는 페이지가 있을 경우 즉, 현재 페이지 정보를 받을 경우  currentPage의 값을 수정한다.
		if(request.getParameter("currentPage")!=null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		//전체 게시글의 수
		int listCount = oService.getListCount(id);
		System.out.println("총 게시글 수 : "+listCount);
				
		//총 게시글 수에 대한 페이지 계산
		//ex) 목록의 수가 123개라면 페이지수는 13개페이지
		//짜투리 게시글도 하나의 페이지로 취급해야 한다.
		// 10 / 1 -->0.9를 더하여 하나의 페이지로 만든다.
		maxPage = (int)((double)listCount / limit +0.9);
		// 현재 화면에 표시할 페이지 개수
		// 첫 페이지의 번호
		// Ex) 한 화면에 10개의 페이지를 표시하는 경우
		// 1, 11, 21 ...
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1; 
				
		//한 화면에 표시할 마지막 페이지 번호
		endPage = startPage + limit - 1;
				
		if(maxPage<endPage){
			endPage = maxPage;
		}
		//페이지 관련 변수 전달용 VO 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, startPage, endPage, maxPage);
				
		// -- 페이지 처리 코드 부분 -- //	
		
		
		
		list = new OrderService().orderChk(id);
		
		String page ="";
		if(list != null && !list.isEmpty()){
			page = "/views/myPage/orderCheck.jsp";
			request.setAttribute("list", list);
		} else {
			System.out.println("실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
