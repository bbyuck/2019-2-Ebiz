package board.model;

import java.sql.*;

public class noticeDTO {
	private int NUM;
	private String WRITER;
	private String SUBJECT;
	private String CONTENT;
	private Date WRITE_DATE;
	private Time WRITE_TIME;
	private int READ_CNT;
	
	//constructor
	public noticeDTO() {}
	
	//setter
	public void setNUM(int NUM) {
		this.NUM = NUM;
	}
	public void setWRITER(String WRITER) {
		this.WRITER = WRITER;
	}
	public void setSUBJECT(String SUBJECT) {
		this.SUBJECT = SUBJECT;
	}
	public void setCONTENT(String CONTENT) {
		this.CONTENT = CONTENT;
	}
	public void setWRITE_DATE(Date WRITE_DATE) {
		this.WRITE_DATE = WRITE_DATE;
	}
	public void setWRITE_TIME(Time WRITE_TIME) {
		this.WRITE_TIME = WRITE_TIME;
	}
	public void setREAD_CNT(int READ_CNT) {
		this.READ_CNT = READ_CNT;
	}
	
	//getter
	public int getNUM() {
		return NUM;
	}
	public String getWRITER() {
		return WRITER;
	}
	public String getSUBJECT() {
		return SUBJECT;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public Date getWRITE_DATE() {
		return WRITE_DATE;
	}
	public Time getWRITE_TIME() {
		return WRITE_TIME;
	}
	public int getREAD_CNT() {
		return READ_CNT;
	}
}
