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

	// Button
	$("#button").button();
	$("#but_set").buttonset();
	$(".but_set").buttonset();


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
		<div>
				<div>
				<%= session.getAttribute("name")%>,泥嚎!
				</div>
						<!-- Button -->
							<div id="but_set" style="white-space: nowrap;">
								<a href="postCenter.jsp" id="reg_link"
									class="ui-state-default ui-corner-all login_link"> <span
									class="ui-icon ui-icon-newwin"></span> 发布中心 </a>
								<a href="./logout.jsp" id="log_link"
									class="ui-state-default ui-corner-all login_link"> <span
									class="ui-icon ui-icon-check"></span> 退出登陆 </a>
							</div>
						
		</div>



	</body>
</html>


