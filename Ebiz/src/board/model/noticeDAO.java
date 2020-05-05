package board.model;

import java.sql.*;
import javax.naming.NamingException;

public class noticeDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public noticeDAO() throws SQLException, NamingException{
		DBcon connection = new DBcon();
		this.con = connection.getConnection();
	}
	
	public noticeDTO getNotice(int NUM) throws SQLException{
		String sql = "SELECT * FROM notice WHERE NUM=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, NUM);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		noticeDTO not = new noticeDTO();
		not.setNUM(NUM);
		not.setWRITER(rs.getString("WRITER"));
		not.setSUBJECT(rs.getString("SUBJECT"));
		not.setCONTENT(rs.getString("CONTENT"));
		not.setWRITE_DATE(rs.getDate("WRITE_DATE"));
		not.setWRITE_TIME(rs.getTime("WRITE_TIME"));
		not.setREAD_CNT(rs.getInt("READ_CNT"));
	
		return not;
	}
	
	public int getDBcount() throws SQLException{
		int count;
		String sql = "SELECT COUNT(*) FROM notice";
		
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
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}
