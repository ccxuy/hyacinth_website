<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hyacinth.model.*,com.hyacinth.factory.*"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>addfriend page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<%
				boolean addFriend = false;
			if (request.getParameter("hostuid") != null
					&& request.getParameter("taruid") != null) {
				String hostuid = request.getParameter("hostuid").toString();
				String taruid = request.getParameter("taruid").toString();

				if (!hostuid.equals(taruid)) {
					addFriend = DAOFactory.getFriendDaoInstnace()
							.addFriendByUID(hostuid, taruid);
				}
				User hostUser = DAOFactory.getUserDAOInstnace()
						.findUserByUserId(hostuid);
				User tarUser = DAOFactory.getUserDAOInstnace()
						.findUserByUserId(taruid);

				if (request.getParameter("returnurl") != null) {
					response.setHeader("refresh", "2;URL="
							+ request.getParameter("returnurl").toString());
				}
				System.out.println("addFriend :"+(addFriend));
				if (addFriend == true) {
		%>
		<h3>
			成功将
			<%=tarUser.getName()%>
			加为
			<%=hostUser.getName()%>
			的好友


			<%
			} else {
		%>
			乃们已经是好友~
			<%
			}
			} else {
				response.setHeader("refresh", "2;URL=index.jsp");
			}
		%>
		
	</body>
</html>





