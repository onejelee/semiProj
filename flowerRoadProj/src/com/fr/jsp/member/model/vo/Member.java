package com.fr.jsp.member.model.vo;

import java.util.Date;

public class Member {

	// 변수
	private String memberNum;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberAddress;
	private String memberPhone;
	private char memberGender;
	private Date memberBirthDate;
	private String gradeCode;
	private String secondPw;
	private String imagePath;
	private Date enrollDate;
	private String memberEmail;
	
	// 생성자
	public Member(){}
	
	public Member(String num) {
		this.memberNum = num;
	}

	public Member(String id, String pwd) {
		this.memberId = id;
		this.memberPw = pwd;
	}

	// 메소드
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public char getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(char memberGender) {
		this.memberGender = memberGender;
	}
	public Date getMemberBirthDate() {
		return memberBirthDate;
	}
	public void setMemberBirthDate(Date memberBirthDate) {
		this.memberBirthDate = memberBirthDate;
	}
	public String getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}
	public String getSecondPw() {
		return secondPw;
	}
	public void setSecondPw(String secondPw) {
		this.secondPw = secondPw;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	@Override
	public String toString() {
		return "Member [memberNum=" + memberNum + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberAddress=" + memberAddress + ", memberPhone=" + memberPhone + ", memberGender="
				+ memberGender + ", memberBirthDate=" + memberBirthDate + ", gradeCode=" + gradeCode + ", secondPw="
				+ secondPw + ", imagePath=" + imagePath + ", enrollDate=" + enrollDate + ", memberEmail=" + memberEmail
				+ "]";
	}

	
	
	

}
