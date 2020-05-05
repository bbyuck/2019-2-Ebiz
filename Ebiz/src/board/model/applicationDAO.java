package board.model;

import java.sql.*;
import javax.naming.*;

public class applicationDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public applicationDAO() throws SQLException, NamingException{
		DBcon connection = new DBcon();
		this.con = connection.getConnection();
	}
	
	public void writeApplication(applicationDTO app) throws SQLException{
		String sql = "INSERT INTO application(CATEGORY, WRITER, PASSWORD, SUBJECT, CONTENT, WRITE_DATE, WRITE_TIME, READ_CNT, AREA, PERIOD, WORK_TIME, CREDIT, STATE) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, app.getCATEGORY());
		pstmt.setString(2, app.getWRITER());
		pstmt.setInt(3, app.getPASSWORD());
		pstmt.setString(4,app.getSUBJECT());
		pstmt.setString(5, app.getCONTENT());
		pstmt.setDate(6, app.getWRITE_DATE());
		pstmt.setTime(7, app.getWRITE_TIME());
		pstmt.setInt(8, app.getREAD_CNT());
		pstmt.setString(9, app.getAREA());
		pstmt.setString(10, app.getPERIOD());
		pstmt.setString(11, app.getWORK_TIME());
		pstmt.setString(12, app.getCREDIT());
		pstmt.setString(13, app.getSTATE());
		
		pstmt.executeUpdate();
	}
	
	public void updateApplication(applicationDTO app) throws SQLException{
		String sql = "UPDATE application SET CATEGORY=? PASSWORD=?, SUBJECT=?, CONTENT=?, WRITE_DATE=?, WRITE_TIME=?, AREA=?, PERIOD=?, WORK_TIME=?, CREDIT=?, STATE=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, app.getCATEGORY());
		pstmt.setInt(2, app.getPASSWORD());
		pstmt.setString(3, app.getSUBJECT());
		pstmt.setString(4, app.getCONTENT());
		pstmt.setDate(5, app.getWRITE_DATE());
		pstmt.setTime(6, app.getWRITE_TIME());
		pstmt.setString(7, app.getAREA());
		pstmt.setString(8, app.getPERIOD());
		pstmt.setString(9, app.getWORK_TIME());
		pstmt.setString(10, app.getCREDIT());
		pstmt.setString(11, app.getSTATE());
	}
	
	public applicationDTO getApplication(int NUM) throws SQLException{
		String sql = "SELECT * FROM application WHERE NUM=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, NUM);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		applicationDTO app = new applicationDTO();
		app.setNUM(NUM);
		app.setCATEGORY(rs.getString("CATEGORY"));
		app.setWRITER(rs.getString("WRITER"));
		app.setPASSWORD(rs.getInt("PASSWORD"));
		app.setSUBJECT(rs.getString("SUBJECT"));
		app.setCONTENT(rs.getString("CONTENT"));
		app.setWRITE_DATE(rs.getDate("WRITE_DATE"));
		app.setWRITE_TIME(rs.getTime("WRITE_TIME"));
		app.setREAD_CNT(rs.getInt("READ_CNT"));
		app.setAREA(rs.getString("AREA"));
		app.setPERIOD(rs.getString("PERIOD"));
		app.setWORK_TIME(rs.getString("WORK_TIME"));
		app.setCREDIT(rs.getString("CREDIT"));
		app.setSTATE(rs.getString("STATE"));
		
		return app;
	}
	
	public int getDBcount() throws SQLException{
		int count;
		String sql = "SELECT COUNT(*) FROM application";
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		rs.next();
		count = rs.getInt(1);
		
		return count;
	}
	
	public int getPageCount() throws SQLException{
		int count = this.getDBcount();
		int page_count = count / 10;
		
		if(page_count % 10 != 0) {
			page_count++;
		}
		
		return page_count;
	}
	
	public void read(int NUM) throws SQLException{
		String sql = "SELECT READ_CNT FROM application WHERE NUM=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, NUM);
		
		rs = pstmt.executeQuery();
		rs.next();
		int read_cnt = rs.getInt("READ_CNT");
		read_cnt++;
		
		sql = "UPDATE application SET READ_CNT=? WHERE NUM=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, read_cnt);
		pstmt.setInt(2, NUM);
		pstmt.executeUpdate();
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}
