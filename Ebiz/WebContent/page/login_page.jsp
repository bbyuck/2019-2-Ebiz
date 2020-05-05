<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
	<head>
    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    	<meta name="description" content="">
    	<meta name="author" content="">
    
  		<!-- Bootstrap CSS -->
   	 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    	<title>Ebiz 11 조</title>

	<%
	HttpSession session = request.getSession(false);
	String id = null;
	
	if(session != null){
		id = (String)session.getAttribute("login.id");
	}
	if(id != null){
		response.sendRedirect("../page/wrong_access_page.jsp");
	}
	%>
	<%
		response.setCharacterEncoding("utf-8");
		
		String confirm = request.getParameter("confirm");
		String inputId =request.getParameter("id");
	%>

		<script type="text/javascript">
			function gotoPage(){
				location.href="terms_page.jsp";
			}
			
			function gotoMain(){
				location.href="../page/main_page.jsp";
			}
			
			function gotoLogin(){

				if(document.loginForm.uid.value==""){
					alert("ID를 입력하세요");
					document.loginForm.uid.focus();
					return false;
				}
				else if(document.loginForm.upw.value==""){
					alert("비밀번호를 입력하세요");
					document.loginForm.upw.focus();
					return false;
				}
				document.loginForm.submit();
			}
			
			history.pushState(null, null, location.href);
			window.onpopstate = function(event) {
				history.go(1);
			};
			
			function loginChk(){
				var confirm = "<%=confirm%>";
				var inputId = "<%=inputId%>";
				
				if(confirm == "noId"){
					alert("ID가 존재하지 않습니다.");
					document.loginForm.uid.focus();
				}else if(confirm == "wrongPw"){
					alert("비밀번호가 틀렸습니다.");
					document.loginForm.upw.focus();
				}
				
				if(inputId != "null"){
					document.getElementById("uid").value = inputId;
				}
	
			}
			
			function enterkey(){
				if(window.event.keyCode == 13){
					gotoLogin();
				}
			}
		</script>
  	</head>	
  	<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center" onload="loginChk()" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

		<div class="card align-middle" style="width:20rem; border-radius:20px;margin:auto;margin-top: auto;">
			<div class="card-title" style="margin-top:30px;">
				<h2 class="card-title text-center" style="color:#113366;">로그인</h2>
			</div>
			<div class="card-body">
      			<form class="form-signin" action="../do/login_do.jsp" method="POST" name="loginForm">
        			<label for="inputEmail" class="sr-only">Your ID</label>
        			<input onkeyup="enterkey();" type="text" id="uid" name="uid" class="form-control" placeholder="ID를 입력하세요" required autofocus><BR>
        			<label for="inputPassword" class="sr-only">Password</label>
        			<input onkeyup="enterkey();" type="password" id="upw" name="upw" class="form-control" placeholder="비밀번호를 입력하세요" required><br>
        			<div class="checkbox">
          				<label style="display: block; margin: 0 auto;">
            			<a href="#" style="color:#add039;text-decoration: none;">아이디 찾기</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#" style="color:#add039;text-decoration: none;">비밀번호 찾기</a>
       					</label>
        			</div>
       			<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" name="main" type="button" style="background-color: #add039" onclick="gotoMain()">메인화면</button><br>
        		<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" name="login_info" type="button" style="background-color: #add039;" onclick="gotoLogin()">로 그 인</button>
        		<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" name="reg" type="button" style="background-color: #add039" onclick="gotoPage()">회원가입</button>
      			</form>
			</div>
		</div>
		<div class="modal">
		</div>
  	</body>
</html>