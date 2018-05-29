package com.fr.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fr.jsp.board.model.service.ReviewBoardService;
import com.fr.jsp.common.PageInfo;
import com.fr.jsp.product.model.service.ProductService;
import com.fr.jsp.product.model.vo.Product;
import com.fr.jsp.product.model.vo.ProductSimple;

/**
 * Servlet implementation class SelectProductListServlet
 */
@WebServlet("/selectProduct.do")
public class SelectProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductListServlet() {
        super();
        // TODO Auto-generated constructor stub 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//타입이랑 소팅 두가지 서비스 함수를 이용한다. 
				//ReviewBoardService rbs = new ReviewBoardService();
				//rbs.getSortedProductList(어떤 기준인지 스트링);
				//rbs.getTypicalProductList(어떤 기준인지 스트링);
				
				ArrayList<ProductSimple> list = new ArrayList<ProductSimple>();
				
				ProductService ps = new ProductService();
				
				
				
				int currPage=1; 		//현재 페이지
				int limit=9; 			//한 페이지당 게시글을 몇개 보여줄건지
				
				
				//currPage 가 있으면 currPage를 수정
				if(request.getParameter("currPage")!=null){
					currPage = Integer.parseInt(request.getParameter("currPage"));
				}
			
				//페이지 관련 변수 전달용 VO 생성
				PageInfo pi = new PageInfo(currPage,ps.getListCount(),limit);
			

				list = ps.getProductList(pi);
				
				
				String page ="";
				if(list!=null){
					
					page ="views/product/productList.jsp";
					request.setAttribute("list", list);
					request.setAttribute("pi", pi);
					
					
				}else{
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "상품 리스트를 불러올 수 없습니다.");
				}
				
				
				request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
