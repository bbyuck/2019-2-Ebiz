<%@page contentType="text/html;charset=UTF-8"%>
<HTML>
<HEAD>
<TITLE>너나우리SMS발송예제</TITLE>
</HEAD>
<BODY>
<H1>너나우리 SMS발송예제</H1>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) 
	methodID = -1;

boolean valid = true;

if(methodID != -1) 
	methodID = Integer.parseInt(method);

switch (methodID){ 
	case 2:
		valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">SMS아이디 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="smsID" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">SMS패스워드 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="hashValue" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">발신자번호 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="senderPhone" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">수신자번호 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="receivePhone" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">문자메세지 내용 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="smsContent" SIZE=100></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="확인">
<INPUT TYPE="RESET" VALUE="취소">
</FORM>
에러코드는 다음과 같습니다.<br>
 	//전송결과 처리<br>
	//1 : 발송성공<br>
	//1~N : 콤마로 연결하여 다중 발송을 하였을 경우에는 성공한 정수 숫자로 리턴됩니다.<br>
	//0 : SMS발송 가능량 부족<br>
	//-1 : SMS 아이디 /패스워드 이상<br>
	//-2 : SMS 아이디 공백<br>
	//-3 : 다중 전송시 모두 실패(수신번호이상)<br>
	//-4 : 해쉬공백<br>
	//-5 : 해쉬이상<br>
	//-8: 발신자 전화번호 공백<br>
	//-9: 전송내용 공백<br>
	//-10: 예약 날짜 이상<br>
	//-11: 예약 시간 이상<br>
	//-12: 예약 가능시간 지남<br>
	//-13: 스팸 동의서가 접수되지 않음<br>
	//-21: 데이타 베이스 이상<br>
	//-25: 주간 총 발송량 초과<br>
	//-26: 주간 URL 발송량 초과<br>
	//-27: 수/발신자 번호 동일<br>
	//-50: 잘못된 전화번호<br>
<%
		break;
	case 15:
		valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">SMS아이디 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="smsID" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">SMS패스워드 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="hashValue" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">발신자번호 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="senderPhone" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">수신자번호 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="receivePhone" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">내용 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="smsContent" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">예약날짜(날짜를 공백없이 yyyymmdd형식에 맞게 입력) : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="reserveDate" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">예약시간(시간을 공백없이 hhmmss형식에 맞게 입력) : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="reserveTime" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD ALIGN="left">사용자정의값 (예약취소시사용) : <INPUT TYPE="TEXT" NAME="userDefine" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="확인">
<INPUT TYPE="RESET" VALUE="취소">
</FORM>
에러코드는 다음과 같습니다.<br>
 	//전송결과 처리<br>
	//1 : 발송성공<br>
	//1~N : 콤마로 연결하여 다중 발송을 하였을 경우에는 성공한 정수 숫자로 리턴됩니다.<br>
	//0 : SMS발송 가능량 부족<br>
	//-1 : SMS 아이디 /패스워드 이상<br>
	//-2 : SMS 아이디 공백<br>
	//-3 : 다중 전송시 모두 실패(수신번호이상)<br>
	//-4 : 해쉬공백<br>
	//-5 : 해쉬이상<br>
	//-8: 발신자 전화번호 공백<br>
	//-9: 전송내용 공백<br>
	//-10: 예약 날짜 이상<br>
	//-11: 예약 시간 이상<br>
	//-12: 예약 가능시간 지남<br>
	//-13: 스팸 동의서가 접수되지 않음<br>
	//-21: 데이타 베이스 이상<br>
	//-25: 주간 총 발송량 초과<br>
	//-26: 주간 URL 발송량 초과<br>
	//-27: 수/발신자 번호 동일<br>
	//-50: 잘못된 전화번호<br>
<%
		break;

	case 70:
		valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">SMS아이디 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="smsID" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">패스워드 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="hashValue" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD ALIGN="left">사용자정의값 (예약발송시 지정한 값) : <INPUT TYPE="TEXT" NAME="userDefine" SIZE=20></TD>
<TD ALIGN="left"><INPUT TYPE="hidden" NAME="mode" value="1"></TD>
</TR>
</TABLE>

<BR>
<INPUT TYPE="SUBMIT" VALUE="확인">
<INPUT TYPE="RESET" VALUE="취소">
</FORM>
에러코드는 다음과 같습니다.<br>
//전송결과 처리<br>
//1 : 발송성공<br>
//1~N : 콤마로 연결하여 다중 발송을 하였을 경우에는 성공한 정수 숫자로 리턴됩니다.<br>
//0 : SMS발송 가능량 부족<br>
//-1 : 잘못된 sms_id와 패스워드 입력<br>
//     (sms_id와 패스워드를 다시 한번 확인해주시기 바랍니다.  sms_id,패스워드는 로그인때 id와 password가 아니며,<br>
//      sms, LMS, MMS등의 서비스 신청시에 생성한 아이디와 패스워드입니다.)<br>
//-2 : SMS 아이디 공백<br>
//-3 : 발송 모두 실패<br>
//      (수신자번호가 "숫자가 아닌 값"일시, 수신자번호 헨드폰 국번이 잘못된 값일시, 발송제한서버일시 값 반환)<br>
//-4 : 해쉬공백<br>
//-5 : 잘못된 sms_id와 패스워드 입력<br>
//     (sms_id와 패스워드를 다시 한번 확인해주시기 바랍니다.  sms_id,패스워드는 로그인때 id와 password가 아니며,<br>
//      sms, LMS, MMS등의 서비스 신청시에 생성한 아이디와 패스워드입니다.)<br>
//- 6 : 수신자 전화번호 공백<br>
//-8 : 발신자 전화번호 공백<br>
//-9 : 전송내용 공백<br>
//-10: 예약 날짜 이상<br>
//      (예약발송일자가 YYMMDD 형식이 아닐 경우 반환)<br>
//-11: 예약 시간 이상<br>
//	   (예약시간이 hhmmss 형식이 아닐 경우 반환)<br>
//-12: 예약 가능시간 지남<br>
//      (예약 발송시간이 현재 시간보다 과거인지 확인 부탁드립니다.)<br>
//-13: 스팸 동의서가 접수되지 않음<br>
//-14: URL/MMS/LMS 서비스를 신청하지 않음<br>
//- 15 : 서버에 이미지 파일 업로드 실패<br>
//- 16 : 지원하지 않는 파일 확장자(MMS인 경우)<br>
//-23: 허용ip가 아닌 경우 반환<br>
//      (홈페이지 > 문자메세지 >서비스관리 > 서비스 신청내역 > 발송가능ip목록 내용을 확인해주시기 바랍니다.)<br>
//- 21 : 데이터베이스 연결실패(DB Connection Fail), 잘못된 형태의 데이터를 보냈을 때<br>
//-25: 주간 총 발송량 초과<br>
//-26: 주간 URL 발송량 초과<br>
//- 28 : 메세지에 발송제한 키워드 존재<br>
//-27: 수/발신자 번호 동일<br>
//-30: 등록되지 않은 발신번호 <br>
//- 31 : 잘못된 발신번호<br>
//- 40 : 스팸 발송 차단<br>
//-50: 잘못된 전화번호<br>
<%
		break;

	case 81:
		valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">SMS아이디 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="smsID" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">패스워드 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="hashValue" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="확인">
<INPUT TYPE="RESET" VALUE="취소">
</FORM>
에러코드는 다음과 같습니다.<br>
//전송결과 처리<br>
//1 : 발송성공<br>
//1~N : 콤마로 연결하여 다중 발송을 하였을 경우에는 성공한 정수 숫자로 리턴됩니다.<br>
//0 : SMS발송 가능량 부족<br>
//-1 : 잘못된 sms_id와 패스워드 입력<br>
//     (sms_id와 패스워드를 다시 한번 확인해주시기 바랍니다.  sms_id,패스워드는 로그인때 id와 password가 아니며,<br>
//      sms, LMS, MMS등의 서비스 신청시에 생성한 아이디와 패스워드입니다.)<br>
//-2 : SMS 아이디 공백<br>
//-3 : 발송 모두 실패<br>
//      (수신자번호가 "숫자가 아닌 값"일시, 수신자번호 헨드폰 국번이 잘못된 값일시, 발송제한서버일시 값 반환)<br>
//-4 : 해쉬공백<br>
//-5 : 잘못된 sms_id와 패스워드 입력<br>
//     (sms_id와 패스워드를 다시 한번 확인해주시기 바랍니다.  sms_id,패스워드는 로그인때 id와 password가 아니며,<br>
//      sms, LMS, MMS등의 서비스 신청시에 생성한 아이디와 패스워드입니다.)<br>
//- 6 : 수신자 전화번호 공백<br>
//-8 : 발신자 전화번호 공백<br>
//-9 : 전송내용 공백<br>
//-10: 예약 날짜 이상<br>
//      (예약발송일자가 YYMMDD 형식이 아닐 경우 반환)<br>
//-11: 예약 시간 이상<br>
//	   (예약시간이 hhmmss 형식이 아닐 경우 반환)<br>
//-12: 예약 가능시간 지남<br>
//      (예약 발송시간이 현재 시간보다 과거인지 확인 부탁드립니다.)<br>
//-13: 스팸 동의서가 접수되지 않음<br>
//-14: URL/MMS/LMS 서비스를 신청하지 않음<br>
//- 15 : 서버에 이미지 파일 업로드 실패<br>
//- 16 : 지원하지 않는 파일 확장자(MMS인 경우)<br>
//-23: 허용ip가 아닌 경우 반환<br>
//      (홈페이지 > 문자메세지 >서비스관리 > 서비스 신청내역 > 발송가능ip목록 내용을 확인해주시기 바랍니다.)<br>
//- 21 : 데이터베이스 연결실패(DB Connection Fail), 잘못된 형태의 데이터를 보냈을 때<br>
//-25: 주간 총 발송량 초과<br>
//-26: 주간 URL 발송량 초과<br>
//- 28 : 메세지에 발송제한 키워드 존재<br>
//-27: 수/발신자 번호 동일<br>
//-30: 등록되지 않은 발신번호 <br>
//- 31 : 잘못된 발신번호<br>
//- 40 : 스팸 발송 차단<br>
//-50: 잘못된 전화번호<br>
<%
		break;
	case 87:
		valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">SMS아이디 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="smsID" SIZE=20 VALUE=''></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">패스워드 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="hashValue" SIZE=20 VALUE=''></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="확인">
<INPUT TYPE="RESET" VALUE="취소">
</FORM>
에러코드는 다음과 같습니다.<br>
 	//전송결과 처리<br>
	//1 : 발송성공<br>
	//1~N : 콤마로 연결하여 다중 발송을 하였을 경우에는 성공한 정수 숫자로 리턴됩니다.<br>
	//0 : SMS발송 가능량 부족<br>
	//-1 : SMS 아이디 /패스워드 이상<br>
	//-2 : SMS 아이디 공백<br>
	//-3 : 다중 전송시 모두 실패(수신번호이상)<br>
	//-4 : 해쉬공백<br>
	//-5 : 해쉬이상<br>
	//-8: 발신자 전화번호 공백<br>
	//-9: 전송내용 공백<br>
	//-10: 예약 날짜 이상<br>
	//-11: 예약 시간 이상<br>
	//-12: 예약 가능시간 지남<br>
	//-13: 스팸 동의서가 접수되지 않음<br>
	//-21: 데이타 베이스 이상<br>
	//-25: 주간 총 발송량 초과<br>
	//-26: 주간 URL 발송량 초과<br>
	//-27: 수/발신자 번호 동일<br>
	//-50: 잘못된 전화번호<br>
<%		
		break;
	case 90:
		valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">SMS아이디 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="smsID" SIZE=20 VALUE=''></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">패스워드 : </TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="hashValue" SIZE=20 VALUE=''></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="확인">
<INPUT TYPE="RESET" VALUE="취소">
</FORM>
에러코드는 다음과 같습니다.<br>
 	//전송결과 처리<br>
	//1 : 발송성공<br>
	//1~N : 콤마로 연결하여 다중 발송을 하였을 경우에는 성공한 정수 숫자로 리턴됩니다.<br>
	//0 : SMS발송 가능량 부족<br>
	//-1 : SMS 아이디 /패스워드 이상<br>
	//-2 : SMS 아이디 공백<br>
	//-3 : 다중 전송시 모두 실패(수신번호이상)<br>
	//-4 : 해쉬공백<br>
	//-5 : 해쉬이상<br>
	//-8: 발신자 전화번호 공백<br>
	//-9: 전송내용 공백<br>
	//-10: 예약 날짜 이상<br>
	//-11: 예약 시간 이상<br>
	//-12: 예약 가능시간 지남<br>
	//-13: 스팸 동의서가 접수되지 않음<br>
	//-21: 데이타 베이스 이상<br>
	//-25: 주간 총 발송량 초과<br>
	//-26: 주간 URL 발송량 초과<br>
	//-27: 수/발신자 번호 동일<br>
	//-50: 잘못된 전화번호<br>
<%		
		break;
	}
	if (valid) {
%>
원하시는 서비스를 선택해 주세요
에러코드는 다음과 같습니다.<br>
 	//전송결과 처리<br>
	//1 : 발송성공<br>
	//1~N : 콤마로 연결하여 다중 발송을 하였을 경우에는 성공한 정수 숫자로 리턴됩니다.<br>
	//0 : SMS발송 가능량 부족<br>
	//-1 : SMS 아이디 /패스워드 이상<br>
	//-2 : SMS 아이디 공백<br>
	//-3 : 다중 전송시 모두 실패(수신번호이상)<br>
	//-4 : 해쉬공백<br>
	//-5 : 해쉬이상<br>
	//-8: 발신자 전화번호 공백<br>
	//-9: 전송내용 공백<br>
	//-10: 예약 날짜 이상<br>
	//-11: 예약 시간 이상<br>
	//-12: 예약 가능시간 지남<br>
	//-13: 스팸 동의서가 접수되지 않음<br>
	//-21: 데이타 베이스 이상<br>
	//-25: 주간 총 발송량 초과<br>
	//-26: 주간 URL 발송량 초과<br>
	//-27: 수/발신자 번호 동일<br>
	//-50: 잘못된 전화번호<br>


<%
	  return;
}
%>

</BODY>
</HTML>
