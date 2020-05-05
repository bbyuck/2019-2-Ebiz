<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false" import="java.sql.*"
    %>
<%
request.setCharacterEncoding("utf-8");
	//session으로부터 로그인 된 아이디 
HttpSession session = request.getSession(false);
String id = null;

if(session != null){
id = (String)session.getAttribute("login.id");
}

Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/user?useSSL=false";	//나중에 SSL 인증서 꼭 true로 셋팅!
Connection con = DriverManager.getConnection(DB_URL, "papamama_admin", "1234");
String sql = "SELECT * FROM user_info WHERE id=?";

PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);

ResultSet rs = pstmt.executeQuery();

rs.next();

String pw = rs.getString("password");
String inputPw = request.getParameter("inputPassword");

if(!pw.equals(inputPw)){
	response.sendRedirect("../page/check_to_user_info_change_page.jsp?confirm=fail");
}else{
	response.sendRedirect("../page/user_info_change_page.jsp");
}
%>