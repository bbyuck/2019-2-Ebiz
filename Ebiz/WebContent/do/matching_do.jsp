<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="user.*"
    %>

<%
    request.setCharacterEncoding("utf-8");
	String bossId = request.getParameter("boss");
	String riderId = request.getParameter("rider");
	
	userDAO handle = new userDAO();
	
	userDTO boss = handle.getUser(bossId);
	userDTO rider = handle.getUser(riderId);
	
	handle.matching(boss, rider);
	
	handle.close();
	response.sendRedirect("../page/main_page.jsp");
	
%>