<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파파마마</title>
		<link rel="stylesheet" href="../assets/css/main.css"/>
		<script src="../assets/js/join.js"></script>
	</head>
	<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<h1 style="text-align:center;">이용약관</h1>
		<textarea rows="50" cols="50" style="border: solid 1px; resize:none;" readonly="readonly">이용약관 내용</textarea> <br><br>
		<div align="center" style="margin-bottom:20px;">
			<input type="button" id="agree" value="동의" onclick="agreed()">
		</div>
	</body>
</html>