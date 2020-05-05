function openApplication(num){
	window.name = "parentForm";
	var url = "../popup/applicationPopup.jsp?num=" + num;
	window.open(url ,"chkForm","width=1000, height=800, resizable = no, scrollbars = yes");
}