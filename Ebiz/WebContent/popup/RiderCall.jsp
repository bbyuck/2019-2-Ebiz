<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"
    import="java.sql.*, user.*"
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>라이더 호출</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
<%

request.setCharacterEncoding("utf-8");
HttpSession session = request.getSession(false);
String id = null;
userDTO user = new userDTO();
userDAO handle = new userDAO();
int grade = 0;
int cash = 0;
int state = 0;

if(session != null){
	id = (String)session.getAttribute("login.id");
	user = handle.getUser(id);
	grade = user.getGrade();
	cash = user.getCASH();
	state = user.getWorkstate();
}
%>
	<script src="../assets/js/join.js"></script>
	</head>
	<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<%if(state == 0){
			handle.RiderCall(user);	// 사장님은 0이면 등록x 1이면 등록	
		%>
		<form name="checkForm">
			<p style="font-size:40px;" align="center">라이더 호출 등록 완료</p>
			<div align="center">
				<img src="../images/loading.gif"/>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<p align="center"><input type="button" style="width:50%; height:50px;font-size:15px;" id="use" value="메인으로 돌아가기"  onclick="toMain()"></p>
			<div id="txt" align="center">
			</div>
		</form>
		<%} else if(state == 1){
		%>
		<form name="checkForm">
			<p style="font-size:40px;" align="center">이미 라이더 호출중입니다.</p>
			<div align="center">
				<img src="../images/loading.gif"/>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<p align="center"><input type="button" style="width:50%; height:50px;font-size:15px;" id="use" value="메인으로 돌아가기"  onclick="toMain()"></p>
			<div id="txt" align="center">
			</div>
		</form>
		<%}
		handle.close();
		%>
		
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/browser.min.js"></script>
		<script src="../assets/js/breakpoints.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
		
	</body>
</html>