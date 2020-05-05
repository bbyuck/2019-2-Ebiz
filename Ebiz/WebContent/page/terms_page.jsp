<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false"
%>
<!DOCTYPE html>
<html>
	<head>
		<title>Ebiz 11 조</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css"/>
		<script>
		function agreed(){
			var protectorBtn = document.getElementById('protector');
			protectorBtn.disabled = false;
			var workerBtn = document.getElementById('worker');
			workerBtn.disabled = false;
		}
		function termPopup(){
			var url = "../popup/termsPopup.jsp";
			var name = "이용약관";
			var option = "width = 500, height = 500, top = 100, left = 200, location = no";
			window.open(url, name, option);
		}
		function goMercReg(){
			document.getElementById("flag").value = 1;
			document.terms.submit();
		}
		function goRiderReg(){
			document.getElementById("flag").value = 2;
			document.terms.submit();
		}
		</script>
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
							<li><a href="#"><span class="label">회원가입</span></a></li>
						</ul>
					</header>

					<section>
						<form action="../page/userReg_page.jsp" name="terms" style="display: block; margin: 0 auto;" method="post">
							<img src="../images/terms_plz.png" width="100%" style="display: block; margin: 0 auto; margin-top:50px; margin-bottom:100px;">
							<div style="width: 100%; margin-bottom:50px;" align="center">
								<input type="button" value="약관보기" onClick="termPopup()">
							</div>
							<div style="width: 100%; margin-bottom:50px;" align="center">
								<input type="button" id="protector" value="기업 회원 가입" disabled="disabled" onclick="goMercReg()">&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" id="worker" value="라이더 회원 가입" disabled="disabled" onclick="goRiderReg()">
								<input type="hidden" id="flag" name="grade">
							</div>
						</form>
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