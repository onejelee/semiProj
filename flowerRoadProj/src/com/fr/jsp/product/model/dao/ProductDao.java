package com.fr.jsp.product.model.dao;

import static com.fr.jdbc.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.common.PageInfo;
import com.fr.jsp.product.model.vo.Product;
import com.fr.jsp.product.model.vo.ProductSimple;

public class ProductDao {

	private Properties prop = null;

	public ProductDao() {

		prop = new Properties();

		String fileName = ProductDao.class.getResource("/config/product/product-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			System.out.println("product-query.properties 파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<Product> getProductList(Connection con) {

		ArrayList<Product> list = new ArrayList<Product>();
		Statement stmt = null;
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		Product p = null;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(prop.getProperty("selectProductList"));

			while (rset.next()) {
				p = new Product();

				p.setProductNum(rset.getString(1));
				p.setProductName(rset.getString(2));
				p.setProductPrice(rset.getInt(3));
				p.setProductOriginName(rset.getString(4));
				p.setProductCategoryName(rset.getString(5));
				p.setProductCost(rset.getInt(6));
				p.setProductQuantity(rset.getInt(7));

				list.add(p);
			}

			rset = null;

			pstmt = con.prepareStatement(prop.getProperty("getProductImages"));

			for (int i = 0; i < list.size(); ++i) {
				pstmt.setString(1, list.get(i).getProductNum());

				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.get(i).getImages().add(rset.getString(2));
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
			close(pstmt);
		}

		return list;
	}

	public int getProductCount(Connection con) {
		int result = 0;

		Statement stmt = null;
		ResultSet rset = null;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(prop.getProperty("getListCount"));

			while (rset.next()) {

				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);

		}

		return result;
	}

	public ArrayList<ProductSimple> getProductList(Connection con, PageInfo pi) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductSimple> result = new ArrayList<ProductSimple>();
		ProductSimple p = null;

		try {
			pstmt = con.prepareStatement(prop.getProperty("getpagedProductSimpleList"));

			pstmt.setInt(1, pi.getStartRow());
			pstmt.setInt(2, pi.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {

				p = new ProductSimple();

				p.setProductNum(rset.getString(2));
				p.setProductName(rset.getString(3));
				p.setProductPrice(rset.getInt(4));
				p.setReviewCount(rset.getInt(5));
				p.setImage(rset.getString(6));
				

				result.add(p);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return result;
	}

	public Product getOneProduct(Connection con, String productNum) {
		
		Product p = null;
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		
		try {
			pstmt = con.prepareStatement(prop.getProperty("getOneProduct"));
			pstmt.setString(1, productNum);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				p = new Product();
				p.setProductNum(rset.getString(1));
				p.setProductName(rset.getString(2));
				p.setProductPrice(rset.getInt(3));
				p.setProductOriginName(rset.getString(4));
				p.setProductCategoryName(rset.getString(5));
				p.setProductCost(rset.getInt(6));
				p.setProductQuantity(rset.getInt(7));
			}

			
			rset = null;

			pstmt = con.prepareStatement(prop.getProperty("getProductImages"));

			
				pstmt.setString(1, productNum);

				rset = pstmt.executeQuery();

				while (rset.next()) {
					p.getImages().add(rset.getString(2));
				}

			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return p;
	}

	public ArrayList<ProductSimple> getCategorizedProductList(Connection con, String category, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProductSimple> result = new ArrayList<ProductSimple>();
		ProductSimple p = null;

		try {
			pstmt = con.prepareStatement(prop.getProperty("getpagedCategorizedProductList"));
			
			
			
			pstmt.setString(1, category);
			pstmt.setInt(2, pi.getStartRow());
			pstmt.setInt(3, pi.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {

				p = new ProductSimple();

				p.setProductNum(rset.getString(2));
				p.setProductName(rset.getString(3));
				p.setProductPrice(rset.getInt(4));
				p.setReviewCount(rset.getInt(5));
				p.setImage(rset.getString(6));
				

				result.add(p);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return result;
	}

	public int getProductCount(Connection con, String category) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("getCategorizedProductCount"));
			
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				result = rset.getInt(1);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
