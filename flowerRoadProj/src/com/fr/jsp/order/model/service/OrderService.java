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

	public ArrayList<Order> orderChk(String num, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Order> list = oDao.orderChk(con, num, currentPage,limit);
		
		close(con);
		
		return list;
	}

	public int getListCount(String num) {
		Connection con = getConnection();
		int result= oDao.getListCount(con, num);
		
		close(con);
		return result;
	}

}
