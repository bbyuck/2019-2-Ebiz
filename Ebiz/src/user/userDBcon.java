package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class userDBcon {
	final static String DB_URL =  "jdbc:mariadb://localhost:3306/user?useSSL=false"; 
	final static String DB_USER = "papamama_admin";
	final static String DB_PASSWORD = "1234";
	
	static {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch(ClassNotFoundException e){
			System.out.println(e.toString());
		}
	}
	
	public Connection getConnection() throws SQLException{
		return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	}
}
