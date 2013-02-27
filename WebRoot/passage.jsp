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
				<span class="ui-icon ui-icon-newwin"></span>袁欣
				</a>
				<a href="#" id="nav_a3" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>菊花
				</a>
				<a href="#" id="nav_a4" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>又香
				</a>
				<a href="#" id="nav_a5" class="ui-state-default ui-corner-all nav_link">
				<span class="ui-icon ui-icon-newwin"></span>又甜
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
			<!-- 内容 -->
			<div class="viewbox" width="100%" float="left" overflow="hidden">
				<div class="title_box">
					<h2 id="titles">Test<a name="titles">Test</a></h2>
					<div class="tminfo">
						<a href="/video/bangumi.html">新番连载</a>
						>
						<a href="/video/bangumi-two-1.html">新番二次元</a>
						　收藏:
						<font id="stow_count" style="color: #60B7EF;">26</font>
						评分:
						<font id="v_ctimes" title="硬币数量" color="#F93">0</font>
					</div>
					<!-- 多页内容使用 -->
					<div id="alist" class="alist"></div>
					<div id="upper_box"></div>
				</div>
			</div>
			<!-- UP主信息 -->
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
			
			<!-- 内容 -->
			<div class="scontent" id="bofqi">
				<p>如果我是文章</p>
				<p>如果我是文章</p>
				<p>如果我是文章</p>
				<p>如果我是文章</p>
				<p>如果我是文章</p>
				<p>如果我是文章</p>
				<p>如果我是文章</p>
				<p>如果我是文章</p>
				<p>如果我是文章</p>
			</div>
			<!-- 标签 -->
			<div class="tagcontainer"><b>Tag:</b> 
				<span id="tag_doc">
				<a href="#" class="tag" onclick="$DE('search-keyword').value=this.innerHTML;$DE('searchform').submit()">神弹幕OP</a>
				<a href="#" class="tag" onclick="$DE('search-keyword').value=this.innerHTML;$DE('searchform').submit()">捂脸</a>
				</span>
				<span id="newtag">
					<a href="#" onclick="return addNewTag()">增加新TAG</a>
				</span>
			</div>
			
			<!-- 内容描述 -->
			<div class="intro">大佬神器千军破</div>
			
			<!-- 中间横幅 -->
			<div></div>
			
			
			<!-- 评论 -->
			<div class="comment_box">
				<!-- 评论内容 -->
				<div id="comm_content" class="commentbox">
					<div class="cm_ct_btn" id="cm_ct_btn">
					<img src="http://static.loli.my/images/morecomm.gif" border="0" onclick="loadcomm(85921);" style="cursor:pointer">
					</div>
				</div>
			</div>
			<div class="repbox blueborder_box">
				<div class="repbox_inner">
					
					<!-- 评论个体 -->
					<div class="reply">
					
						<!-- 评论左 -->
						<div class="replyleft">
							<div class="replycount">1</div>
							<div class="avatar">
								<div class="avatar_shadow">
								<img src="http://cdn13.mukkyu.com/upload/headimgs/FXmSoIQaOgKC_s.jpg">
								</div>
							</div>
						</div>
						<!-- 评论右 -->
						<div class="replyright">
							<div class="replymeta">
								<ul class="actions">
									<li><a href="http://0rz.co/discutter/blogreply/edit/426579/340608.htm">编辑</a></li>
									<li><a href="http://0rz.co/discutter/blogreply/quote/426579/340608.htm">引用</a></li>
								</ul>
								<a href="http://0rz.co/discutter/11692.htm">梦幻弧光</a> 
								表于 2010年07月01日 18:37:59
							</div>
							<div class="replycontent">
								<div class="replyinner">
								<p>好Q烦啊</p>
								</div>
							</div>
							
						</div>
					</div>
					<!-- 评论个体 -->
					<div class="reply">
					
						<!-- 评论左 -->
						<div class="replyleft">
							<div class="replycount">1</div>
							<div class="avatar">
								<div class="avatar_shadow">
								<img src="http://cdn13.mukkyu.com/upload/headimgs/FXmSoIQaOgKC_s.jpg">
								</div>
							</div>
						</div>
						<!-- 评论右 -->
						<div class="replyright">
							<div class="replymeta">
								<ul class="actions">
									<li><a href="http://0rz.co/discutter/blogreply/edit/426579/340608.htm">编辑</a></li>
									<li><a href="http://0rz.co/discutter/blogreply/quote/426579/340608.htm">引用</a></li>
								</ul>
								<a href="http://0rz.co/discutter/11692.htm">梦幻弧光</a> 
								表于 2010年07月01日 18:37:59
							</div>
							<div class="replycontent">
								<div class="replyinner">
								<p>好Q烦啊</p>
								</div>
							</div>
							
						</div>
					</div>
					<!-- 评论个体 -->
					<div class="reply">
					
						<!-- 评论左 -->
						<div class="replyleft">
							<div class="replycount">1</div>
							<div class="avatar">
								<div class="avatar_shadow">
								<img src="http://cdn13.mukkyu.com/upload/headimgs/FXmSoIQaOgKC_s.jpg">
								</div>
							</div>
						</div>
						<!-- 评论右 -->
						<div class="replyright">
							<div class="replymeta">
								<ul class="actions">
									<li><a href="http://0rz.co/discutter/blogreply/edit/426579/340608.htm">编辑</a></li>
									<li><a href="http://0rz.co/discutter/blogreply/quote/426579/340608.htm">引用</a></li>
								</ul>
								<a href="http://0rz.co/discutter/11692.htm">梦幻弧光</a> 
								表于 2010年07月01日 18:37:59
							</div>
							<div class="replycontent">
								<div class="replyinner">
								<p>好Q烦啊</p>
								</div>
							</div>
							
						</div>
					</div>
					
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