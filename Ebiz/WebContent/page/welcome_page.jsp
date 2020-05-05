<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
	<head>
		<title>Ebiz 11 조</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<script src="../assets/js/join.js"></script>
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
									<li><a href="../page/login_page.jsp"><span class="label">로그인</span></a></li>
									<li><a href="../page/terms_page.jsp"><span class="label">회원가입</span></a></li>
								</ul>
							</header>
							<section>
								<img src="../images/welcome_img.jpg" style="align-self: auto;" align="middle" width="100%">
								<p align="center"> <input type ="button" value="로그인" onclick="toLogin()">&nbsp;&nbsp;&nbsp;&nbsp;<input type ="button" value="메인으로" onclick="toMain()"> 
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
								<li><a href="../page/main_page.jsp">홈</a></li>
								<li><a href="../page/inc_info_page.jsp">이용 안내</a></li>
								<li><a href="../Board/notice_board.jsp?page=1&page_bundle=0">공지사항</a></li>
								<li>
									<span class="opener">마이페이지</span>
									<ul>
										<li><a href="../page/user_only.jsp">회원 정보 변경</a></li>
										<li><a href="../page/user_only.jsp">근무 내역</a></li>
										<li><a href="../page/user_only.jsp">파트너 신청</a></li>
									</ul>
								</li>
								<li>
									<span class="opener">근무 신청</span>
									<ul>
										<li><a href="../Board/application_board.jsp?page=1&page_bundle=0">모집중</a></li>
										<li><a href="../Board/seeking_board.jsp?page=1&page_bundle=0">모집 예정</a></li>
									</ul>
								<li>
									<span class="opener">고객센터</span>
									<ul>
										<li><a href="faq">자주 묻는 질문</a></li>
										<li><a href="../page/user_only.jsp">문의하기</a></li>
									</ul>
								</li>
							</ul>
						</nav>
							<!-- Section -->
					</div>
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