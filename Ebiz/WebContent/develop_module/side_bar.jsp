<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false"
    %>
<!DOCTYPE html>
<html>
	<head>
		<title>파파마마 사이드바 모듈</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	<%
	HttpSession session = request.getSession(false);
	String id = null;
	
	if(session != null){
	id = (String)session.getAttribute("login.id");
	}
	%>	
		<script>
			function gotoLogout(){
				alert("<%=id%>님 정상적으로 로그아웃 되었습니다.");
				location.href = "../do/logout_do.jsp";
			}
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
								<a href="../page/main_page.jsp" class="logo"><strong>파파마마</strong></a>
								<ul class="icons">
									<img src="../assets/icons/google_play_icon.png" style="height: 40px;width:130px" usemap="#playstore">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<map name="playstore">
										<area shape="rect" coords="0,0,130,40" href="플레이스토어주소">
									</map>
									<%if(id == "null" || id == null) {%>
									<li><a href="../page/login_page.jsp"><span class="label">로그인</span></a></li>
									<li><a href="../page/terms_page.jsp"><span class="label">회원가입</span></a></li>
									<%}else{ %>
									<li><%=id%>님 환영합니다!</li>
									<li><a href='javascript:void(0);' onclick="gotoLogout();">로그아웃</a></li>
									<%} %>
								</ul>
							</header>
							<section>
								
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
										<li><a href="../page/inc_info_page.jsp">회사 소개</a></li>
										<li><a href="../Board/notice_board">공지사항</a></li>
										<li>
											<span class="opener">마이페이지</span>
											<ul>
												<li><a href="../page/check_to_user_info_change_page.jsp">회원 정보 변경</a></li>
												<li><a href="../page/user_only.jsp">매칭 내역</a></li>
												<li><a href="../page/user_only.jsp">등급 변경 신청</a></li>
												<li><a href="../page/user_only.jsp">등급 변경 내역</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">구인 / 구직</span>
											<ul>
												<li><a href="../Board/application_board.jsp?page=1&page_bundle=0">구인글</a></li>
												<li><a href="../Board/seeking_board.jsp?page=1&page_bundle=0">구직글</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">커뮤니티</span>
											<ul>
												<li><a href="#">정보 공유</a></li>
												<li><a href="#">광고(준비중)</a></li>
											</ul>
										</li>
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

			</div>
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
	</body>
</html>