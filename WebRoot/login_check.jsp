<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.hyacinth.model.*,com.hyacinth.factory.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>login_check</title>
	</head>

	<body>
		<%
			String loginid = request.getParameter("loginid");
			String password = request.getParameter("password");
			try {
				User vuser = DAOFactory.getUserDAOInstnace().findUserByLoginId(
						loginid);
		%>
		<%=vuser.getPassword()%>
		<%
			if (!(loginid == null || "".equals(loginid) || password == null || ""
						.equals(password))) {
					if (vuser != null && vuser.getPassword().equals(password)) {
						// if it is a valid user
						response.setHeader("refresh", "2;URL=index.jsp");
						session.setAttribute("loginid", loginid);
						session.setAttribute("userid", vuser.getUserID());
						session.setAttribute("name", vuser.getName());
						session.setAttribute("password", password);
						session.setAttribute("credit", vuser.getCredit());
						session.setAttribute("security", vuser.getSecurity());
		%>
		<h3>
			用户登陆成功，两秒后跳转到主页！
		</h3>
		<h3>
			如果没有跳转，请按
			<a href="index.jsp">这里</a>！
		</h3>
		<%
			} else {
		%>
		<h3>
			登陆失败啦~ 错误的用户名或密码！
		</h3>
		<%
			}
				} else {
		%>
		<h3>
			登陆失败啦~ 用户名和密码都不能为空！
		</h3>
		<%
			}
				response.setHeader("refresh", "2;URL=index.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>