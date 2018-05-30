package com.fr.jsp.order.model.service;

import com.fr.jsp.member.model.vo.Member;
import java.util.*;
import com.fr.jsp.order.model.dao.OrderDao;
import com.fr.jsp.order.model.vo.Order;

import static com.fr.jdbc.common.JDBCTemplate.*;

import java.sql.Connection;

public class OrderService {
	private OrderDao oDao;
	public OrderService(){
		oDao = new OrderDao();
	}

	public ArrayList<Order> orderChk(String id) {
		Connection con = getConnection();
		
		ArrayList<Order> list = oDao.orderChk(con, id);
		
		close(con);
		
		return list;
	}

}
