<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false" import="board.model.applicationDTO,board.model.applicationDAO,board.model.DBcon"
    %>
<!DOCTYPE html>

<html>
	<head>
		<title>파파마마 게시판 폼</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets/css/board_table.css" />
	<%
		//id session 처리
			HttpSession session = request.getSession(false);
			String id = null;
			
			if(session != null){
				id = (String)session.getAttribute("login.id");
			}else{
				response.sendRedirect("../page/user_only.jsp");
			}
	%>	
	<%
			//db처리단
			request.setCharacterEncoding("utf-8");
			applicationDTO app = new applicationDTO();
			applicationDAO appDB = new applicationDAO();
			
			String scurrent_page = request.getParameter("page");
			String scurrent_page_bundle = request.getParameter("page_bundle");
			
			int count = appDB.getDBcount();								//총 글의 갯수
			int page_count = appDB.getPageCount();						//페이지의 갯수
			
			if (scurrent_page == null){
				scurrent_page = "1";
			}
			if (scurrent_page_bundle == null){
				scurrent_page_bundle = "0";
			}
			int current_page = Integer.parseInt(scurrent_page);			//현재 페이지 번호
			int current_page_start_num = (current_page - 1) * 10 + 1;	// 현재 페이지에서 시작하는 글의 번호

			int page_bundle = (page_count / 10);						//페이지 번들의 갯수 0부터 카운트
			if(page_count % 10 == 0){
				page_bundle--;
			}
			
			int current_page_bundle = Integer.parseInt(scurrent_page_bundle);	//현재 페이지의 페이지 번들 번호

			String category;
			String subject;
			String period;
			String work_time;
			String area;
			String credit;
			String state;
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
								<h2 style="margin-bottom:50px">구인글</h2>
								<%
								for(int i = current_page_start_num; i <= current_page_start_num + 10; i++){ 
									if(count < i){
										break;
									}
									app = appDB.getApplication(i);	// application 가져오기
									category = app.getCATEGORY();
									subject = app.getSUBJECT();
									period = app.getPERIOD();
									work_time = app.getWORK_TIME();
									area = app.getAREA();
									credit = app.getCREDIT();
									state = app.getSTATE();
									
									
									// 긴제목 처리 25자 이상
									if(subject.length() > 25){
										subject.substring(0,25);
										subject += "...";
									}
								%>
								
								<div class="board_form" style="margin-bottom:100px;">
									<table class="board">
										<tr>
											<td class="menu">카테고리</td>
											<td class="content"><%=category %></td>
										</tr>
										<tr>
											<td class="menu">제목</td>
											<td class="content"><%=subject %></td>
										</tr>
										<tr>
											<td class="menu">기간</td>
											<td class="content"><%=period %></td>
										</tr>
										<tr>
											<td class="menu">시간</td>
											<td class="content"><%=work_time %></td>
										</tr>	
										<tr>
											<td class="menu">지역</td>
											<td class="content"><%=area %></td>
										</tr>
										<tr>
											<td class="menu">금액</td>
											<td class="content"><%=credit %></td>
										</tr>
										<tr>
											<td class="menu">상태</td>
											<td class="content"><%=state %><input type="button" class="info" value="자세히 보기"></td>
										</tr>
									</table>
								</div>
								<%} %>
								 <!-- 글쓰기 버튼 및 검색 -->
								
								 <div class="board-bottom">
								 
								 		<%
								 			int prev_page = ((current_page/10) - 1) * 10 + 1 ;
								 			
								 			if(prev_page < 1){
								 				prev_page = 1;
								 			}
								 			
								 			int prev_page_bundle = current_page_bundle - 1;
								 			
								 			if(prev_page_bundle < 0){
								 				prev_page_bundle = 0;
								 			}
								 			
								 			int next_page = (current_page_bundle + 1) * 10 + 1;
								 			
								 			if(next_page > page_count){
								 				next_page = page_count;
								 			}
								 			
								 			int next_page_bundle = current_page_bundle + 1;
								 			if(next_page_bundle >= page_bundle){
								 				next_page_bundle = page_bundle;
								 			}
								 		%>
										<input type="button" value="글 쓰기" style="float:right;font-size:12px;">
										<p class="board" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="../Board/Board_Form.jsp?page=1&page_bundle=0">&lt;&lt;-</a> &nbsp; <a href="../Board/Board_Form.jsp?page=<%=prev_page%>&page_bundle=<%=prev_page_bundle%>">&lt;-</a> &nbsp; 
										<%for(int i = (current_page_bundle * 10) + 1; i <= (current_page_bundle * 10) + 10; i++){
											if(page_count < i){
												break;
											}
										%>
										<a href="../Board/Board_Form.jsp?page=<%=i %>&page_bundle=<%=current_page_bundle%>"><%=i %></a>&nbsp;
										<%} %> 
										 <a href="../Board/Board_Form.jsp?page=<%=next_page %>&page_bundle=<%= next_page_bundle%>">-&gt;</a> &nbsp; <a href="../Board/Board_Form.jsp?page=<%=page_count%>&page_bundle=<%=page_bundle%>">-&gt;&gt;</a></p>
								 	<form action="#" method="get" align="center">
								 	 	<select class="search-group">
								 			<option value="작성자">작성자</option>
								 			<option value="제목">제목</option>
								 		</select>
								 		<input type="text" class="search-word">
								 		<input type="submit" class="search-button" value="검색">
								 	</form>
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
									<%if(id == "null" || id == null) {%>
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
												<li><a href="../page/check_to_user_info_change_page.jsp">회원 정보 변경</a></li>
												<li><a href="../page/user_only.jsp">매칭 내역</a></li>
												<li><a href="../page/user_only.jsp">등급 변경 신청</a></li>
												<li><a href="../page/user_only.jsp">등급 변경 내역</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">구인 / 구직</span>
											<ul>
												<li><a href="../Board/application_board.jsp?page=1&page_bundle=0">구인 신청</a></li>
												<li><a href="../page/seeking_board.jsp?page=1&page_bundle=0">구직 신청</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">커뮤니티</span>
											<ul>
												<li><a href="../page/user_only.jsp">정보 공유</a></li>
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
									<%}else{%>
									<header class="major">
										<h2>메뉴</h2>
									</header>
									<ul>
										<li><a href="#">홈</a></li>
										<li><a href="../page/inc_info_page.jsp">회사 소개</a></li>
										<li><a href="#">공지사항</a></li>
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
												<li><a href="../page/user_only.jsp">구직글</a></li>
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
									<%} %>
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