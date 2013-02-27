// JavaScript Document

var xmlHttp;
var flag = false;
function createXMLHttp() {
	if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	} else {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
}
function checkUserid(userid) {
	createXMLHttp();
	xmlHttp.open("POST", "CheckServlet?userid=" + userid);
	xmlHttp.onreadystatechange = checkUseridCallback;
	xmlHttp.send(null);
	document.getElementById("msg").innerHTML = "姝ｅ湪楠岃瘉...";
}
function checkUseridCallback() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {

			var text = xmlHttp.responseText;
			if (text == "true") { // 鐢ㄦ埛id宸茬粡瀛樺湪浜�
				document.getElementById("msg").innerHTML = "鐢ㄦ埛ID閲嶅锛屾棤娉曚娇鐢紒";
				flag = false;
			} else {
				document.getElementById("msg").innerHTML = "啊";
				flag = true;
			}
		}
	}
}
function checkForm() {
	return flag;
}