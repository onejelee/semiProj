package com.fr.jsp.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.fr.jsp.member.model.vo.Member;
import com.fr.jsp.member.model.dao.MemberDao;
import static com.fr.jdbc.common.JDBCTemplate.*;

public class MemberDao {
	
	// 프라퍼티 설정
	private Properties prop = new Properties();
	public MemberDao(){
		String filename=MemberDao.class.getResource("/config/member/member-query.properties").getPath();
		System.out.println(filename);
		try {
			prop.load(new FileReader(filename));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 회원정보 조회
	public Member selectMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member resultMember = null;
		try {
			
			String query = prop.getProperty("memberSelect");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberNum());
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()){
				resultMember = new Member();
				
				
				resultMember.setMemberNum((rset.getString("MEMBER_NUM")));
				resultMember.setMemberId((rset.getString("MEMBER_ID")));
				resultMember.setMemberPw(rset.getString("MEMBER_PW"));
				resultMember.setMemberName((rset.getString("MEMBER_NAME")));
				resultMember.setMemberAddress((rset.getString("MEMBER_ADDRESS")));
				resultMember.setMemberPhone(rset.getString("MEMBER_PHONE"));
				if(rset.getString("MEMBER_GENDER")!=null){	
				resultMember.setMemberGender(rset.getString("MEMBER_GENDER").charAt(0));
				}
				resultMember.setMemberBirthDate(rset.getDate("MEMBER_BIRTH_DATE"));
				resultMember.setGradeCode(rset.getString("GRADE_CODE"));
				resultMember.setSecondPw((rset.getString("SECOND_PW")));
				resultMember.setImagePath((rset.getString("IMAGE_PATH")));
				resultMember.setEnrollDate((rset.getDate("ENROLL_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return resultMember;
	}
	// 회원 유무 확인
	public int findMember(Connection con, String memberNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		try {
			String query = prop.getProperty("memberFind");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNum);
			rset=pstmt.executeQuery();
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

	// sns 로그인
	public int snsInsertMember(Connection con, String memberNum) {
		PreparedStatement pstmt= null;
		int result=0;
		try {
			
			String sql = prop.getProperty("memberSnsInsert");
		
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberNum);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 로그인 아이디 찾기
	public Member loginSelectMember(Connection con, Member m) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Member resultMember = null;
	      try {
	         
	         String query = prop.getProperty("loginMemberSelect");
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, m.getMemberId());
	         pstmt.setString(2, m.getMemberPw());
	         rset = pstmt.executeQuery();
	         if(rset.next()){
	            resultMember = new Member();
	            
	            
	            resultMember.setMemberNum((rset.getString("MEMBER_NUM")));
	            resultMember.setMemberId((rset.getString("MEMBER_ID")));
	            resultMember.setMemberPw(rset.getString("MEMBER_PW"));
	            resultMember.setMemberName((rset.getString("MEMBER_NAME")));
	            resultMember.setMemberAddress((rset.getString("MEMBER_ADDRESS")));
	            resultMember.setMemberPhone(rset.getString("MEMBER_PHONE"));
	            if(rset.getString("MEMBER_GENDER")!=null){   
	            resultMember.setMemberGender(rset.getString("MEMBER_GENDER").charAt(0));
	            }
	            resultMember.setMemberBirthDate(rset.getDate("MEMBER_BIRTH_DATE"));
	            resultMember.setGradeCode(rset.getString("GRADE_CODE"));
	            resultMember.setSecondPw((rset.getString("SECOND_PW")));
	            resultMember.setImagePath((rset.getString("IMAGE_PATH")));
	            resultMember.setEnrollDate((rset.getDate("ENROLL_DATE")));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         close(rset);
	         close(pstmt);
	      }
	      return resultMember;
	   }
	
	// 회원조회- 메인
	public Member insertInfo(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member resultM = null;
		
		try{
			
			String query = prop.getProperty("insertInfo");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			System.out.println("m의 id : "+m.getMemberId());
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				resultM = new Member();
				
				resultM.setMemberId(rset.getString(1));
				resultM.setMemberName(rset.getString(2));
				resultM.setMemberEmail(rset.getString(3));
				resultM.setMemberAddress(rset.getString(4));
				resultM.setMemberPhone(rset.getString(5));
				resultM.setEnrollDate(rset.getDate(6));
				
			}else{
				System.out.println("없어!");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return resultM;
	}

	// 비밀번호 변경
	public Member pwdChangeView(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member resultM = null;
		
		String query = prop.getProperty("pwdChangeView");
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			System.out.println("m의 id : "+m.getMemberId());
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				resultM = new Member();
				
				resultM.setMemberName(rset.getString(1));
				resultM.setMemberId(rset.getString(2));
			}else {
				System.out.println("없음");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return resultM;
	}

	public int pwdChange(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("pwdChange");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int memberUpdate(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("memberUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberEmail());
			pstmt.setString(2, m.getMemberAddress());
			pstmt.setString(3, m.getMemberPhone());
			pstmt.setString(4, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int memberDelete(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("memberDelete");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, m.getMemberId());
			System.out.println("id = "+m.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	
}
