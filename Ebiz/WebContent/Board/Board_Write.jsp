<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false" import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
	<head>
		<title>파파마마 사이드바 모듈</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylecheet" href="../assets/css/board_table.css" />
	<%
	HttpSession session = request.getSession(false);
	String id = null;
	int grade = 0;
	
	if(session != null){
		id = (String)session.getAttribute("login.id");
		grade = (int)session.getAttribute("login.grade");
	}
	
	request.setCharacterEncoding("utf-8");
	Class.forName("org.mariadb.jdbc.Driver");
	String DB_URL = "jdbc:mariadb://localhost:3306/user?useSSL=false";	//나중에 SSL 인증서 꼭 true로 셋팅!

	Connection con = DriverManager.getConnection(DB_URL, "papamama_admin", "1234");
	
	String sql = "SELECT grade_1, grade_A FROM user_info WHERE id=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	
	
	
	int num_grade = rs.getInt("grade_1");
	int alpha_grade = rs.getInt("grade_A");
	
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
									<%if(id == "null" || id == null) {%>
									<li><a href="../page/login_page.jsp"><span class="label">로그인</span></a></li>
									<li><a href="../page/terms_page.jsp"><span class="label">회원가입</span></a></li>
									<%}else{ %>
									<%if(grade == 1 || grade == 9){ %>
									<li><%=id%> 회원님 환영합니다!</li>
									<li><a href='javascript:void(0);' onclick="gotoLogout();">로그아웃</a></li>
									<%			
									}else if(grade == 2){
									%>
									<li><%=id%> 매니저님 환영합니다!</li>
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

								<form action="#" method="post" name="write_form">
									<p style="font-size:20px; border-bottom:solid 1px; padding-bottom:30px;">제목<input type="text" id="subject" name="subject" style="width:90%;float:right"></p>
									<!-- option 박스 -->
									<div style="padding-bottom:200px;">
										<div style= "padding:20px; width:30%;float:left;">
		  									<p style="font-size:17px;">원하는 근무 시간대를 선택해주세요.</p>
		  									<input type="radio" id="morning" name="work_time" value="오전">
		  									<label for="morning">오전</label>
		  									<input type="radio" id="afternoon" name="work_time" value="오후">
		  									<label for="afternoon">오후</label>
		  									<input type="radio" id="evening" name="work_time" value="저녁">
		  									<label for="evening">저녁</label>
										</div>
										
										<div style="padding:20px; width:24%;float:left;">
											<p style="font-size:17px;">차량을 보유하고 계십니까?</p>
											<input type="checkbox" id="car" value="차량보유"/>
		    								<label for="car">차량 보유</label>
										</div>
										
										<div style="padding:20px; width:45%;float:left;">
											<p style="font-size:17px;">회원님의 등급은입니다. 근무 등급을 선택해주세요.</p>
											<select name="work_grade">

											</select>
										</div>
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
										<li><a href="../page/inc_info_page.jsp">회사 소개</a></li>
										<li><a href="#">공지사항</a></li>
										<li>
											<span class="opener">마이페이지</span>
											<ul>
												<li><a href="#">회원 정보 변경</a></li>
												<li><a href="#">근무 내역</a></li>
												<li><a href="#">파트너 신청</a></li>
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
												<li><a href="#">문의하기</a></li>
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