<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*,java.util.*" errorPage=""%><%@page
	import="com.hyacinth.model.*"%><%@page
	import="com.hyacinth.factory.DAOFactory"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Hyacinth</title>
		<!--通用CSS-->
		<link href="main.css" rel="stylesheet" type="text/css" />
		<link type="text/css"
			href="css/smoothness/jquery-ui-1.8.12.custom.css" rel="stylesheet" />
		<!-- JQuery script-->
		<script type="text/javascript" src="js/jquery-1.5.1.min.js">
</script>
		<script type="text/javascript" src="js/jquery-ui-1.8.12.custom.min.js">
</script>
		<script type="text/javascript">
$(function() {
	// For navigation
	//$(".nav_main").buttonset();
	//$(".search_bar").buttonset();
	// For different division 分类页面
	$("#div_box").accordion( {
		header : "h3"
	});
	// Datepicker
	$('#datepicker').datepicker( {
		inline : true
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
					<form action="" method="get"
						style="margin-top: 1em; margin-left: 5px; opacity: .9;">
						<a href="index.jsp" id="nav_a1"
							class="ui-state-default ui-corner-all nav_link"> <span
							class="ui-icon ui-icon-newwin"></span>主页 </a>
						<a href="news.jsp" id="nav_a2"
							class="ui-state-default ui-corner-all nav_link"> <span
							class="ui-icon ui-icon-newwin"></span>新闻 </a>
						<a href="video.jsp" id="nav_a3"
							class="ui-state-default ui-corner-all nav_link"> <span
							class="ui-icon ui-icon-newwin"></span>影像 </a>
						<a href="entertainment.jsp" id="nav_a4"
							class="ui-state-default ui-corner-all nav_link"> <span
							class="ui-icon ui-icon-newwin"></span>娱乐 </a>
						<a href="#" id="nav_a5"
							class="ui-state-default ui-corner-all nav_link"> <span
							class="ui-icon ui-icon-newwin"></span>资料 </a>
						<a href="postCenter.jsp" id="nav_a5"
							class="ui-state-default ui-corner-all nav_link"> <span
							class="ui-icon ui-icon-newwin"></span>个人设置 </a>
					</form>
				</div>
				<!-- 搜索框 -->
				<div class="search_bar">
					<form action="/search" name="formsearch" id="searchform">
						<input id="search-input" style="position: relative"
							class="search-keyword" title="type &quot;a&quot;" />
						<button type="submit" name="formsubmit"
							class="search-submit png_bg"></button>
					</form>
				</div>

				<%
					System.out.println();
					System.out.println();
					System.out.println("==========ENTER Blog===========");

					User loginUser = null;
					User userTar = null;
					String uid = null;

					//GET current page URL
					String url = request.getScheme() + "://";
					url += request.getHeader("host");
					url += request.getRequestURI();
					if (request.getQueryString() != null)
						url += "?" + request.getQueryString();

					if (request.getParameter("uid") == null
							&& session.getAttribute("loginid") == null) {
						response.setHeader("refresh", "1;URL=index.jsp");
					} else {
						if (session.getAttribute("loginid") != null) {
							System.out.println("--> log by loginid");
							loginUser = DAOFactory.getUserDAOInstnace()
									.findUserByLoginId(
											session.getAttribute("loginid").toString());
							userTar = loginUser;
						}
						if (request.getParameter("uid") != null
								&& !request.getParameter("uid").isEmpty()) {
							System.out.println("--> log by uid");
							uid = request.getParameter("uid").toString();
							System.out.println("#uid :　" + request.getParameter("uid"));
							System.out.println(DAOFactory.getUserDAOInstnace()
									.findUserByUserId(uid));
							userTar = DAOFactory.getUserDAOInstnace().findUserByUserId(
									uid);
						}

						if (userTar == null) {
							response.setHeader("refresh", "1;URL=index.jsp");
							System.out.println("SELECT USER ERR");
						}

						System.out.println("$userTar : " + userTar);
						System.out
								.println("$userTar-Pic_url : " + userTar.getPic_url());
				%>

				<!-- 主要部分 -->
				<div class="z">
					<!-- 左边栏 -->
					<div class="z-left">

						<!-- 内容 -->
						<div class="viewbox" width="100%" float="left" overflow="hidden">
							<div class="title_box">
								<h2 id="titles">
									<a name="titles"><%=userTar.getName()%></a> のMicroBlog
								</h2>

								<!-- 多页内容使用 -->
								<div id="alist" class="alist"></div>
								<div id="upper_box"></div>
							</div>
						</div>


						<!-- 内容 -->
						<div class="scontent" id="bofqi">
							<p>
								文章
							</p>
						</div>
						<!-- 标签 -->
						<div class="tagcontainer">
							<b>Tag:</b>
							<span id="tag_doc"> <a href="#" class="tag"
								onclick="$DE('search-keyword').value=this.innerHTML;$DE('searchform').submit()">神弹幕OP</a>
								<a href="#" class="tag"
								onclick="$DE('search-keyword').value=this.innerHTML;$DE('searchform').submit()">捂脸</a>
							</span>
							<span id="newtag"> <a href="#"
								onclick="return addNewTag()">增加新TAG</a> </span>
						</div>

						<!-- 内容描述 -->
						<div class="intro"></div>



						<!-- 评论 -->
						<div class="comment_box">
							<!-- 评论内容 -->

						</div>
						<div class="repbox blueborder_box">
							<div class="repbox_inner">
								<%
									List<Resource> resList = DAOFactory.getResourceDAOInstance()
												.findResourceByUserId(userTar.getUserID());
										Iterator<Resource> resIt = resList.iterator();
										int f = 0;
										while (resIt.hasNext()) {
											f++;
											Resource res = resIt.next();
								%>

								<!-- 评论个体 -->
								<div class="reply">

									<!-- 评论左 -->
									<div class="replyleft">
										<div class="replycount">
											<%=f%>F
										</div>
										<div class="avatar">
											<div class="avatar_shadow">
												<img src="<%=userTar.getPic_url()%>" />
											</div>
										</div>
									</div>
									<!-- 评论右 -->
									<div class="replyright">
										<div class="replymeta">
											<ul class="actions">
												<li>
													<a
														href="copyresource.jsp?hostuid=<%=loginUser.getUserID()%>&resid=<%=res.getId()%>&returnurl=<%=url%>">转载</a>
													<a
														onclick="function(){
														document.getElementById("
														rep <%=f%>").style.display="visible";
													}">回复</a>
												</li>
											</ul>
											<a href="#"><%=userTar.getName()%></a> 发表于
											<%=res.getDate().getYear() + 1900%>年<%=res.getDate().getMonth()%>月<%=res.getDate().getDay()%>日

										</div>
										<div class="replycontent">
											<div class="replyinner">
												<p>
													<jsp:include page="<%=res.getUrl() %>" />
												</p>
											</div>
										</div>

									</div>
									<%
										List<Comment> comList = DAOFactory.getCommentDAOInstance()
														.findCommetnByResourceId(res.getId());
												if (comList != null) {
													Iterator<Comment> comIt = comList.iterator();
													int cf = 0;
													while (comIt.hasNext()) {
														cf++;
														Comment com = comIt.next();
									%>

									<!-- 评论 -->
									<div class="reply" id="com<%=cf%>" style="margin: 10px 0; visibility: none">

										<!-- 评论左 -->
										<div class="replyleft" style="margin-left: 30px">
											<div class="replycount">
												<%=cf%>.
											</div>
											<div class="avatar" style="visibility: none">
												<div class="avatar_shadow" style="width: 80px; height: 60px">
													<img src="<%=userTar.getPic_url()%>" />
												</div>
											</div>
										</div>
										<!-- 评论右 -->
										<div class="replyright">
											<div class="replymeta" style="visibility: none">

												<a href="#"><%=userTar.getName()%></a> 发表于
												<%=res.getDate().getYear() + 1900%>年<%=res.getDate().getMonth()%>月<%=res.getDate().getDay()%>日

											</div>
											<div class="replycontent">
												<div class="replyinner">
													<p>
														<%=com.getContent()%>
													</p>
												</div>
											</div>

										</div>
									</div>
									<%
										}
												}
									%>

									<!-- 回复框 -->
									<div class="reply" id="rep<%=f%>" style="visibility: none">
										<form action="addcomment.jsp" method="post">
											<input name="comment" type="text" />
											<input type="submit" />
										</form>
									</div>



								</div>
								<%
									}
									}
								%>

							</div>
						</div>

					</div>
					<!-- 右边栏 -->
					<div class="z-right">
						<!-- UP主信息 -->
						<div class="uinfo">
							<div class="u-face">
								<img src="<%=userTar.getPic_url()%>" />
							</div>
							<div class="r-info">
								<!-- 分割线 -->
								<div id="r-info-rank" class="r10000"></div>
								<div class="usname">
									<a href="blog.jsp?uid=<%=userTar.getUserID()%>" target="_blank"><%=userTar.getName()%></a>
								</div>
								<!-- 标志物 -->
								<div class="sign"></div>
								<!-- 功能性按钮 -->
								<div class="msggo">
									<%
										if (loginUser != null
												&& (loginUser.getUserID() != userTar.getUserID())) {
									%>
									<a
										href="addfriend.jsp?hostuid=<%=loginUser.getUserID()%>&taruid=<%=userTar.getUserID()%>&returnurl=<%=url%>">加为好友</a>
									<%
										}
									%>
								</div>

							</div>
						</div>


						<!-- 右方侧边栏新东西用 -->
						<div class="g-list">


							<div id="div_box">
								<div>
									<h3>
										<a href="#">我关注的</a>
									</h3>
									<div class="div_subbox">

										<%
											List<User> focus = DAOFactory.getFriendDaoInstnace()
													.findAllFriends(userTar.getUserID());
											Iterator<User> fit = focus.iterator();
											while (fit.hasNext()) {
												User foUser = fit.next();
										%>
										<div class="uinfo">
											<a href="blog.jsp?uid=<%=foUser.getUserID()%>">
												<div class="u-face"
													style="height: 60px; width: 60px; margin-left: 20px;">
													<img src="<%=foUser.getPic_url()%>" />
												</div>
												<div class="r-info">
													<!-- 分割线 -->
													<div id="r-info-rank" class="r10000"></div>
													<div class="usname">
														<a href="blog.jsp?uid=<%=foUser.getUserID()%>"
															target="_blank"><%=foUser.getName()%></a>
													</div>
													<!-- 标志物 -->
													<div class="sign"></div>
													<!-- 功能性按钮 -->
													<div class="msggo">
													</div>

												</div> </a>
										</div>
										<%
											}
										%>


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
					<li>
						<b>关于我们</b>
					</li>
					<li>
						<a href="/html/aboutUs.html">关于Hyacinth</a>
					</li>
					<li>
						<a href="/html/duty.html">资源免责申明</a>
					</li>
					<li>
						<a href="/html/contact.html">联系我们</a>
					</li>
				</ul>
				<ul>
					<li>
						<b>获取帮助</b>
					</li>
					<li>
						<a href="/html/help.html">全站使用说明</a>
					</li>
					<li>
						<a href="/html/faq.html">常见问题（FAQ）</a>
					</li>
					<li>
						<a href="http://9ch.co/f61,1.html">建议和BUG汇报</a>
					</li>
					<li>
						<a href="/video/av271/">弹幕测试</a>
					</li>
				</ul>
				<ul>
					<li>
						<b>其他</b>
					</li>
					<li>
						<a href="/plus/rss.php">RSS订阅</a>
					</li>
				</ul>
				<ul class="tongji" id="footerBottom">
					<li>
						<b>统计信息</b>
					</li>
					<li>
						全站内容数: 0
					</li>
					<li>
						全站评论数: 0
					</li>
					<li>
						全站浏览数: 0
					</li>
				</ul>
				<div class="powered">
					<!--[if IE 6]>为了达到最佳浏览效果,请使用 <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> <a href="http://www.operachina.com/" target="_blank">Opera</a> <a href="http://www.google.com/chrome/" target="_blank">Chrome</a> <a href="http://firefox.com.cn/" target="_blank">Firefox</a> <a href="http://windows.microsoft.com/ie9" target="_blank">IE9</a> 等浏览器.　消灭IE6　从你我开始<![endif]-->
					<br />
				</div>
			</div>

		</div>

	</body>
</html>