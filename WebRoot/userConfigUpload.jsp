<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.hyacinth.model.*,com.hyacinth.factory.*"%>
<%@ page import="static java.util.UUID.randomUUID"%>
<%@ page import="org.lxh.smart.*"%><%@page import="java.util.UUID"%><%@page import="java.net.MalformedURLException"%>


<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>check_upload</title>
	</head>

	<body>
		<%=session.getAttribute("loginid") %>
		<%
			User loginUser = DAOFactory.getUserDAOInstnace().findUserByLoginId(session.getAttribute("loginid").toString());
		%>
		<%
			SmartUpload smart = new SmartUpload();
			smart.initialize(pageContext); // 初始化上传操作
			smart.upload(); 
			String name = smart.getRequest().getParameter("userName");
			String ext = smart.getFiles().getFile(0).getFileExt();
			String fileName = UUID.randomUUID().toString() + "." + ext;
			smart.getFiles()
					.getFile(0)
					.saveAs(this.getServletContext().getRealPath("/")
							+ "upload" + java.io.File.separator + fileName);
			
			
			loginUser.setPic_url("upload/" + fileName);
			if(name!=null){
				loginUser.setName(name);
			}
			
			
			boolean a =	DAOFactory.getUserDAOInstnace().updateUserInfoByUID(loginUser);
		%>
		Update:<%=a %>
		<%=smart.getFiles().getFile(0).getFileName()
					.matches("^\\w+.(jpg|gif)$")%>

		<div>
			预览
			<a href="postCenter.jsp">返回</a>
		</div>
		<div>
			<h2>
				用户昵称:
				<%=name%></h2>
			<img src="upload/<%=fileName%>" />
			
		</div>
	</body>
</html>