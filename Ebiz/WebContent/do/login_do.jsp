<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"
    import = "java.sql.*"
    %>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("org.mariadb.jdbc.Driver");
	
	String inputId = request.getParameter("uid");
	String inputPw = request.getParameter("upw");
	
	String DB_URL = "jdbc:mariadb://localhost:3306/user?useSSL=false";	//나중에 SSL 인증서 꼭 true로 셋팅!
	Connection con = DriverManager.getConnection(DB_URL, "papamama_admin", "1234");
	String sql = "SELECT * FROM user_info WHERE id=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, inputId);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(!rs.next()){ 												//id가 없는 경우
		response.sendRedirect("../page/login_page.jsp?confirm=noId&id=" + inputId);
	}else if(!rs.getString("password").equals(inputPw)){										//Pw가 틀린 경우
		response.sendRedirect("../page/login_page.jsp?confirm=wrongPw&id=" + inputId);
	}else{															//로그인 성공
		HttpSession session = request.getSession(true);
		

	
		session.setAttribute("login.id", inputId);


		int grade = rs.getInt("grade");
		int cash = rs.getInt("CASH");
		int state = rs.getInt("workstate");
		
		session.setAttribute("login.grade", grade);
		session.setAttribute("login.cash", cash);
		session.setAttribute("login.workstate", state);
		response.sendRedirect("../page/main_page.jsp");
	}
	rs.close();
	pstmt.close();
	con.close();
%>