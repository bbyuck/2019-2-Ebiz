package board.model;

import java.sql.*;
import javax.naming.NamingException;

public class seekingDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public seekingDAO() throws SQLException, NamingException{
		DBcon connection = new DBcon();
		this.con = connection.getConnection();
	}
	
	public void writeSeeking(seekingDTO see) throws SQLException{
		String sql = "INSERT INTO seeking(CATEGORY, WRITER, PASSWORD, SUBJECT, CONTENT, WRITE_DATE, WRITE_TIME, READ_CNT, AREA, PERIOD, WORK_TIME, CREDIT, STATE) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, see.getCATEGORY());
		pstmt.setString(2, see.getWRITER());
		pstmt.setInt(3, see.getPASSWORD());
		pstmt.setString(4,see.getSUBJECT());
		pstmt.setString(5, see.getCONTENT());
		pstmt.setDate(6, see.getWRITE_DATE());
		pstmt.setTime(7, see.getWRITE_TIME());
		pstmt.setInt(8, see.getREAD_CNT());
		pstmt.setString(9, see.getAREA());
		pstmt.setString(10, see.getPERIOD());
		pstmt.setString(11, see.getWORK_TIME());
		pstmt.setString(12, see.getCREDIT());
		pstmt.setString(13, see.getSTATE());
		
		pstmt.executeUpdate();
	}
	
	public void updateSeeking(seekingDTO see) throws SQLException{
		String sql = "UPDATE seeking SET CATEGORY=? PASSWORD=?, SUBJECT=?, CONTENT=?, WRITE_DATE=?, WRITE_TIME=?, AREA=?, PERIOD=?, WORK_TIME=?, CREDIT=?, STATE=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, see.getCATEGORY());
		pstmt.setInt(2, see.getPASSWORD());
		pstmt.setString(3, see.getSUBJECT());
		pstmt.setString(4, see.getCONTENT());
		pstmt.setDate(5, see.getWRITE_DATE());
		pstmt.setTime(6, see.getWRITE_TIME());
		pstmt.setString(7, see.getAREA());
		pstmt.setString(8, see.getPERIOD());
		pstmt.setString(9, see.getWORK_TIME());
		pstmt.setString(10, see.getCREDIT());
		pstmt.setString(11, see.getSTATE());
	}
	
	public seekingDTO getSeeking(int NUM) throws SQLException{
		String sql = "SELECT * FROM seeking WHERE NUM=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, NUM);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		seekingDTO see = new seekingDTO();
		see.setNUM(NUM);
		see.setCATEGORY(rs.getString("CATEGORY"));
		see.setWRITER(rs.getString("WRITER"));
		see.setPASSWORD(rs.getInt("PASSWORD"));
		see.setSUBJECT(rs.getString("SUBJECT"));
		see.setCONTENT(rs.getString("CONTENT"));
		see.setWRITE_DATE(rs.getDate("WRITE_DATE"));
		see.setWRITE_TIME(rs.getTime("WRITE_TIME"));
		see.setREAD_CNT(rs.getInt("READ_CNT"));
		see.setAREA(rs.getString("AREA"));
		see.setPERIOD(rs.getString("PERIOD"));
		see.setWORK_TIME(rs.getString("WORK_TIME"));
		see.setCREDIT(rs.getString("CREDIT"));
		see.setSTATE(rs.getString("STATE"));
		
		return see;
	}
	
	public int getDBcount() throws SQLException{
		int count;
		String sql = "SELECT COUNT(*) FROM seeking";
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		rs.next();
		count = rs.getInt(1);
		
		return count;
	}
	
	public int getPageCount() throws SQLException{
		int count;
		int page_count;
		String sql = "SELECT COUNT(*) FROM seeking";
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		rs.next();
		count = rs.getInt(1);
		page_count = count / 10;
		
		if(page_count % 10 != 0) {
			page_count++;
		}
		
		return page_count;
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}
