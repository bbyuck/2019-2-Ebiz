<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"
    import="java.sql.*, user.*"
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결제완료</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
<%
	HttpSession session = request.getSession(false);
	String id = null;
	int grade = 0;
	int cash = 0;
	int state = 0;
	String sstate = null;
	if(session != null){
		id = (String)session.getAttribute("login.id");
		grade = (int)session.getAttribute("login.grade");
		cash = (int)session.getAttribute("login.cash");
		state = (int)session.getAttribute("login.workstate");
		
		if(state == 0){
			sstate = "휴식중";
		}else if(state == 1){
			sstate = "근무중";
		}
	}
	%>		
	<%
	request.setCharacterEncoding("utf-8");
	String sincash = request.getParameter("msg");
	int incash = Integer.parseInt(sincash);
	
	userDTO user = new userDTO();
	userDAO handle = new userDAO();
	user.setId(id);
	handle.charge(user, incash);
	
	
	handle.close();
	%>
	<script src="../assets/js/join.js"></script>
	</head>
	<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<form name="checkForm">
			<p style="font-size:40px;" align="center">결제 완료</p>
				<h2 align="center">저희 Ebiz 11조</h2>
				<h2 align="center">서비스를 이용해주셔서 감사합니다.</h2>
			<br>
			<br>
			
			<p align="center"><input type="button" value="메인으로" onClick="toMain()">
		</form>
		
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/browser.min.js"></script>
		<script src="../assets/js/breakpoints.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
	</body>
</html>