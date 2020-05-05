<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false"
    import="java.sql.*"
    %>
<%
HttpSession session = request.getSession(false);
String id = null;

if(session != null){
id = (String)session.getAttribute("login.id");
}

request.setCharacterEncoding("utf-8");
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/user?useSSL=false";	//나중에 SSL 인증서 꼭 true로 셋팅!

Connection con = DriverManager.getConnection(DB_URL, "papamama_admin", "1234");

String pw = request.getParameter("inputPassword");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String postnum = request.getParameter("postnum");
String email = request.getParameter("inputEmail");
String phone = request.getParameter("inputMobile");
String domain = request.getParameter("selected_domain");

email += "@";
email += domain;

String sql = "UPDATE user_info SET  address1=?,address2=?, postnum=?, email=?, phone_number=?, password=? WHERE id=?";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, address1);
pstmt.setString(2, address2);
pstmt.setString(3, postnum);
pstmt.setString(4, email);
pstmt.setString(5, phone);
pstmt.setString(6, pw);
pstmt.setString(7, id);

pstmt.executeUpdate();

pstmt.close();
con.close();

response.sendRedirect("../page/user_info_change_complete.jsp");

%>

%>