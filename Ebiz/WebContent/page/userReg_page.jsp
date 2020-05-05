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
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../assets/css/main.css" />
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

		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="../assets/js/join.js"></script>
		
	<%
	HttpSession session = request.getSession(false);
	String id = null;
	if(session != null){
		id = (String)session.getAttribute("login.id");
	}
	if(id != null){
		response.sendRedirect("../page/wrong_access_page.jsp");
	}
	
	request.setCharacterEncoding("utf-8");
	String grade = (String)request.getParameter("grade");
	
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
							<li><a href="../page/terms_page.jsp"><span class="label">회원가입</span></a></li>
						</ul>
					</header>
					<section>
					  	<article class="container">
  							<div class="page-header">
           						<div class="col-md-6 col-md-offset-3">
                					<h3>회원가입</h3>
                				</div>
            				</div>
            				<div class="col-sm-6 col-md-offset-3" style="margin:40px;">
            					<!-- 회원가입 정보 전송 -->
                				<form action="../do/userReg_do.jsp" method="post" name="userInfo" >
	                				<div class="form-group" >
		         						<label>
			         						아이디
			         						<span style="width:100%; float:right;"><input type="text" class="form-control" name="inputId" id="inputId" onkeydown="inputIdChk()" placeholder="아이디를 입력해주세요" style="width:70%;float:left"><input type="button" value="중복확인" onclick="openIdChk()"style="width:30%;float:right;text-align:center;">
			         						</span>
	                    				</label>
	                    				<input type="hidden" name="idDuplication" id="idDuplication" value="idUncheck">
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                        			<label>
		                        			비밀번호
		                        			<input type="password" class="form-control" name="inputPassword" id="inputPassword" placeholder="비밀번호를 입력해주세요" style="width:100%; float:right;">
		                        		</label>
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                      				<label>
		                      				비밀번호 확인
		                      				<input type="password" class="form-control" id="inputPasswordCheck" name="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" style="width:100%; float:right;">
		                      			</label>
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                        			<label>
		                        			성명
		                        			<input type="text" class="form-control" name="inputName" id="inputName" placeholder="이름을 입력해 주세요" style="width:100%; float:right;">
		                        		</label>
	                    				<br>
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                    				<label>
	                    					성별
			                    			<span style="width:87%; float:right">
				                    			<input type="radio" id="man" name ="sex" value = "남성"><label for="man">남성</label>
												<input type="radio" id="woman" name ="sex" value = "여성"><label for="woman">여성</label>
											</span>
										</label>
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                        			<p>
	                        				주소
	                        				<span style="width:87%;float:right">
	                        					<span style="width:51%;float:left">
	                        						<input type="button"  onClick="goPopup();" value="주소찾기" style="float:left;">
	                        					</span>
	                        					<br>
	                        					<br>
	                        					<span style="width:40%;float:left">
	                        						우편번호
	                        						<input type="text" class="form-control" name="postnum" id="postnum" readonly="readonly">
	                        					</span>
	                        				</span>
	                        			</p>
	                        			<br>
	                        			<p>
	                        				<span style="width:87%; float:right;">
	                        					<input type="text" class="form-control" name="address1" id="address1" readonly="readonly" style="width:100%; float:left;">
	                        					<input type="text" class="form-control" name="address2" id="address2" placeholder="상세 주소를 입력해주세요" style="width:100%; float:right;">
	                        				</span>
	                        			</p>
	                        			<br>
	                        			<br>
	                        			<br>
	                    			</div>
	                    			<br><br>
	                    			<div class="form-group">
	                        			<label>
	                        				이메일 주소
	                        			</label>
	                        				<span style="width:100%; float:right;">
	                        					<input type="text" class="form-control" name="inputEmail" id="inputEmail" placeholder="이메일 주소를 입력해주세요" style="width:45%;float:left">
	                        					@<input type="text" class="form-control" name="selected_domain" id="selected_domain" style="width:50%; float:right"><br>
	                        					<select name="email_domain" id="email_domain" style="width:50%; float:right;" onchange="makeEmail();">
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
	                    					</span>
	                    				
	                    				<br>
	                    			</div>
	                    			<div class="form-group">
	                        			<label>휴대폰</label>
	                        				<span style="width:100%; float:right">
	                        					<select name="phone" id="phone" style="width:30%;float:left">
	                        						<option value="010" selected="selected">010</option>
	                        						<option value="011">011</option>
	                        						<option value="016">016</option>
	                        						<option value="017">017</option>
	                        						<option value="019">019</option>
	                        					</select>
	                        					<input type="text" name="phone2" style="width:35%;float:left">

	                        					<input type="text" name="phone3" style="width:35%;float:left">
	                    					</span>
	                    				<br><br><br><br><br>
	                    				<input type="hidden" name="grade" value="<%=grade %>">
	                    			</div>
	                    			<div class="form-group text-center">
		                    			<p align="center">
		                        			<input type="button" id="join-submit" class="btn btn-primary" value="회원가입" onclick="formChk()">
		                        			<input type="button" class="btn btn-warning" value="가입취소" onclick="isCancel()">
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
									<span class="opener">커뮤니티</span>
									<ul>
										<li><a href="#">정보 공유</a></li>
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
		<!-- Scripts -->
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/browser.min.js"></script>
		<script src="../assets/js/breakpoints.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
		<p><input type="text" id="extra" readonly="readonly" style="display:none;"></p>	<!-- 동 주소 -->
	</body>
</html>