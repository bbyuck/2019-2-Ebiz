//뒤로가기 막기
history.pushState(null, null, location.href);
window.onpopstate = function(event) {
	history.go(1);
};

//termsPopup.jsp

function agreed(){
	opener.agreed();
	window.close();
}

//repetitionPopup.jsp

function idCheck(){
	var id = document.getElementById("id").value;
	var idReg = /^[A-Za-z0-9]{5,15}$/;
	
	if(!id){
		alert("ID를 입력하지 않았습니다");
		document.checkForm.id.focus();
		return false;
	}
	else if(!idReg.test(id)){
		alert("id는 영어 대 소문자와 숫자로만 이루어진 5~15자리의 문자열이어야 합니다 - 공백문자를 포함한 특수문자는 이용할 수 없습니다");
		document.checkForm.id.focus();
		return false;
	}
	
	var url = "repetitionPopup.jsp?id=" + id;
	location.href = url;
}

function sendCheckValue(){
	opener.document.userInfo.idDuplication.value = "idCheck";
	opener.document.userInfo.inputId.value = document.getElementById("id").value;
	
	if(opener != null){
		opener.chkForm = null;
		self.close();
	}
}
function recheck(){
	var btn = document.getElementById('use');
	btn.disabled = 'disabled';
}

//page

//welcome_page.jsp

function toLogin(){
	location.href = "../page/login_page.jsp";
}
function toMain(){
	location.href = "../page/main_page.jsp";
}

//userReg_page.jsp

//<!--주소찾기 api(카카오) -->
function goPopup() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extra").value = extraAddr;
            
            } else {
                document.getElementById("extra").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postnum').value = data.zonecode;
            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
        }
    }).open();
}

function isCancel(){  			// 취소 누를 시 뒤로갈지 물어보기
	var flag = confirm('입력한 내용이 모두 사라집니다. 이 페이지를 벗어나시겠습니까?');
	
	if(flag == true){
		location.href = "../page/login_page.jsp";
	}
}

function inputIdChk(){
	document.userInfo.idDuplication.value = 'idUncheck';

}

function makeEmail(){
	var domain = document.getElementById("email_domain");
	var selectDomain = domain.options[domain.selectedIndex].value;
	document.userInfo.selected_domain.value = selectDomain;

	if(selectDomain == ""){
		document.userInfo.selected_domain.readOnly = false;
	}else{
		document.userInfo.selected_domain.readOnly = true;
	}
}

function openIdChk(){
	var id = document.getElementById("inputId").value;
	var idReg = /^[A-Za-z0-9]{5,15}$/;
	
	if(!idReg.test(id)){
		alert("id는 영어 대 소문자와 숫자로만 이루어진 5~15자리의 문자열이어야 합니다 - 공백문자를 포함한 특수문자는 이용할 수 없습니다");
		document.checkForm.inputId.focus();
		return false;
	}
	window.name = "parentForm";
	var url = "../popup/repetitionPopup.jsp?id=" + document.userInfo.inputId.value;
	window.open(url ,"chkForm","width=500, height=300, resizable = no, scrollbars = no");
}

function checkNum(e) {
	var keyVal = event.keyCode;
 
    if(((keyVal >= 48) && (keyVal <= 57))){
        return true;
    }
    else{
         return false;
    }
}

function formChk(){
	//[영문 대문자 또는 소문자 또는 숫자로 시작하는 아이디, 길이는 5~15자, 끝날때 영문 대문자 또는 소문자 또는 숫자]
	var id = document.getElementById("inputId").value;
	var pw = document.getElementById("inputPassword").value;
	var idReg = /^[A-Za-z0-9]{5,15}$/;
	//pw - 영어 숫자 특수문자가 각각 하나 이상씩 8 ~ 15자
	var pwReg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,15}$/;
	
	var sex = document.getElementsByName("sex");
	var sex_value = null;
	
	for(var i=0; i<sex.length; i++) {
	    if(sex[i].checked) {
	        sex_value = sex[i].value;
	    }
	}

	
	var emailReg = /^[A-Za-z0-9]{3,20}$/;
	var mail = document.getElementById("inputEmail").value;
	
	if(document.userInfo.inputId.value==""){
		alert("ID를 입력하세요");
		document.userInfo.inputId.focus();
		return false;
	}else if(document.userInfo.idDuplication.value=="idUncheck"){
		alert("ID 중복확인을 해주세요");
		document.userInfo.inputId.focus();
		return false;	
	}else if(document.userInfo.inputPassword.value==""){
		alert("비밀번호를 입력하세요");
		document.userInfo.inputPassword.focus();
		return false;
	}else if(!pwReg.test(pw)){
		alert("비밀번호는 영어, 숫자, 특수문자를 각각 하나 이상씩 사용해 8~15자리의 문자열이어야 합니다.");
		document.userInfo.inputPassword.focus();
		return false;
	}
	else if(document.userInfo.inputPasswordCheck.value==""){
		alert("비밀번호를 한 번 더 입력하세요");
		document.userInfo.inputPasswordCheck.focus();
		return false;
	}else if(document.userInfo.inputPassword.value != document.userInfo.inputPasswordCheck.value){
		alert("비밀번호가 일치하지 않습니다");
		document.userInfo.inputPasswordCheck.focus();
		return false;
	}else if(document.userInfo.inputName.value == ""){
		alert("이름을 입력하세요");
		document.userInfo.inputName.focus();
		return false;
	}else if(sex_value == null){
		alert("성별을 선택해주세요");
		document.userInfo.inputName.focus();
		return false;
	}else if(document.userInfo.postnum.value == ""){
		alert("주소를 입력하세요");
		return false;
	}
	
	if(document.userInfo.inputEmail.value != "" && document.userInfo.selected_domain.value == ""){
		alert("이메일 주소를 끝까지 입력해주세요");
		document.userInfo.inputEmail.focus();
		return false;
	}else if(document.userInfo.inputEmail.value != "" && !emailReg.test(mail)){
		alert("이메일은 특수문자를 제외하고 3~20자까지 입력할 수 있습니다");
		document.userInfo.inputEmail.focus();
		return false;
	}
	
	document.userInfo.submit();
}