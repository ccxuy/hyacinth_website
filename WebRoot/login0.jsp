<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Login</title>
		<% request.setCharacterEncoding("utf-8"); %>
		<jsp:useBean id="reg" scope="request" class="com.hyacinth.UserRegister"/>
		<link type="text/css" href="css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />	
        <link href="main.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.12.custom.min.js"></script>
		<script type="text/javascript" src="js/userUtil.js"></script>
		<script type="text/javascript">
			$(function(){
				//Autocomplete
				$("#login_un").autocomplete({
					source: ["yuanxin", "andrew", "sam"]
				});

				// Button
				$("#button").button();
				$("#login_but_set").buttonset();
	

				// Login Dialog			
				$('#log_dia').dialog({
					autoOpen: false,
					width: 600,
					buttons: {
						"Ok": function() { 
							$(this).dialog("close"); 
						}
					}
				});
				// Registe Dialog			
				$('#reg_dia').dialog({
					modal: true,
					autoOpen: false,
					width: 600,
					buttons: {
						"以后再注册": function() { 
							$(this).dialog("close");
						} 
					}
				});
				
				// Dialog Link
				$('#reg_link').click(function(){
					$('#reg_dia').dialog('open');
					return false;
				});
				$('#log_link').click(function(){
					$('#log_dia').dialog('open');
					return false;
				});
				
				//hover states on the static widgets
				$('#log_link').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
			});
		</script>
		<script language="javascript">
		var xmlHttp ;
		var flag = false ;
		function createXMLHttp(){
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest() ;
			} else {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") ;
			}
		}
		function checkUserid(userid){
			createXMLHttp() ;
			xmlHttp.open("POST","CheckServlet?userid="+userid) ;
			xmlHttp.onreadystatechange = checkUseridCallback ;
			xmlHttp.send(null) ;
			document.getElementById("msg").innerHTML = "正在验证..." ;
		}
		function checkUseridCallback(){
			if(xmlHttp.readyState == 4){
				if(xmlHttp.status == 200){
					
					var text = xmlHttp.responseText ;
					if(text == "true"){	// 用户id已经存在了
						document.getElementById("msg").innerHTML = "用户ID重复，无法使用！" ;
						flag = false ;
					} else {
						document.getElementById("msg").innerHTML = "此用户ID可以注册！" ;
						flag = true ;
					}
				}
			}
		}
		function checkForm(){
			return flag ;
		}
	</script>
		<style type="text/css">
			/*demo page css*/
			/*body{ margin:0 auto;}*/
			.login_link {padding: 0em 1em 0em 20px;text-decoration: none;position: relative;}
			.login_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
		</style>	
	</head>
	<body>
		

		<!-- Login -->
		<div>
        	<table>
			<tr><td>ID </td><td><input id="login_un" style="z-index: 10; position: relative" title="type &quot;a&quot;" /></td></tr>
			<tr><td>Password </td><td><input id="login_pw" type="password" style="z-index: 10; position: relative" title="type &quot;a&quot;" /></td></tr>
            <tr><td colspan="2">
            	<!-- Button -->
				<form style="margin-top: 1em; word-break:keep-all;">
				<div id="login_but_set" style="white-space: nowrap;">
                        <a href="#" id="reg_link" class="ui-state-default ui-corner-all login_link">
                        <span class="ui-icon ui-icon-newwin"></span>
                        入住Hyacinth
                        </a>
                    	<a href="#" id="log_link" class="ui-state-default ui-corner-all login_link">
                        <span class="ui-icon ui-icon-check"></span>
                        登陆
                        </a>
                </div>
                </form>
            </td></tr>
            
            </table>
		</div>
		

		
		<!-- 背景覆盖 -->
		<div id="bgCover"></div>
		<!-- Login dialog -->
		<div id="log_dia" title="Welcome back!">
			hi
		</div>
		<!-- Register dialog -->
		<div id="reg_dia" title="Register">
			<div id="reg_info"></div>
			<form action="check.jsp" method="post">
				<table border="none">
				<tr>
					<td>登陆ID: </td><td>
					<input type="text" name="loginID" onblur="checkUserid(this.value)" value="<jsp:getProperty name="reg" property="loginID"/>"/>
					<%=reg.getErrorMsg("errloginID")%>
					<div id="errloginid"></div></td>
				</tr>
				<tr>
					<td>显示昵称: </td><td>
					<input type="text" name="name" value="<jsp:getProperty name="reg" property="name"/>"/>
					<%=reg.getErrorMsg("errname")%></td>
				</tr>
				<tr>
					<td>密码: </td><td>
					<input type="password" name="password" value="<jsp:getProperty name="reg" property="password"/>"/>
					<%=reg.getErrorMsg("errpassword")%></td>
				</tr>
				<tr>
					<td>E-mail: </td><td>
					<input type="text" name="email" value="<jsp:getProperty name="reg" property="email"/>"/>
					<%=reg.getErrorMsg("erremail")%>
				</td>
				</tr>
				<tr><td colspan="2">
				<input type="submit" value="注册"/>
				<input type="reset" value="重置"/>
				</td></tr>
				</table>
			</form>
		</div>
        
	</body>
</html>


