<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false" import="user.*"
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
	userDTO user = new userDTO();
	userDAO handle = new userDAO();
	int grade = 0;
	int cash = 0;
	int state = 0;
	String sstate = null;
	
	if(session != null){
		id = (String)session.getAttribute("login.id");
		user = handle.getUser(id);
		grade = user.getGrade();
		cash = user.getCASH();
		state = user.getWorkstate();
		
		if(grade == 2){
			if(state == 0){
				sstate = "대기중";
			}else if(state == 1){
				sstate = "근무중";
			}	
		}
		else if(grade == 1){
			if(state == 0){
				sstate = "대기중";
			}else if(state == 1){
				sstate = "호출중";		
			}	
		}
	}
	%>
		<script>
			function gotoLogout(){
				alert("<%=id%>님 정상적으로 로그아웃 되었습니다.");
				location.href = "../do/logout_do.jsp";
			}
			
			history.pushState(null, null, location.href);
			window.onpopstate = function(event) {
				history.go(1);
			};
			
			function exchange(){
				alert("E-money가 환전 되었습니다.");
				document.exch.submit();
			}
		</script>
		<style>
			img.btn{
				width:100%;
				height:100px;
				border-radius: 1.2em; 
				border:groove;
				margin:0.2em;
			}
		</style>
	</head>

	<body class="is-preload" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
			<div id="main">
				<div class="inner">
					<!-- Header -->
					<header id="header">
						<a href="#" class="logo"><strong>Ebiz 11조</strong></a>					
					<%if(id == null || id == "null") {%>
					</header>
					<!-- Section -->
					<section>
						<div class="container">
							<img src="../images/user_reg_button.png" class="btn" usemap="#user_reg"/>
							<map name="user_reg">
								<area shape="rect" coords="0, 0, 768, 256" href="./terms_page.jsp">
							</map>
						</div>
						<div class="container">
							<img src="../images/login.png" class="btn" usemap="#login"/>
							<map name="login">
								<area shape="rect" coords="0, 0, 768, 256" href="./login_page.jsp">
							</map>
						</div>
						<div class="container">
							<img src="../images/google_play.png" class="btn" usemap="#play_store"/>
							<map name="play_store">
								<area shape="rect" coords="0, 0, 768, 256" href="#">
							</map>
						</div>
						<div class="container">
							<img src="../images/app_store.png" class="btn" usemap="#app_store"/>
							<map name="app_store">
								<area shape="rect" coords="0, 0, 768, 256" href="#">
							</map>
						</div>
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
			<%} 
				else if(grade == 1) {%>
					<ul class="icons">
						<li><%=id%> 회원님 환영합니다!</li>
						<li><a href='javascript:void(0);' onclick="gotoLogout();">로그아웃</a></li>
					</ul>
					현재 상태 : <%= sstate%>&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;보유 금액 : <%= cash%>원
				</header>		
				<!-- Section 사장 회원 -->
					<section>
						<div class="container">
							<img src="../images/bike.jpg" class="btn" usemap="#bike"/>
							<map name="bike">
								<area shape="rect" coords="0, 0, 768, 256" href="../popup/RiderCall.jsp">
							</map>
						</div>
						<div class="container">
							<img src="../images/kakao.jpg" class="btn" usemap="#kakao"/>
							<map name="kakao">
								<area shape="rect" coords="0, 0, 768, 256" href="../popup/payPopup.jsp">
							</map>
						</div>
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
									<span class="opener">마이페이지</span>
									<ul>
										<li><a href="../page/check_to_user_info_change_page.jsp">회원 정보 변경</a></li>
										<li><a href="../page/user_only.jsp">이용 내역</a></li>
										<li><a href="../page/user_only.jsp">파트너 신청</a></li>
									</ul>
								</li>
								<li><a href="../popup/RiderCall.jsp">배달원 호출</a></li>
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
			<%} 
				else if(grade == 2){%>
					<ul class="icons">	
						<li><%=id%> 배달원님 환영합니다!</li>
						<li><a href='javascript:void(0);' onclick="gotoLogout();">로그아웃</a></li>
					</ul>
					현재 상태 : <%= sstate%>&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;보유 금액 : <%= cash%>원
				</header>
				<!-- Section 배달원 회원 -->
				<section>
					<div class="container">
						<img src="../images/work1.png" class="btn" usemap="#work"/>
						<map name="work">
							<area shape="rect" coords="0, 0, 768, 256" href="../popup/match_popup.jsp">
						</map>
					</div>
					<%if(state == 1){ %>
					<div class="container">
						<img src="../images/rider_finish.png" class="btn" usemap="#riderfinish"/>
						<map name="riderfinish">
							<area shape="rect" coords="0, 0, 768, 256" href="../do/complete_call.jsp">
						</map>
					</div>
					<%} %>
					<%if(cash > 0){ 
						String name = user.getUser_name();
						String smsid = "hotshot12343";
						String smspw = "wjswktkdrjfo1";
						String sender = "010-5262-5429";
						String phone = user.getPhone_number();
						String scash = Integer.toString(cash);
						String msg = name + "님에게 ";
						msg += cash + "원이 입금되었습니다.";
					%>
					<form method="post" action="../sms/Result.jsp" target="result" name="exch">
						<input type="hidden" value="2" name="method">
						<input type="hidden" value=<%= smsid%> name="smsID">
						<input type="hidden" value=<%= smspw%> name="hashValue">
						<input type="hidden" value=<%= sender%> name="senderPhone">
						<input type="hidden" value=<%= phone%> name="receivePhone">
						<input type="hidden" value=<%= msg %> name="smsContent">
						<input type="button" value="환전하기" style="width:100%; height:100px;font-size:15px" onclick="exchange()">
					</form>
					<%} %>
				</section>
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
									<span class="opener">마이페이지</span>
									<ul>
										<li><a href="../page/check_to_user_info_change_page.jsp">회원 정보 변경</a></li>
										<li><a href="../page/user_only.jsp">근무 내역</a></li>
										<li><a href="../page/user_only.jsp">파트너 신청</a></li>
									</ul>
								</li>
								<li><a href="../popup/match_popup.jsp">근무 시작</a></li>
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
			<%}
			handle.close();
			%>
			</div>		
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
	</body>
</html>