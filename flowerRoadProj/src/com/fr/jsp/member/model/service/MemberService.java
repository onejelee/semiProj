package com.fr.jsp.member.model.service;

import java.sql.Connection;

import com.fr.jsp.member.model.dao.MemberDao;
import com.fr.jsp.member.model.vo.Member;

import static com.fr.jdbc.common.JDBCTemplate.*;

public class MemberService {
	private MemberDao mDao;
	public MemberService(){
		mDao=new MemberDao();
	}

	public Member insertInfo(Member m) {
		Connection con = getConnection();
		Member resultM = mDao.insertInfo(con,m);
		
		close(con);
		
		return resultM;
	}

	public Member pwdChangeView(Member m) {
		Connection con = getConnection();
		
		Member resultM = mDao.pwdChangeView(con,m);
		
		close(con);
		
		return resultM;
	}

	public int pwdChange(Member m) {
		Connection con = getConnection();
		int result =0;
		result = mDao.pwdChange(con, m);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int memberUpdate(Member m) {
		Connection con = getConnection();
		int result =0;
		result = mDao.memberUpdate(con, m);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

}
