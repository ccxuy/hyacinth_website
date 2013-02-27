/*Use for login and register*/
var xmlHttp;
var flag;
function createXMLHttp(){
	if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}else{
		xmlHttp = new ACTIVEXobject("Microsoft.XMLHTTP");
	}
}
function checkLoginid(userid){
	createXMLHttp();
	xmlHttp.open("POST","CheckUser?userid="+userid);
	xmlHttp.onreadystaechange = checkUseridCallback;
	xmlHttp.send(null);
	document.getElementById("errloginid").innerHTML = "Checking Duplicate ID";
}
function checkLoginidCall(){
	//数据返回完毕
	if(xmlHttp.readyState == 4){
		//HTTP返回正常
		if(xmlHtttp.status == 200){
			var text = xmlHttp.responseText;
			if(text == "true"){
				flag = false;
				document.getElementById("errloginid").innerHTML = "ID�ظ���~";
			}else{
				flag = true;
				document.getElementById("errloginid").innerHTML = "";
			}
		}
	}
}
function checkForm(){
	return flag;
}