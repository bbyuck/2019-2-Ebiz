package user;

import javax.naming.*;
import board.model.DBcon;

import java.sql.*;
import java.util.PriorityQueue;
import java.util.Queue;

public class userDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public userDAO() throws SQLException, NamingException{
		userDBcon connection = new userDBcon();
		this.con = connection.getConnection();
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
	
	public void join(userDTO newUser) throws SQLException{
		String sql = "INSERT INTO user_info(user_name, sex, address1, address2, postnum, joindate, email, phone_number, id, password, grade) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, newUser.getUser_name());
		pstmt.setString(2, newUser.getSex());
		pstmt.setString(3, newUser.getAddress1());
		pstmt.setString(4, newUser.getAddress2());
		pstmt.setString(5, newUser.getPostnum());
		pstmt.setString(6, newUser.getJoindate());
		pstmt.setString(7, newUser.getEmail());
		pstmt.setString(8, newUser.getPhone_number());
		pstmt.setString(9, newUser.getId());
		pstmt.setString(10, newUser.getPassword());
		pstmt.setInt(11, newUser.getGrade());
		
		pstmt.executeUpdate();
	}
	
	public userDTO getUser(String id) throws SQLException{
		userDTO user = new userDTO();
		
		String sql = "SELECT * FROM user_info WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		rs.next();
		
		user.setIdx(rs.getInt("idx"));
		user.setId(rs.getString("id"));
		user.setUser_name(rs.getString("user_name"));
		user.setEmail(rs.getString("email"));
		user.setPhone_number(rs.getString("phone_number"));
		user.setAddress1(rs.getString("address1"));
		user.setAddress2(rs.getString("address2"));
		user.setSex(rs.getString("sex"));
		user.setCASH(rs.getInt("CASH"));
		user.setGrade(rs.getInt("grade"));
		user.setPostnum(rs.getString("postnum"));
		user.setWorkstate(rs.getInt("workstate"));
		return user;
	}
	
	public userDTO getUser(int idx) throws SQLException{
		userDTO user = new userDTO();
		
		String sql = "SELECT * FROM user_info WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		rs = pstmt.executeQuery();
		rs.next();
		
		user.setId(rs.getString("id"));
		user.setUser_name(rs.getString("user_name"));
		user.setEmail(rs.getString("email"));
		user.setPhone_number(rs.getString("phone_number"));
		user.setAddress1(rs.getString("address1"));
		user.setAddress2(rs.getString("address2"));
		user.setSex(rs.getString("sex"));
		user.setCASH(rs.getInt("CASH"));
		user.setGrade(rs.getInt("grade"));
		user.setPostnum(rs.getString("postnum"));
		user.setWorkstate(rs.getInt("workstate"));
		user.setIdx(idx);
		return user;
	}
	
	public void charge(userDTO user, int incash) throws SQLException{
		String sql = "SELECT * FROM user_info WHERE id=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getId());
		rs = pstmt.executeQuery();
		rs.next();
		
		int ocash = rs.getInt("CASH");
		
		sql = "UPDATE user_info SET CASH=? WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, incash + ocash);
		pstmt.setString(2, user.getId());
		pstmt.executeUpdate();
	}
	public void balance(userDTO user, int outcash) throws SQLException{
		String sql = "SELECT * FROM user_info WHERE id=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getId());
		rs = pstmt.executeQuery();
		rs.next();
		
		int ocash = rs.getInt("CASH");
		
		sql = "UPDATE user_info SET CASH=? WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, ocash - outcash);
		pstmt.setString(2, user.getId());
		pstmt.executeUpdate();
	}
	
	public void RiderCall(userDTO boss) throws SQLException{
		boss.setWorkstate(1);
		String sql = "UPDATE user_info SET workstate=? WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, 1);
		pstmt.setString(2, boss.getId());
		pstmt.executeUpdate();
		
		sql = "INSERT INTO boss_pool(id, postnum) VALUES(?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, boss.getId());
		pstmt.setString(2, boss.getPostnum());
		pstmt.executeUpdate();
	}
	
	public void matching(userDTO boss, userDTO rider) throws SQLException{
		String sql = "UPDATE user_info SET workstate=?, cur_match=? WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, 1);
		pstmt.setInt(2, rider.getIdx());
		pstmt.setString(3, boss.getId());
		pstmt.executeUpdate();
		
		pstmt.setInt(1, 1);
		pstmt.setInt(2, boss.getIdx());
		pstmt.setString(3, rider.getId());
		pstmt.executeUpdate();
		
		sql = "DELETE FROM boss_pool WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, boss.getId());
		pstmt.executeUpdate();
	}

	public void matching_cancel(userDTO boss, userDTO rider) throws SQLException {
		String sql = "UPDATE user_info SET workstate=?, cur_match=? WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, 0);
		pstmt.setInt(2, -1);
		pstmt.setString(3, boss.getId());
		pstmt.executeUpdate();
		
		pstmt.setInt(1, 0);
		pstmt.setInt(2, -1);
		pstmt.setString(3, rider.getId());
		pstmt.executeUpdate();
		
		sql = "DELETE FROM boss_pool WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, boss.getId());
		pstmt.executeUpdate();
	}
	
	public void matching_complete(userDTO boss, userDTO rider) throws SQLException{
		String sql = "UPDATE user_info SET workstate=?, cur_match=? WHERE id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, 0);
		pstmt.setInt(2, -1);
		pstmt.setString(3, boss.getId());
		pstmt.executeUpdate();
		
		pstmt.setInt(1, 0);
		pstmt.setInt(2, -1);
		pstmt.setString(3, rider.getId());
		pstmt.executeUpdate();
		
		balance(boss, 2500);
		charge(rider, 2500);
	}
	
	public void addCall(userDTO boss) throws SQLException{
		String sql = "INSERT INTO boss_pool(id, postnum) VALUES(?, ?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, boss.getId());
		pstmt.setString(2, boss.getPostnum());
		
		pstmt.executeQuery();
	}
	
	public userDTO searching(userDTO rider) throws SQLException{

		int pn = Integer.parseInt(rider.getPostnum());
		String sql = "SELECT * FROM boss_pool WHERE postnum=?";
		String spn = null;
		userDTO tmp;
		pstmt = con.prepareStatement(sql);
		for(int i = 0; i < 10; i++) {
			spn = Integer.toString(pn);
			pstmt.setString(1, spn);
			pn++;
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				continue;
			}
			else {
				tmp = getUser(rs.getString("id"));
				return tmp;
			}
		}
		pn = Integer.parseInt(rider.getPostnum());
		for(int i = 0; i < 10; i++) {
			spn = Integer.toString(pn);
			pstmt.setString(1, spn);
			pn--;
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				continue;
			}
			else {
				tmp = getUser(rs.getString("id"));
				return tmp;
			}
		}
		return null;
	}
}
