<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Login</title>
		<%
			request.setCharacterEncoding("utf-8");
		%>
		<jsp:useBean id="reg" scope="request"
			class="com.hyacinth.UserRegister" />
		<link type="text/css"
			href="css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />
		<link href="main.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.5.1.min.js">
</script>
		<script type="text/javascript" src="js/jquery-ui-1.8.12.custom.min.js">
</script>
		<script type="text/javascript">
$(function() {
	//Autocomplete
	$("#login_un").autocomplete( {
		source : [ "yuanxin", "andrew", "sam" ]
	});

	// Button
	$("#button").button();
	$("#login_but_set").buttonset();
	$(".but_set").buttonset();

	// Login Dialog			
	$('#log_dia').dialog( {
		autoOpen : false,
		width : 600,
		buttons : {
			"Ok" : function() {
				$(this).dialog("close");
			}
		}
	});
	// Registe Dialog			
	$('#reg_dia').dialog( {
		modal : true,
		autoOpen : false,
		width : 600,
		buttons : {
			"以后再注册" : function() {
				$(this).dialog("close");
			}
		}
	});

	// Dialog Link
	$('#reg_link').click(function() {
		$('#reg_dia').dialog('open');
		return false;
	});
	$('#log_link').click(function() {
		$('#log_dia').dialog('open');
		return false;
	});

	//hover states on the static widgets
	$('#log_link').hover(function() {
		$(this).addClass('ui-state-hover');
	}, function() {
		$(this).removeClass('ui-state-hover');
	});

});
</script>
<script language="JavaScript" src="js/ajax.js" type="text/javascript"></script>




<style type="text/css">
/*demo page css*/ /*body{ margin:0 auto;}*/
.login_link {
	padding: 0em 1em 0em 20px;
	text-decoration: none;
	position: relative;
}

.login_link span.ui-icon {
	margin: 0 5px 0 0;
	position: absolute;
	left: .2em;
	top: 50%;
	margin-top: -8px;
}
</style>
	</head>
	<body>
		<!--		if user have login in-->
		

		<!--		if user have NOT login in-->
		<!-- Login -->
		<div>
			
						<!-- Button -->
						
							<div id="login_but_set" style="white-space: nowrap;">
								<a href="#" id="reg_link"
									class="ui-state-default ui-corner-all login_link"> <span
									class="ui-icon ui-icon-newwin"></span> 入住Hyacinth </a>
								<a href="#" id="log_link"
									class="ui-state-default ui-corner-all login_link" onclick="login()" /> <span
									class="ui-icon ui-icon-check"></span> 登陆 </a>
							</div>
						
		</div>



		<!-- 背景覆盖 -->
		<div id="bgCover"></div>
		<!-- Login dialog -->
		<div id="log_dia" title="Welcome back!">
			<form name="loginForm" method="post" action="login_check.jsp" style="margin-top: 1em; word-break: keep-all;">
			<table style="border: none; margin: 0 auto;">
				<tr>
					<td>
						ID
					</td>
					<td>
						<input id="login_un" name="loginid" style="z-index: 10; position: relative"
							title="type &quot;a&quot;" />
					</td>
				</tr>
				<tr>
					<td>
						Password
					</td>
					<td>
						<input id="login_pw" name="password" type="password"
							style="z-index: 10; position: relative"
							title="type &quot;a&quot;" />
					</td>
				</tr>
				<tr><td colspan="2">
				<div class="but_set">
				<input type="submit" value="登陆"/>
				</div>
				</td></tr>
			</table>
			</form>
		</div>
		<!-- Register dialog -->
		<div id="reg_dia" title="Register">
			<div id="reg_info"></div>
			<form name="loginForm" action="register.jsp" method="post">
				<table style="border: none; margin: 0 auto;">
					<tr>
						<td>
							登陆ID:
						</td>
						<td>
							<input type="text" name="loginID"
								value="<jsp:getProperty name="reg" property="loginID"/>" /><%=reg.getErrorMsg("errloginID")%></td>
					</tr>
					<tr>
						<td>
							显示昵称:
						</td>
						<td>
							<input type="text" name="name"
								value="<jsp:getProperty name="reg" property="name"/>" /><%=reg.getErrorMsg("errname")%></td>
					</tr>
					<tr>
						<td>
							密码:
						</td>
						<td>
							<input type="password" name="password"
								value="<jsp:getProperty name="reg" property="password"/>" /><%=reg.getErrorMsg("errpassword")%></td>
					</tr>
					<tr>
						<td>
							E-mail:
						</td>
						<td>
							<input type="text" name="email"
								value="<jsp:getProperty name="reg" property="email"/>" /><%=reg.getErrorMsg("erremail")%></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="but_set">
							<input type="submit" id="reg_button1" value="注册" >
							<input type="reset" id="reg_button2" value="重置" />
							</div>
							<!-- registering button-->
						</td>
					</tr>
				</table>
			</form>
		</div>

	</body>
</html>


