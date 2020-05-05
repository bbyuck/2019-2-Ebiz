package board.model;

import java.sql.Date;
import java.sql.Time;

public class seekingDTO {
	public seekingDTO() {}
	
	private int NUM;
	private String CATEGORY;
	private String WRITER;
	private int PASSWORD;
	private String SUBJECT;
	private String CONTENT;
	private Date WRITE_DATE;
	private Time WRITE_TIME;
	private int READ_CNT;
	private String AREA;
	private String PERIOD;
	private String WORK_TIME;
	private String CREDIT;
	private String STATE;
	
	
	//setter
	public void setNUM(int NUM) {
		this.NUM = NUM;
	}
	public void setCATEGORY(String CATEGORY) {
		this.CATEGORY = CATEGORY;
	}
	public void setWRITER(String WRITER) {
		this.WRITER = WRITER;
	}
	public void setPASSWORD(int PASSWORD) {
		this.PASSWORD = PASSWORD;
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
	public void setAREA(String AREA) {
		this.AREA = AREA;
	}
	public void setPERIOD(String PERIOD) {
		this.PERIOD = PERIOD;
	}
	public void setWORK_TIME(String WORK_TIME) {
		this.WORK_TIME = WORK_TIME;
	}
	public void setCREDIT(String CREDIT) {
		this.CREDIT = CREDIT;
	}
	public void setSTATE(String STATE) {
		this.STATE = STATE;
	}
	
	//getter
	
	public int getNUM() {
		return NUM;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public String getWRITER() {
		return WRITER;
	}
	public int getPASSWORD() {
		return PASSWORD;
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
	public String getAREA() {
		return AREA;
	}
	public String getPERIOD() {
		return PERIOD;
	}
	public String getWORK_TIME() {
		return WORK_TIME;
	}
	public String getCREDIT() {
		return CREDIT;
	}
	public String getSTATE() {
		return STATE;
	}
}
