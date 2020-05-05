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
		<link rel="stylesheet" href="../assets/css/main.css" />
	<%
		HttpSession session = request.getSession(false);
		String id = null;
		String sgrade = null;
		int grade = 0;
		if(session != null){
			id = (String)session.getAttribute("login.id");
			grade = (int)session.getAttribute("login.grade");
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
							<%if(grade == 1 || grade == 9){ %>
								<li><%=id%> 사장님 환영합니다!</li>
								<li><a href='javascript:void(0);' onclick="gotoLogout();">로그아웃</a></li>
								<%			
								}else if(grade == 2){
								%>
								<li><%=id%> 라이더님 환영합니다!</li>
								<li><a href='javascript:void(0);' onclick="gotoLogout();">로그아웃</a></li>
								<%
								}else if(grade == 3){
								%>
								<li>운영자 계정</li>
								<li><a href='javascript:void(0);' onclick="gotoLogout();">로그아웃</a></li>
								<% 
								}
							}
							%>
						</ul>
					</header>
					<section>
						<img src="../images/managerGuide.png" width="100%">
					</section>
					<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; AllTogether All rights reserved. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
					</footer>
				</div>
			</div>
			<!-- Sidebar -->
				
				<%
				if(id == "null" || id == null) {					// 일반유저
				%>
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
				<%
				}
				else{
					if(grade == 1){							//사장님
				%>
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
									<span class="opener">마이페이지</span>
									<ul>
										<li><a href="../page/check_to_user_info_change_page.jsp">회원 정보 변경</a></li>
										<li><a href="../page/user_only.jsp">이용 내역</a></li>
										<li><a href="../page/user_only.jsp">파트너쉽 신청</a></li>		<!-- 구독 수익 모델 -->
									</ul>
								</li>
								<li><a href="../Board/application_board.jsp?page=1&page_bundle=0">라이더 호출</a></li>
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
				<%
					}
					else if(grade == 2){				//라이더
				%>
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
									<span class="opener">마이페이지</span>
									<ul>
										<li><a href="../page/check_to_user_info_change_page.jsp">회원 정보 변경</a></li>
										<li><a href="../page/user_only.jsp">근무 내역</a></li>
										<li><a href="../page/user_only.jsp">파트너 신청</a></li>
									</ul>
								</li>
								<li>
									<span class="opener">근무 신청</span>
									<ul>
										<li><a href="../Board/application_board.jsp?page=1&page_bundle=0">시장</a></li>
										<li><a href="../Board/seeking_board.jsp?page=1&page_bundle=0">슈퍼마트</a></li>
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
				<%
					}
				}
				%>
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