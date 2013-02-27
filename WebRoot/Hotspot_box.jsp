<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*,java.util.*" errorPage=""%>
<%@page import="com.hyacinth.model.*"%>
<%@page import="com.hyacinth.factory.DAOFactory"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>æ»å¨æ </title>
		<script type="text/javascript" src="common/jquery-1.2.6.min.js">
</script>
		<link type="text/css" rel="stylesheet" href="common/common.css" />
		<script src="common/jcarousellite.min.js" type="text/javascript">
</script>
		<style type="text/css">
#scroll {
	margin: 0 auto;
	width: 700px;
	height: 110px;
	background: #F3F3F3;
	border: #E3E3E3 1px solid;
	padding: 5px;
}

#prev {
	width: 15px;
	height: 72px;
	float: left;
	text-indent: -5000px;
	background: url(images/prev.jpg) no-repeat;
	cursor: pointer;
	margin-top: 10px;
}

#next {
	width: 15px;
	height: 72px;
	float: right;
	text-indent: -5000px;
	background: url(images/next.jpg) no-repeat;
	cursor: pointer;
	margin-top: 10px;
}

#box {
	width: 700px;
	float: left;
	display: block;
	overflow: hidden;
	margin-left: 5px;
}

#box ul li {
	width: 110px;
	float: left;
	text-align: center;
}

#box ul li a {
	display: block;
	color: #666;
	padding: 5px 0;
}

#box ul li a:hover {
	background: #d1d1d1;
	color: #000;
}

#box ul li a img {
	width: 100px;
	height: 80px;
	margin-bottom: 5px;
}

#boxImg {
	width: 680px;
	float: left;
	display: block;
	overflow: hidden;
	margin-left: 5px;
}

#boxImg ul li {
	width: 110px;
	float: left;
	text-align: center;
}

#boxImg ul li a {
	display: block;
	color: #666;
	padding: 5px 0;
}

#boxImg ul li a img {
	width: 400px;
	height: 300px;
	margin-bottom: 5px;
}
</style>
		<script type="text/javascript">
$(document)
		.ready(
				function() {
					$("#box").jCarouselLite( {
						btnPrev : "#prev",
						btnNext : "#next",
						auto : 20000,
						scroll : 3,
						speed : 1000, //
						vertical : false,//
						visible : 6, //
						circular : true
							});
					$("#boxImg ul li:not(:first)").hide();
					$("#box ul li")
							.each(
									function(i) {
										$(this)
												.click(
														function() {
															$("#boxImg ul li")
																	.hide();
															$(
																	$("#boxImg ul li")[i
																			% ($("#box ul li").length / 3)])
																	.fadeIn(
																			"slow");
														})
									})
				});
</script>
	</head>
	<body>
		<div id="scroll">
			<span id="prev">Pre</span>
			<div id="box">
				<ul>
					<li><a href="#"><img src="images/3.jpg"/>我在測試</a></li>
					<li><a href="#"><img src="images/4.jpg"/>我在測試</a></li>
		            <li><a href="#"><img src="images/5.jpg"/>我在測試</a></li>
					<%
						List<User> focus = DAOFactory.getUserDAOInstnace().findAll("");
						Iterator<User> fit = focus.iterator();
						int count = 8;
						while (fit.hasNext() && count > 0) {
							count--;
							User foUser = fit.next();
					%>
					<li>
						<a href="blog.jsp?uid=<%=foUser.getUserID()%>" style=" padding:4px 3px 0 3px"><img src="<%= foUser.getPic_url()%>" /><%= foUser.getName()%></a>
					</li>
					<%
						}
					%>

				</ul>
			</div>
			<span id="next">Next</span>
		</div>



	</body>
</html>