package com.fr.jsp.order.model.dao;

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

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.order.model.vo.Order;
import static com.fr.jdbc.common.JDBCTemplate.*;

public class OrderDao {

	private Properties prop;
	
	public OrderDao(){
		prop = new Properties();
		String fileName = OrderDao.class.getResource("/config/order/order-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Order> orderChk(Connection con, String num, int currentPage, int limit) {

		ArrayList<Order> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("orderChk");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			
			int startRow = (currentPage - 1)* limit +1;
		    int endRow = startRow + (limit - 1);
		    pstmt.setInt(2, startRow);
		    pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Order>();
			while(rset.next()){
				Order o = new Order();
				o.setOrder_num(rset.getString(2));
				o.setOrdered_date(rset.getDate(3));
				o.setProduct_num(rset.getString(4));
				o.setProduct_cost(rset.getInt(5));
				o.setAnonymous_delivery(rset.getString(6));
				o.setOrder_state_code(rset.getString(7));
				
				list.add(o);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	public int getListCount(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result=rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

}
