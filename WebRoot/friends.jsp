<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hyacinth</title>
<!--通用CSS-->
<link href="main.css" rel="stylesheet" type="text/css" />
<link href="css/main_post.css" rel="stylesheet" type="text/css" />
<!--Jquery CSS-->
<link type="text/css" href="css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />	
<link rel="stylesheet" type="/text/css" href="css/jquery.wysiwyg.css" />

<style type="text/css">
.main .z .friendlist{
	width:525px;
	position:relative;
	float:right;
}

</style>




<!-- JQuery script-->
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.12.custom.min.js"></script>


<script type="text/javascript">
	$(function(){
		// For navigation
		//$(".nav_main").buttonset();
		//$(".search_bar").buttonset();
		// For different division 分类页面
		$("#text_submit").button();
	
		
		$("#div_box").accordion({ header: "h3" });
		// Datepicker
		$('#datepicker').datepicker({
			inline: true
		});
	});
	
	

	$(document).ready(function(){
	$('#markItUp').markItUp(mySettings);//mark it up
	});
	
	$("ul.menu_body li:even").addClass("alt");
    $('img.menu_head').click(function () {
	$('ul.menu_body').slideToggle('medium');
    });
	$('ul.menu_body li a').mouseover(function () {
	$(this).animate({ fontSize: "14px", paddingLeft: "20px" }, 50 );
    });
	$('ul.menu_body li a').mouseout(function () {
	$(this).animate({ fontSize: "12px", paddingLeft: "10px" }, 50 );
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
		<div id="header_bg"></div>		<!-- 导航栏 偏移出图像空白 -->

		<div class="nav_main">
			<form action="" method="get" style="margin-top: 1em; margin-left:5px; opacity:.9;">
				<a href="index.jsp" id="nav_a1" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>主页
				</a>
				<a href="news.jsp" id="nav_a2" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>新闻
				</a>
				<a href="video.jsp" id="nav_a3" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>影像
				</a>
				<a href="entertainment.jsp" id="nav_a4" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>娱乐
				</a>
				<a href="#" id="nav_a5" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>资料
				</a>
			</form>
		</div>	
      
      <!-- 搜索框  -->
      
	<div class="search_bar">
			<form action="/search" name="formsearch" id="searchform">
				<input id="search-input" style=" position: relative" class="search-keyword" title="type &quot;a&quot;" />
				<button type="submit" name="formsubmit" class="search-submit png_bg"></button>
			</form>
	</div>
	  <!-- UP主信息 -->
	<div class="z">
		<div class="uinfo">
			<div class="u-face"><img src="http://i1.loli.my/userup/67188/myface.jpg"></div>
				<div class="r-info">
					<!-- 分割线 -->
					<div id="r-info-rank" class="r10000"></div>
					<div class="usname"><a href="/member/index.php?mid=67188" target="_blank">爱吃肉の水水</a></div>
					<!-- 标志物 -->
					<div class="sign"></div>
					<!-- 功能性按钮 -->
					<div class="msggo"><a href="/member/pm.php?dopost=send&amp;uid=爱吃肉の水水">加为好友</a></div>				
				</div>
			</div>
		<!--Friend List-->
		<div class="friendlist">
		</div>	
			
		<!--左导航栏-->
	    <div id="left_navigator" style="padding:0">
			<ul class="menu_body"> 
    		<li onmouseover="this.style.backgroundColor='#95DDFF'" onmouseout="this.style.backgroundColor='#FFF'"><a href="myPage.jsp" > My Mainpage</a></li>
    		<li onmouseover="this.style.backgroundColor='#95DDFF'" onmouseout="this.style.backgroundColor='#FFF'"><a href="postCenter.jsp"> Post Center</a></li>  
    		<li onmouseover="this.style.backgroundColor='#95DDFF'" onmouseout="this.style.backgroundColor='#FFF'" style="background-image:	url(img/correct.jpg)"><a href="friends.jsp"> Friends</a></li> 
        	<li onmouseover="this.style.backgroundColor='#95DDFF'" onmouseout="this.style.backgroundColor='#FFF'"><a href="Otherthings.jsp"> Otherthings</a></li>
      	 </ul>
        </div>
		
	</div><!-- end OF Z -->
	</div> <!--end OF MAIN -->
	
      
   		
	
	
     
		
	
        
		
		
</div>
	<!-- 页脚 -->
	<div id="footer">
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
	
</div>
	
</body>
</html>