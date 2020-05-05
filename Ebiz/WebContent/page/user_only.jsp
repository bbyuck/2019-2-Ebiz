<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false" import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
	<head>
		<title>Ebiz 11 조</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="stylesheet" href="../assets/css/main.css" />
<%
	HttpSession session = request.getSession(false);
	String id = null;

	if(session != null){
		id = (String)session.getAttribute("login.id");
	}
%>	
		<script src="../assets/js/page.js"></script>
		<script>
			history.pushState(null, null, location.href);
			window.onpopstate = function(event) {
				history.go(1);
			};
		</script>
	</head>
	<body class="is-preload" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
			<div id="main">
				<div class="inner">
					<!-- Header -->
					<header id="header">
						<a href="../page/main_page.jsp" class="logo"><strong>Ebiz 11 조</strong></a>
						<ul class="icons">
							<%
							if(id == "null" || id == null) {
							%>
							<li><a href="../page/login_page.jsp"><span class="label">로그인</span></a></li>
							<li><a href="../page/terms_page.jsp"><span class="label">회원가입</span></a></li>
							<%
							}
							else{
							%>
							<li><%=id%>님 환영합니다!</li>
							<li><a href='javascript:void(0);' onclick="gotoLogout();">로그아웃</a></li>
							<%
							} 
							%>
						</ul>
					</header>
					<section>
						<img src="../images/useronly.png" width="100%" style="margin-bottom:100px;">
						<input type="button" value="로그인" onclick="toLogin();" style="display: block; margin: 0 auto;">
					</section>
					<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; AllTogether All rights reserved. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
					</footer>
				</div>
			</div>
				<!-- Sidebar -->
				<div id="sidebar">
					<div class="inner">
						<!-- Menu -->
						<nav id="menu">
							<header class="major">
								<h2>메뉴</h2>
							</header>
							<ul>
								<li><a href="#">홈</a></li>
								<li><a href="../page/inc_info_page.jsp">이용 안내</a></li>
								<li><a href="../Board/notice_board.jsp?page=1&page_bundle=0">공지사항</a></li>
								<li>
									<span class="opener">고객센터</span>
									<ul>
										<li><a href="#">자주 묻는 질문</a></li>
										<li><a href="../page/user_only.jsp">문의하기</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					<!-- Section -->
			</div>
		</div>
		<!-- Scripts -->
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/browser.min.js"></script>
		<script src="../assets/js/breakpoints.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
	</body>
</html>