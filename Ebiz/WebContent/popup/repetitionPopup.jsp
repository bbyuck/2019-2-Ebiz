<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>id 중복확인</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
<%
request.setCharacterEncoding("utf-8");
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/user?useSSL=false";	//나중에 SSL 인증서 꼭 true로 셋팅!
Connection con = DriverManager.getConnection(DB_URL, "papamama_admin", "1234");

String id = request.getParameter("id");

String sql = "SELECT * FROM user_info WHERE id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();

if(id==null){
	id = "";
}
%>
		<script src="../assets/js/join.js"></script>
	</head>
	<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<form name="checkForm">
			<p style="font-size:40px;" align="center">아이디 중복체크</p>
			<input type="text" class="form-control" name="id" id="id" value= "<%=id %>" placeholder="아이디를 입력하세요" onkeyup="recheck();">
			
			<br>
			<br>
			
			<p align="center"><input type="button" value="중복체크" onClick="idCheck()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="use" value="사용하기" disabled="disabled" onclick="sendCheckValue()"></p>
			<div id="txt" align="center">
			<%
				if(rs.next()){
			%>
			<%=id%>은(는) 이미 사용중인 ID입니다.
			<script>
				var btn = document.getElementById('use');
				btn.disabled = 'disabled';
			</script>
			<%
				}
				else if(id == ""){
			%>
			<script>
				var btn = document.getElementById('use');
				btn.disabled = 'disabled';
			</script>
			<%
				}
				else if(id != ""){
			%>	
				사용하실 수 있는 ID입니다.
			<script>
				var btn = document.getElementById('use');
				btn.disabled = false;
			</script>
			<%
				}
			%>
			</div>
		</form>
		
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/browser.min.js"></script>
		<script src="../assets/js/breakpoints.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
		
		<%
		rs.close();
		pstmt.close();
		con.close();
		%>
	</body>
</html>