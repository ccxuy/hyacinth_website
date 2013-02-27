<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hyacinth</title>
<!--通用CSS-->
<link href="main.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />	
<!-- JQuery script-->
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.12.custom.min.js"></script>
<script type="text/javascript">
	$(function(){
		// For navigation
		//$(".nav_main").buttonset();
		//$(".search_bar").buttonset();
		// For different division 分类页面
		$("#div_box").accordion({ header: "h3" });
		// Datepicker
		$('#datepicker').datepicker({
			inline: true
		});
	});
</script>



</head>

<body>
<div class="wapper">
	<div class="main">
		<!-- sellm 公告栏在线人数 -->
        <div class="mini-info"></div>
		<div class="mini-top-info"></div>
		<!-- 内嵌头部LOGO -->
		<div id="header_bg"></div>
		<!-- 导航栏 偏移出图像空白 -->
		<div class="nav_main">
			<form action="" method="get" style="margin-top: 1em; margin-left:5px; opacity:.9;">
				<a href="#" id="nav_a1" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>主页
				</a>
				<a href="#" id="nav_a2" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>新闻
				</a>
				<a href="#" id="nav_a3" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>影像
				</a>
				<a href="#" id="nav_a4" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>娱乐
				</a>
				<a href="#" id="nav_a5" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>资料
				</a>
			</form>
		</div>
		<!-- 搜索框 -->
		<div class="search_bar">
			<form action="/search" name="formsearch" id="searchform">
				<input id="search-input" style=" position: relative" class="search-keyword" title="type &quot;a&quot;" />
				<button type="submit" name="formsubmit" class="search-submit png_bg"></button>
			</form>
		</div>
		
		<!-- 主要部分 -->
		<div class="z">
			<!-- 左边栏 -->
			<div class="z-left">
				<!-- 主页推荐 -->
				<div class="box" id="hotspot_box">
					<div class="po">
						<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
					</div>
					<div class="po">
						<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
					</div>
					<div class="po">
						<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
					</div>
					<div class="po">
						<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
					</div>
					<div class="po">
						<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
					</div>
					
				</div>
				
				
				<!-- 中间横幅 -->
				<div id="mid_box">
<!--					<iframe src="Hotspot_box.html" width="720" scrolling="no" style="border:hidden"><jsp:include page="Hotspot_box.html" flush="true" /></iframe>-->
				</div>
				<!-- 分类内容 -->
				<div id="div_box">
					<div>
						<h3><a href="#">热门推荐</a></h3>
						<div class="div_subbox">
							<div class="po">
								<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
							</div>
							<div class="po">
								<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
							</div>
							<div class="po">
								<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
							</div>
							<div class="po">
								<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
							</div>
							<div class="po">
								<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
							</div>
							<div class="po">
								<a href="#"><img src="images/test120X90.jpg"/>啦啦啦啦啦啦</a>
							</div>
						</div>
					</div>
					<div>
						<h3><a href="#">新闻</a></h3>
						<div>more other thing else</div>
					</div>
					<div>
						<h3><a href="#">影像</a></h3>
						<div>more other thing else</div>
					</div>
					<div>
						<h3><a href="#">音乐</a></h3>
						<div>more other thing else</div>
					</div>
					<div>
						<h3><a href="#">动漫</a></h3>
						<div>more other thing else</div>
					</div>
					<div>
						<h3><a href="#">游戏</a></h3>
						<div>more other thing else</div>
					</div>
					<div>
						<h3><a href="#">资料</a></h3>
						<div>more other thing else</div>
					</div>
				</div>
				<!-- 下方横幅 -->
				<div id="bot_box">
				下方横幅
				</div>
			</div>
			
			<!-- 右边栏 -->
			<div class="z-right">
				<div id="login_box">
				<!--我是登陆框-->
				<%	// 如果已经设置过了session属性，则肯定不为空
					if(session.getAttribute("userid")!=null){
				%>
					<h3>欢迎<%=session.getAttribute("userid")%>!</h3>
					<a href="logout.jsp">注销</a></h3>
				<%
					} else {	// 没有session，则应该给出提示，先去登陆
				%>
					<jsp:include page="/login.jsp" flush="true" />
				<%
					}
				%>
				
				</div>
				<div id="datepicker"></div>
				<!-- 右方侧边栏新东西用 -->
				<div class="g-list">
				我是新番栏
				</div>
			</div>
		</div>
		
		
	</div>
	<!-- 页脚 -->
	<div class="footer">
		<ul>
			<li><b>关于我们</b></li>
			<li><a href="/html/aboutUs.html">关于Hyacinth</a></li>
			<li><a href="/html/duty.html">资源免责申明</a></li>
			<li><a href="/html/contact.html">联系我们</a></li>
		</ul>
		<ul>
			<li><b>获取帮助</b></li>
			<li><a href="/html/help.html">全站使用说明</a></li>
			<li><a href="/html/faq.html">常见问题（FAQ）</a></li>
			<li><a href="http://9ch.co/f61,1.html">建议和BUG汇报</a></li>
			<li><a href="/video/av271/">弹幕测试</a></li>
		</ul>
		<ul> <li><b>其他</b></li>
			<li><a href="/plus/rss.php">RSS订阅</a></li>
		</ul>
		<ul class="tongji" id="footerBottom">
			<li><b>统计信息</b></li>
			<li>全站内容数: 0</li><li>全站评论数: 0</li><li>全站浏览数: 0</li>
		</ul>
			<div class="powered"><!--[if IE 6]>为了达到最佳浏览效果,请使用 <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> <a href="http://www.operachina.com/" target="_blank">Opera</a> <a href="http://www.google.com/chrome/" target="_blank">Chrome</a> <a href="http://firefox.com.cn/" target="_blank">Firefox</a> <a href="http://windows.microsoft.com/ie9" target="_blank">IE9</a> 等浏览器.　消灭IE6　从你我开始<![endif]--><br/>
			</div>
	</div>
	
</div>
	
</body>
</html>