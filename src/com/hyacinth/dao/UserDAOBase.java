package com.hyacinth.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import com.hyacinth.model.User;

/**
 * @author Andrew
 * Use for operate users in database
 */
public class UserDAOBase implements UserDAO{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	public UserDAOBase(Connection conn){
		this.conn = conn;
	}
	
	
	@SuppressWarnings("deprecation")
	public boolean addUser(User user) throws SQLException {
		boolean flag = false;
		String sql = "INSERT INTO user(USER_ID,USER_LOGIN_ID,USER_NAME,USER_PASSWORD,USER_EMAIL,user_credit,user_security,USER_REGISTER_DATE,url,pic_url) VALUES (?,?,?,?,?,?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, user.getUserID());
		this.pstmt.setString(2, user.getLoginID());
		this.pstmt.setString(3, user.getName());
		this.pstmt.setString(4, user.getPassword());
		this.pstmt.setString(5, user.getEmail());
		this.pstmt.setString(6, user.getCredit());
		this.pstmt.setInt(7, user.getSecurity());
		this.pstmt.setDate(8, user.getRegdate());
		System.out.println("user.getRegdate() = "+user.getRegdate());
		if(user.getUrl()!=null){
			this.pstmt.setString(9, user.getUrl());
		}else{
			this.pstmt.setString(9, "images/default_user.jpg");
		}
		if(user.getPic_url()!=null){
			this.pstmt.setString(10, user.getPic_url());
		}else{
			this.pstmt.setString(10, "images/default_headPic.jpg");
		}
		//如果存在更新
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		this.pstmt.close();
		System.out.println("ADD User :　"+flag);
		return flag;
	}
	public boolean deleteUser(User user) throws SQLException {
		boolean flag = false;
		String sql = "DELETE FROM user WHERE user_id = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, user.getUserID());
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		this.pstmt.close();		
		System.out.println("DELETE User :　"+flag);
		return flag;
	}
	public List<User> findAll(String keyWord) throws Exception{
		List<User> all = new ArrayList<User>() ;
		String sql = "SELECT * FROM user WHERE user_name LIKE ? OR user_login_id LIKE ?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,"%"+keyWord+"%") ;
		this.pstmt.setString(2,"%"+keyWord+"%") ;
		ResultSet rs = this.pstmt.executeQuery() ;
		User user = null ;
		while(rs.next()){
			user = new User() ;
			user.setUserID(rs.getString("user_id")) ;
			user.setLoginID(rs.getString("user_login_id")) ;
			user.setName(rs.getString("user_name")) ;
			user.setPassword(rs.getString("user_password")) ;
			user.setEmail(rs.getString("user_email")) ;
			user.setQqnum(rs.getString("user_qq_num"));
			user.setCredit(rs.getString("user_credit"));
			user.setSecurity(rs.getInt("user_security"));
			user.setRegdate(rs.getDate("user_register_date")) ;
			user.setUrl(rs.getString("url"));
			user.setPic_url(rs.getString("pic_url"));
			all.add(user) ;
		}
		this.pstmt.close() ;
		return all ;
	}
	public List<User> findAll() throws Exception{
		List<User> all = new ArrayList<User>() ;
		String sql = "SELECT * FROM user" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		User user = null ;
		while(rs.next()){
			user = new User() ;
			user.setUserID(rs.getString("user_id")) ;
			user.setLoginID(rs.getString("user_login_id")) ;
			user.setName(rs.getString("user_name")) ;
			user.setPassword(rs.getString("user_password")) ;
			user.setEmail(rs.getString("user_email")) ;
			user.setQqnum(rs.getString("user_qq_num"));
			user.setCredit(rs.getString("user_credit"));
			user.setSecurity(rs.getInt("user_security"));
			user.setRegdate(rs.getDate("user_register_date")) ;
			user.setUrl(rs.getString("url"));
			user.setPic_url(rs.getString("pic_url"));
			all.add(user) ;
		}
		this.pstmt.close() ;
		return all ;
	}
	
	public User findUserByUserId(String userid) throws Exception {
		// TODO Auto-generated method stub
		User user = null ;
		String sql = "SELECT * FROM user WHERE user_id=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,userid) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			user = new User() ;
			user.setUserID(rs.getString("user_id")) ;
			user.setLoginID(rs.getString("user_login_id")) ;
			user.setName(rs.getString("user_name")) ;
			user.setPassword(rs.getString("user_password")) ;
			user.setEmail(rs.getString("user_email")) ;
			user.setQqnum(rs.getString("user_qq_num"));
			user.setCredit(rs.getString("user_credit"));
			user.setSecurity(rs.getInt("user_security"));
			user.setRegdate(rs.getDate("user_register_date")) ;
			user.setUrl(rs.getString("url"));
			user.setPic_url(rs.getString("pic_url"));
		}
		this.pstmt.close() ;
		return user ;
	}
	public User findUserByLoginId(String loginid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("--------$ FindUserByLoginId $----");
		System.out.println("LoginId  = " + loginid);
		User user = null ;
		String sql = "SELECT * FROM user WHERE user_login_id=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,loginid) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			System.out.println("setting User !!");
			user = new User() ;
			user.setUserID(rs.getString("user_id")) ;
			user.setLoginID(rs.getString("user_login_id")) ;
			user.setName(rs.getString("user_name")) ;
			user.setPassword(rs.getString("user_password")) ;
			user.setEmail(rs.getString("user_email")) ;
			user.setQqnum(rs.getString("user_qq_num"));
			user.setCredit(rs.getString("user_credit"));
			user.setSecurity(rs.getInt("user_security"));
			user.setRegdate(rs.getDate("user_register_date")) ;
			user.setUrl(rs.getString("url"));
			user.setPic_url(rs.getString("pic_url"));
		}
		System.out.println("findUserID END!  :  findUser "+ (user!=null));
		this.pstmt.close() ;
		System.out.println("Find  : " + (user!=null));
		return user ;
	}
	public boolean updateUserInfoByUID(User user) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("update@Base");
		boolean flag = false;
		String sql = "UPDATE user SET pic_url = ?, user_name = ? WHERE user_id = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, user.getPic_url());
		this.pstmt.setString(2, user.getName());
		this.pstmt.setString(3, user.getUserID());
		
		//如果存在更新
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		this.pstmt.close();
		System.out.println("UPDATE User :　"+flag);
		return flag;
	}
	
}
