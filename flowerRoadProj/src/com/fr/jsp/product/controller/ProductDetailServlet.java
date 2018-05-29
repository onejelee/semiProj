package com.fr.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.board.model.service.ReviewBoardService;
import com.fr.jsp.board.model.vo.ReviewBoard;
import com.fr.jsp.common.PageInfo;
import com.fr.jsp.product.model.service.ProductService;
import com.fr.jsp.product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/productDetail.do")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//변수 선언
		ArrayList<ReviewBoard> reviewList = null;
		ArrayList<Product> relatedProduct= null;
		Product p = null;
	
		ProductService ps = new ProductService();					//product 서비스
		ReviewBoardService rbs = new ReviewBoardService();			//리뷰 서비스
		
		String page = "";
		PageInfo pi =null;
		int currPage = 1; 											// 현재 페이지
		int limit = 5; 	
		
		
		
		//서블릿에서 건내 받기
		String productNum = request.getParameter("productNum"); //productList.jsp에서 받은 선택된 product 객체
		
		if(productNum!=null)
			productNum=productNum.trim();
	
		if (request.getParameter("currPage") != null) {				// currPage 가 있으면 currPage를 수정
			currPage = Integer.parseInt(request.getParameter("currPage"));
		}

		
		//서비스 실행
		pi = new PageInfo(currPage, rbs.getListCount(productNum), limit);// 페이지 관련 변수 전달용 VO 생성

		reviewList = rbs.selectList(productNum, pi);
		
		p = ps.getOneProduct(productNum);
		
		//relatedProduct = ps.getCategorizedProduct("");
		
		if (p != null&&reviewList!=null) {

			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pi", pi);
			request.setAttribute("product", p);
			page = "views/product/product.jsp";

		} else {
			
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 조회 실패 or 리뷰 보드 조회 실패");
			
			
		}
	

		request.getRequestDispatcher(page).forward(request, response);

	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
