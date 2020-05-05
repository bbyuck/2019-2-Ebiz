<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false"
    import="java.sql.*, user.*"
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결제하기</title>
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
	
	userDTO user = new userDTO();
	userDAO handle = new userDAO();
	
	user.setId(id);
%>
		<script src="../assets/js/join.js"></script>
	</head>
	<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<form name="checkForm" method="post" action="./payGo.jsp">
			<p style="font-size:40px;" align="center">E-money 충전하기</p>
	        <div class="form-group" align="center" style="border: double gray; padding:45px;">
	        	<label style="align:center; font-size:25px">금액</label>
	        	<span style="width:100%; float:right">
				<input type="radio" id="10000" name ="credit" value = "10000"><label for="10000">10000원</label>
				<input type="radio" id="50000" name ="credit" value = "50000"><label for="50000">50000원</label>
				<input type="radio" id="100000" name ="credit" value = "100000"><label for="100000">100000원</label>
				</span>
   				<br>
   			</div>	
			<br>
			<br>
			
			<p align="center"><input type="submit" value="충전하기">
		</form>
		<%handle.close(); %>
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/browser.min.js"></script>
		<script src="../assets/js/breakpoints.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
	</body>
</html>