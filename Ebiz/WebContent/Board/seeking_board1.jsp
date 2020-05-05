<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="false" import="board.model.noticeDTO, board.model.noticeDAO, java.sql.*"
    %>
<!DOCTYPE html>
<html>
	<head>
		<title>파파마마</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets/css/notice_community.css" />
	<%
		HttpSession session = request.getSession(false);
		String id = null;
		String sgrade = null;
		
		int grade = 0;
		if(session != null){
			id = (String)session.getAttribute("login.id");
			grade = (int)session.getAttribute("login.grade");
		}else{
			response.sendRedirect("../page/user_only.jsp");
		}
	%>
	<%
			//db처리단
			request.setCharacterEncoding("utf-8");
			noticeDTO not = new noticeDTO();
			noticeDAO notDB = new noticeDAO();
			
			String scurrent_page = request.getParameter("page");
			String scurrent_page_bundle = request.getParameter("page_bundle");
			
			int count = notDB.getDBcount();								//총 글의 갯수
			int page_count = notDB.getPageCount();						//페이지의 갯수
			
			if (scurrent_page == null){
				scurrent_page = "1";
			}
			if (scurrent_page_bundle == null){
				scurrent_page_bundle = "0";
			}
			int current_page = Integer.parseInt(scurrent_page);			//현재 페이지 번호
			int current_page_start_num = (current_page - 1) * 10 + 1;	// 현재 페이지에서 시작하는 글의 번호

			int page_bundle = (page_count / 10);						//페이지 번들의 갯수 0부터 카운트
			if(page_count % 10 == 0 && page_bundle != 0){
				page_bundle--;
			}
			
			int current_page_bundle = Integer.parseInt(scurrent_page_bundle);	//현재 페이지의 페이지 번들 번호
			
			int num;
			String writer;
			String subject;
			Date write_date;
			int read_cnt;
		%>
		<script src="../assets/js/board.js"></script>
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
							<!-- content -->
							<section>
								<h2 style="margin-bottom:50px">공지사항</h2>
								<table>
									<tr class="bar">
										<th class="num">번호</th>
										<th class="writer">글쓴이</th>
										<th class="subject">제목</th>
										<th class="write_date">작성일</th>
										<th class="read_cnt">조회수</th>
									</tr>
								<%
								for(int i = current_page_start_num; i <= current_page_start_num + 10; i++){ 
									if(count < i || count == 0){
										break;
									}
									not = notDB.getNotice(i);	// application 가져오기
									num = not.getNUM();
									writer = not.getWRITER();
									subject = not.getSUBJECT();
									write_date = not.getWRITE_DATE();
									read_cnt = not.getREAD_CNT();	
									
									// 긴제목 처리 25자 이상
									if(subject.length() > 25){
										subject.substring(0,25);
										subject += "...";
									}
								%>
									<tr class="col">
										<td class="num"><%=num %></td>
										<td class="writer"><%=writer %></td>
										<td class="subject"><a href="../page/seeking_view_page.jsp?num=<%=num %>"><%=subject %></a>&nbsp;<img src="../icons/lock.png" width="2%"></td>
										<td class="write_date"><%=write_date %></td>
										<td class="read_cnt"><%=read_cnt %></td>
									</tr>
								<%} %>
								</table>
							</section>
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
										<a style="text-decoration:none" href="../Board/notice_board.jsp?page=1&page_bundle=0">&lt;&lt;-</a>&nbsp; 
										<a style="text-decoration:none" href="../Board/notice_board.jsp?page=<%=prev_page%>&page_bundle=<%=prev_page_bundle%>">&lt;-</a>&nbsp; 
										<%for(int i = (current_page_bundle * 10) + 1; i <= (current_page_bundle * 10) + 10; i++){
											if(page_count < i){
												break;
											}
										%>
										<a style="text-decoration:none" href="../Board/notice_board.jsp?page=<%=i %>&page_bundle=<%=current_page_bundle%>"><%=i %></a>&nbsp;
										<%} %> 
										<a style="text-decoration:none" href="../Board/notice_board.jsp?page=<%=next_page %>&page_bundle=<%= next_page_bundle%>">-&gt;</a> &nbsp;
										<a style="text-decoration:none" href="../Board/notice_board.jsp?page=<%=page_count%>&page_bundle=<%=page_bundle%>">-&gt;&gt;</a></p>
								 	<form action="#" method="get" align="center">
								 	 	<select class="search-group">
								 			<option value="작성자">작성자</option>
								 			<option value="제목">제목</option>
								 		</select>
								 		<input type="text" class="search-word">
								 		<input type="submit" class="search-button" value="검색">
								 	</form>
								 </div>
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
												<li><a href="../page/check_to_user_info_change_page.jsp">회원 정보 변경</a></li>
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
		<%
			notDB.close();
		%>
		</body>
</html>