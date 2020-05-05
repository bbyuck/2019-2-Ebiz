<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.*, java.util.*, java.text.*, user.*"
    %>
<%
request.setCharacterEncoding("utf-8");

userDTO newUser = new userDTO();
userDAO userDB = new userDAO();

String id = request.getParameter("inputId");
String pw = request.getParameter("inputPassword");
String user_name = request.getParameter("inputName");
String sex = request.getParameter("sex");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String postnum = request.getParameter("postnum");
String email = request.getParameter("inputEmail");
String domain = request.getParameter("selected_domain");
String phone = request.getParameter("phone");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");


phone += "-";
phone += phone2;
phone += "-";
phone += phone3;

email += "@";
email += domain;

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new java.util.Date());

newUser.setId(id);
newUser.setPassword(pw);
newUser.setUser_name(user_name);
newUser.setSex(sex);
newUser.setAddress1(address1);
newUser.setAddress2(address2);
newUser.setPostnum(postnum);
newUser.setEmail(email);
newUser.setPhone_number(phone);
newUser.setJoindate(today);
newUser.setGrade(2);	

userDB.join(newUser);

userDB.close();
%>

<script>
	location.replace("../page/welcome_page.jsp");
</script>