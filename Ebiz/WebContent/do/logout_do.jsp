<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false"
    %>
<%
request.setCharacterEncoding("utf-8");

HttpSession session = request.getSession(false);

if(session != null){
	session.invalidate();
}

response.sendRedirect("../page/main_page.jsp");
%>