package com.hyacinth;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.* ;
import javax.servlet.* ;
import javax.servlet.http.* ;

public class CheckUser extends HttpServlet {

	public static final String DBDRIVER = "org.gjt.mm.mysql.Driver" ;
 	public static final String DBURL = "jdbc:mysql://localhost/" ;
	public static final String DBUSER = "root" ;
	public static final String DBPASS = "admin" ;
	
	
	/**
	 * Constructor of the object.
	 */
	public CheckUser() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	@Override
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request,response) ;
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8") ;
		response.setContentType("text/html") ;
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		PrintWriter out = response.getWriter() ;
		String userid = request.getParameter("userid") ;
		try{
			Class.forName(DBDRIVER) ;
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;
			String sql = "SELECT COUNT(userid) FROM user WHERE userid=?" ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1,userid) ;
			rs = pstmt.executeQuery() ;
			if(rs.next()){
				if(rs.getInt(1)>0){	// 用户ID已经存在了
					out.print("true") ;
				} else {
					out.print("false") ;
				}
			}
		}catch(Exception e){
			e.printStackTrace() ;
		}finally{
			try{
				conn.close() ;
			}catch(Exception e){}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	@Override
	public void init() throws ServletException {
		// Put your code here
	}

}
