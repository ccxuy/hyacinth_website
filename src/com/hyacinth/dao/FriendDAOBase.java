package com.hyacinth.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hyacinth.model.Friendship;
import com.hyacinth.model.User;

public class FriendDAOBase implements FriendDAO{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	public FriendDAOBase(Connection conn){
		this.conn = conn;
	}
	
	
	public boolean deleteFriend(User user1, User user2 ) throws Exception{
		/*boolean flag = false;
		String sql = "delete  INTO user(USER,USER_TARGET,USER_is_FRIEND) VALUES (?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, user1.getUserID());
		this.pstmt.setString(2, user2.getUserID());
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		this.pstmt.close();		
		return flag;*/
		return false;
		
	}

	public List<User> findAll(String keyWord) throws Exception {
		/*List<User> all = new ArrayList<User>() ;
		String sql = "SELECT * FROM USER_RELATIONSHIP WHERE USER LIKE ? OR USER_TARGET LIKE ?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,"%"+keyWord+"%") ;
		ResultSet rs = this.pstmt.executeQuery() ;
		User user = null ;
		UserDAOBase a=new UserDAOBase(conn);
		while(rs.next()){
			user = a.findUserByUserId(rs.getString(2));
			all.add(user) ;
		}
		this.pstmt.close() ;
		return all ;*/
		return null;
	}
	
	public Friendship findFriendByUserId(String host,String tar) throws Exception {
		// TODO Auto-generated method stub
		Friendship friendship = null ;
		String sql = "SELECT * FROM user_relationship WHERE hostid = ?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1, host);
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			friendship = new Friendship() ;
			friendship.setHostid(rs.getString("hostid"));
			friendship.setTargetid(rs.getString("tarid")) ;
			friendship.setRelationship(true) ;
		}
		this.pstmt.close() ;
		return friendship ;
	}
	
	public boolean addFriendByUID(String hostuid, String taruid)
			throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "INSERT INTO user_relationship(hostid,targetid,relationship) VALUES (?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, hostuid);
		this.pstmt.setString(2, taruid);
		this.pstmt.setBoolean(3, true);
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		return flag;
	}
	public boolean addBan(User host, User tar) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	public boolean deleteRelationship(User host, User tar) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	public List<User> findAllFriends(String uid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("--> @Base");
		List<User> all = new ArrayList<User>() ;
		String sql = "SELECT * FROM user_relationship WHERE hostid = ?" ;
		System.out.println("--> @sql : " + sql);
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,uid) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		User user = null ;
		System.out.println("--> @UserDAOBase");
		UserDAOBase a=new UserDAOBase(conn);
		while(rs.next()){
			System.out.println("Start findEachUser!!");
			user = a.findUserByUserId(rs.getString("targetid"));
			all.add(user) ;
		}
		this.pstmt.close() ;
		return all ;
	}
	/**
	 * 
	 * @return All friends in DB
	 * @throws Exception
	 */
	public List<User> findAllFriends() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("--> @Base");
		List<User> all = new ArrayList<User>() ;
		String sql = "SELECT * FROM user_relationship" ;
		System.out.println("--> @sql : " + sql);
		this.pstmt = this.conn.prepareStatement(sql) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		User user = null ;
		System.out.println("--> @UserDAOBase");
		UserDAOBase a=new UserDAOBase(conn);
		while(rs.next()){
			System.out.println("Start findEachUser!!");
			user = a.findUserByUserId(rs.getString("targetid"));
			all.add(user) ;
		}
		this.pstmt.close() ;
		return all ;
	}
	public int isRelate(String hostuid, String taruid) throws Exception {
		// TODO Auto-generated method stub
		Friendship friendship = null ;
		String sql = "SELECT * FROM USER_RELATIONSHIP WHERE hostid = ?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1, hostuid);
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			if(rs.getBoolean("relationship")==true){
				return 1;
			}else{
				return -1;
			}
		}
		return 0 ;
	}
	public int isBan(String hostuid, String taruid) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	public boolean addFriend(User host, User tar) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "INSERT INTO user(USER,USER_TARGET,USER_is_FRIEND) VALUES (?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, host.getUserID());
		this.pstmt.setString(2, tar.getUserID());
		this.pstmt.setBoolean(3, true);
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		return flag;
	}

}
