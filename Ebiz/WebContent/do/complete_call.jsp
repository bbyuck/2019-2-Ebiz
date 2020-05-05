<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"
    import="user.*"
    %>

<%

HttpSession session = request.getSession(false);
String id = null;
userDTO user = new userDTO();
userDAO handle = new userDAO();

if(session != null){
	id = (String)session.getAttribute("login.id");
}
    request.setCharacterEncoding("utf-8");

	user = handle.getUser(id);
	int bossIdx = user.getCur_match();
	
	userDTO boss = handle.getUser(bossIdx);

	handle.matching_complete(boss, user);
	
	handle.close();
	response.sendRedirect("../page/main_page.jsp");
	
%>