<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hyacinth.model.*, com.hyacinth.factory.*"%>
<%@ page import="java.text.*"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Register page</title>
    
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
  	System.out.println("        ========REGISTER=========");
  	
	User user = new User();
	user.setGenerateNewUserID();
	user.setLoginID(request.getParameter("loginID")) ;
	user.setName(request.getParameter("name")) ;
	user.setPassword(request.getParameter("password")) ;
	user.setEmail(request.getParameter("email")) ;
	user.setGenerateNewRegdate();
try{
	if(DAOFactory.getUserDAOInstnace().addUser(user)){
%>
    <h3>欢迎 <%= user.getName() %>入住Hyacinth~~ 请<a href="index.jsp">登陆</a></h3>
<%
	} else {
%>
    <h3>哎呀,注册失败啦~注册信息错误啦~! 请<a href="index.jsp">返回</h3>
<%
	}
%>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
    
  </body>
</html>





