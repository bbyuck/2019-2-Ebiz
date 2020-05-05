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
		<link rel="stylesheet" href="../assets/css/board_table.css"/>
        <!-- font awesome -->
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <!-- Custom style -->
         <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="../assets/js/join.js"></script>
		<script src="../assets/js/page.js"></script>
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
		if(<%=id%> == null){
			location.href = "../page/user_only.jsp";
		}
	</script>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("org.mariadb.jdbc.Driver");
	String DB_URL = "jdbc:mariadb://localhost:3306/user?useSSL=false";	//나중에 SSL 인증서 꼭 true로 셋팅!

	Connection con = DriverManager.getConnection(DB_URL, "papamama_admin", "1234");
	String sql = "SELECT * FROM user_info WHERE id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,id);
	
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	
	String user_name = rs.getString("user_name");
	String sex = rs.getString("sex");
	String postnum = rs.getString("postnum");
	String address1 = rs.getString("address1");
	String address2 = rs.getString("address2");
	String email = rs.getString("email");
	String phoneNumber = rs.getString("phone_number");
	
	int at_index = email.indexOf("@");
	String email_id = email.substring(0, at_index);
	int email_length = email.length();
	String initial_domain = email.substring(at_index + 1, email_length);
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
							%>
						</ul>
					</header>
					<section>
						<article class="container">
        					<div class="page-header">
            					<div class="col-md-6 col-md-offset-3">
                					<h3>회원 정보 수정</h3>
                				</div>
            				</div>
            				<div class="col-sm-6 col-md-offset-3">
            					<!-- 회원가입 정보 전송 -->
                				<form action="../do/user_info_change_do.jsp" method="post" name="userInfo" >
	                				<div class="form-group">
		              					<h2><%=id %></h2>
	                 				</div>
	                 				<div class="form-group">
	                 					<div class="label">
	                 						비밀번호
	                 					</div>
	                 					<input type="password" class="form-control" name="inputPassword" id="inputPassword" placeholder="비밀번호를 입력해주세요">
	                 					<br>
	                    			</div>
	                    			<div class="form-group">
	                    				<div class="label">
	                      					비밀번호 확인
	                        			</div>
	                        			<input type="password" class="form-control" id="inputPasswordCheck" name="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시 한 번 입력 해 주세요">
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                        			<div class="label">
	                        				성명
	                        			</div>
	                        			<input type="text" class="form-control" name="inputName" id="inputName" value="<%=user_name%>" readonly="readonly">
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                    				<div class="label">
	                    					성별
										</div>
										<input type="text" class="form-control" name="inputName" id="inputName" value="<%=sex%>" readonly="readonly">
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                        			<div class="label">
	                        				주소
	                        			</div>
	                        			<p>
	                        			<input type="button"  onClick="goPopup();" value="주소찾기" style="float">
	                        			</p>
	                        			<p>
	                        				우편번호
	                        				<input type="text" class="form-control" name="postnum" id="postnum" value="<%=postnum %>" readonly="readonly" style="width:30%; float:inherit">     			
	                        			</p>
	                        			<p>
	                        				<span>
	                        					<input type="text" class="form-control" name="address1" id="address1" readonly="readonly" value="<%=address1 %>">
	                        					<input type="text" class="form-control" name="address2" id="address2" placeholder="상세 주소를 입력해주세요" value="<%=address2%>">
	                        				</span>
	                        			</p>
	                    			</div>
	                    			<div class="form-group">
	                        			<div class="label">
	                        				이메일 주소
	                        			</div>
	                        			<span style="width:100%">
	                        				<input type="text" class="form-control" name="inputEmail" id="inputEmail" placeholder="이메일 주소를 입력해주세요" value="<%=email_id%>" style="width:45%; flaot:left; display:initial;">
	                        				@
	                        				<input type="text" class="form-control" name="selected_domain" id="selected_domain" value="<%=initial_domain %>" style="width:49%; float:right; display:initial;">
	                        			</span>
	                        			<br>
	                        			<br>	
	                        			<select name="email_domain" id="email_domain" onchange="makeEmail();" style="float:right; width:49%; display:initial;">
	                        				<option id="self" value="" selected="selected">직접입력</option>
	                        				<option id="naver" value="naver.com">naver.com</option>
	                        				<option id="daum" value="daum.net">daum.net</option>
	                        				<option id="hotmail" value="hotmail.com">hotmail.com</option>
	                        				<option id="nate" value="nate.com">nate.com</option>
	                        				<option id="yahoo" value="yahoo.co.kr">yahoo.co.kr</option>
	                        				<option id="dreamwiz" value="dreamwiz.com">dreamwiz.com</option>
	                        				<option id="freechal" value="freechal.com">freechal.com</option>
	                        				<option id="lycos" value="lycos.co.kr">lycos.co.kr</option>
	                        				<option id="korea" value="korea.com">korea.com</option>
	                        				<option id="gmail" value="gmail.com">gmail.com</option>
	                        				<option id="hanmir" value="hanmir.com">hanmir.com</option>
	                        			</select>
	                    				<br>
	                    				<br>
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                    				<div class="label">
	                        				휴대폰
	                        			</div>
	                        			<span>
	                        				<select name="phone" id="phone">
	                        					<option value="010" selected="selected">010</option>
	                        					<option value="011">011</option>
	                        					<option value="016">016</option>
	                        					<option value="017">017</option>
	                        					<option value="019">019</option>
	                        				</select>
	                        			&nbsp;-
	                        				<input type="text" name="phone2">
	                        				-
	                        				<input type="text" name="phone3">
	                    				</span>
	                    			</div>
	                    			<div class="form-group text-center">
		                    			<p align="center">
		                        			<input type="button" id="join-submit" class="btn btn-primary" value="수정" onclick="formChk()">
		                        			<input type="button" class="btn btn-warning" value="취소" onclick="isCancel()">
		                    			</p>
	                    			</div>
                				</form>
            				</div>
        				</article>
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
		
		<p><input type="text" id="extra" readonly="readonly" style="display:none;"></p>	<!-- 동 주소 -->
	</body>
</html>