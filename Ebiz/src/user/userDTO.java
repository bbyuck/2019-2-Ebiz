package user;

import java.sql.*;

public class userDTO {
	public userDTO() {}
	
	private int idx;
	private String user_name;
	private String sex;
	private String address1;
	private String address2;
	private String postnum;
	private String joindate;
	private String email;
	private String phone_number;
	private String id;
	private String password;
	private int grade;
	private int CASH;
	private int workstate;
	private int cur_match;
	
	//setter
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public void setCASH(int CASH) {
		this.CASH = CASH;
	}
	public void setWorkstate(int workstate) {
		this.workstate = workstate;
	}
	public void setCur_match(int cur_match) {
		this.cur_match = cur_match;
	}
	//getter
	public int getIdx() {
		return idx;
	}
	public String getUser_name() {
		return user_name;
	}
	public String getSex() {
		return sex;
	}
	public String getAddress1() {
		return address1;
	}
	public String getAddress2() {
		return address2;
	}
	public String getPostnum() {
		return postnum;
	}
	public String getJoindate() {
		return joindate;	
	}
	public String getEmail() {
		return email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public int getGrade() {
		return grade;
	}
	public int getCASH() {
		return CASH;
	}
	public int getWorkstate() {
		return workstate;
	}
	public int getCur_match() {
		return cur_match;
	}
}

