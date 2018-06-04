package com.fr.jsp.order.model.service;

import com.fr.jsp.member.model.vo.Member;
import java.util.*;
import com.fr.jsp.order.model.dao.OrderDao;
import com.fr.jsp.order.model.vo.Order;
import com.kh.jsp.board.model.dao.BoardDao;

import static com.fr.jdbc.common.JDBCTemplate.*;
import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.getConnection;

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

	public int getListCount(String id) {
		Connection con = getConnection();
		int result= oDao.getListCount(con, id);
		
		close(con);
		return result;
	}

}
