package com.fr.jsp.product.model.service;

import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.common.PageInfo;
import com.fr.jsp.product.model.dao.ProductDao;
import com.fr.jsp.product.model.vo.Product;
import com.fr.jsp.product.model.vo.ProductSimple;

public class ProductService {

	public ArrayList<Product> getProductList() {
		
		
		ArrayList<Product> list = null;
		
		Connection con = getConnection();
		
		
		list =new ProductDao().getProductList(con); 
		
		
		if(list!=null)commit(con);
		else rollback(con);
		
		
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int result= 0;
		
		result = new ProductDao().getProductCount(con);
		
		
		return result;
	}

	public ArrayList<ProductSimple> getProductList(PageInfo pi) {
		ArrayList<ProductSimple> list = new ArrayList<ProductSimple>();
		Connection con = getConnection();
		
		
		list = new ProductDao().getProductList(con,pi);
		
		
		
		
		return list;
	}

	public Product getOneProduct(String productNum) {
		
		Connection con = getConnection();
		
		Product p = new ProductDao().getOneProduct(con,productNum); 
		
		if(p!=null)commit(con);
		else rollback(con);
		
		return p;
	}

	public ArrayList<Product> getCategorizedProduct() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<ProductSimple> getCategorizedProductList(String category ,PageInfo pi) {
		
		ArrayList<ProductSimple> list = new ArrayList<ProductSimple>();
		Connection con = getConnection();
		
		list = new ProductDao().getCategorizedProductList(con,category,pi);
		
		return list;
	}

	public int getListCount(String category) {
Connection con = getConnection();
		
		int result= 0;
		
		result = new ProductDao().getProductCount(con,category);
		
		
		return result;
	}

}
