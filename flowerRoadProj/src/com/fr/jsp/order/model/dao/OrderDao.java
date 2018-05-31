package com.fr.jsp.order.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.order.model.vo.Order;

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
	
	public ArrayList<Order> orderChk(Connection con, String id) {

		ArrayList<Order> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("orderChk");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Order>();
			while(rset.next()){
				Order o = new Order();
				o.setOrdered_date(rset.getDate(1));
				o.setProduct_num(rset.getString(2));
				o.setProduct_cost(rset.getInt(3));
				o.setAnonymous_delivery(rset.getString(4));
				o.setOrder_state_code(rset.getString(5));
				
				list.add(o);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

}
