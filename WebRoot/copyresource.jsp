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

		<title>copy page</title>

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
				System.out.println();
				System.out.println();
				System.out.println();
				System.out.println("      ==========COPY RESOURCE=======");
				boolean copy = true;
				User hostUser = null;
				Resource res = null;
				//judge right input parameter
			if (request.getParameter("hostuid") != null
					&& request.getParameter("resid") != null) {
				String hostuid = request.getParameter("hostuid").toString();
				String resid = request.getParameter("resid").toString();

				System.out.println("hostuid = "+hostuid);
				System.out.println("resid = "+resid);
				//get user and resource
				hostUser = DAOFactory.getUserDAOInstnace().findUserByUserId(hostuid);
				res = DAOFactory.getResourceDAOInstance().findResourceByResourceId(resid);
				res.setNewId();
				res.setUserid(hostUser.getUserID());
				DAOFactory.getResourceDAOInstance().addResource(res);

				if (request.getParameter("returnurl") != null) {
					response.setHeader("refresh", "2;URL="
							+ request.getParameter("returnurl").toString());
				}
				System.out.println("copu : "+(copy));
				if (copy == true) {
		%>
		<h3>
			成功转载
			<%=res.getTitle()%>
			

			<%
			} else {
		%>
			转载不成功
			<%
			}
			} else {
				response.setHeader("refresh", "2;URL=index.jsp");
			}
		%>
		
	</body>
</html>





