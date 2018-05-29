package com.fr.jsp.board.model.service;

import static com.fr.jdbc.common.JDBCTemplate.close;
import static com.fr.jdbc.common.JDBCTemplate.commit;
import static com.fr.jdbc.common.JDBCTemplate.getConnection;
import static com.fr.jdbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.fr.jsp.board.model.dao.ReviewBoardDao;
import com.fr.jsp.board.model.vo.ReviewBoard;
import com.fr.jsp.common.PageInfo;

public class ReviewBoardService {

	public ArrayList<ReviewBoard> selectReviewList(String pno) {

		Connection con = getConnection();

		ArrayList<ReviewBoard> list = null;

		ReviewBoardDao rDao = new ReviewBoardDao();

		list = rDao.selectReviewList(con, pno);

		if (list != null)
			commit(con);
		else
			rollback(con);

		return list;
	}

	public int insertReview(ReviewBoard rb) {

		Connection con = getConnection();

		int result = 0;

		ReviewBoardDao rDao = new ReviewBoardDao();

		result = rDao.insertReview(con, rb);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		return result;

	}

	public int getListCount(String pno) {

		Connection con = getConnection();

		int result = 0;

		ReviewBoardDao rDao = new ReviewBoardDao();

		result = rDao.getListCount(con,pno);

		close(con);

		return result;
	}
	
	public int getListCount() {

		Connection con = getConnection();

		int result = 0;

		ReviewBoardDao rDao = new ReviewBoardDao();

		result = rDao.getListCount(con);

		close(con);

		return result;
	}


	

	public ArrayList<ReviewBoard> selectList(String pno, PageInfo pi) {
		
		Connection con = getConnection();
		ReviewBoardDao bDao = new ReviewBoardDao();
		ArrayList<ReviewBoard> list =new ReviewBoardDao().selectList(con,pno,pi);
		
		
		
		if(list!=null) commit(con);
		else rollback(con);
		
		close(con);
		
	
		return list;
	}

}
