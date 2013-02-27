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
			Resource res = new Resource();
			User loginUser = DAOFactory.getUserDAOInstnace().findUserByLoginId(session.getAttribute("loginid").toString());
		%>
		<%
			SmartUpload smart = new SmartUpload();
			smart.initialize(pageContext); // 初始化上传操作
			smart.upload(); 
			String title = smart.getRequest().getParameter("passage_titile");
			String ext = smart.getFiles().getFile(0).getFileExt(); // 扩展名称
			String fileName = UUID.randomUUID().toString() + "." + ext;
			smart.getFiles()
					.getFile(0)
					.saveAs(this.getServletContext().getRealPath("/")
							+ "upload" + java.io.File.separator + fileName);

			String content = smart.getRequest().getParameter("passage_content");

			
			
			String htmlName = UUID.randomUUID().toString() + "." + "html";
			IOTest io = new IOTest();
			io.WriteResource(content.toString() , this.getServletContext()
					.getRealPath("/")
					+ "upload"
					+ java.io.File.separator
					+ htmlName);
			res.setUrl("upload/"+htmlName);
			res.setUserid(loginUser.getUserID());
			res.setNewId();
			res.setPicUrl("upload/" + fileName);
			res.setDateNow();
			res.setTitle(title);
			
			
			boolean a=	DAOFactory.getResourceDAOInstance().addResource(res);
		%>
		<%=a %>
		<%=smart.getFiles().getFile(0).getFileName()
					.matches("^\\w+.(jpg|gif)$")%>

		<div>
			预览
			<a href="postCenter.jsp">返回</a>
		</div>
		<div>
			<h2>
				标题:
				<%=title%></h2>
			<img src="upload/<%=fileName%>" />
			<h3>
				内容:
				<%=content%></h3>
		</div>
	</body>
</html>