package com.hyacinth.dao;

import java.sql.SQLException;
import java.util.List;

import com.hyacinth.model.Friendship;
import com.hyacinth.model.User;

public class FriendDAOProxy implements FriendDAO {
	private DatabaseConnection dbc = null ;
	private FriendDAO  dao = null ;
	public FriendDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection() ;
		this.dao = new FriendDAOBase(this.dbc.getConnection()) ;
	}
	public boolean addFriend(User host, User tar) throws Exception {
		boolean flag = false ;
		try{
			if(this.dao.findFriendByUserId(host.getUserID(),tar.getUserID()) == null){
				flag = this.dao.addFriend(host,tar) ;
			}
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return flag ;
	}

	
	public boolean deleteFriend(User user1, User user2) throws Exception {
		return false;
		// TODO Auto-generated method stub
		/*boolean flag = false ;
		try{
			if(this.dao.findFriendByUserId(user1.getUserID(),user2.getUserID()) == null){
				flag = this.dao.deleteFriend(user1,user2) ;
			}
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return flag ;*/
	}
	
	
	public List<User> findAll(String keyWord) throws Exception {
		return null;
		/*List<User> allfriend=null;
		try {
			allfriend=this.dao.findAll(keyWord);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			this.dbc.close() ;
		}
		// TODO Auto-generated method stub
		return allfriend;*/
	}

	public Friendship findFriendByUserId(String host, String tar)
			throws Exception {
		// TODO Auto-generated method stub
		Friendship friend = null ;
		try{
			friend = this.dao.findFriendByUserId(host,tar) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return friend ;
	}
	public boolean addFriendByUID(String hostuid, String taruid){
		// TODO Auto-generated method stub
		try {
			System.out.println("=======addFriendByUID========");
			if(this.dao.findFriendByUserId(hostuid,taruid) == null){
				return this.dao.addFriendByUID(hostuid, taruid);
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean addBan(User host, User tar) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	public boolean deleteRelationship(User host, User tar) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	public List<User> findAllFriends(String uid){
		// TODO Auto-generated method stub
		System.out.println("========findAllFriends========");
		List<User> all = null;
		try{
			all = this.dao.findAllFriends(uid);
		}catch (SQLException e) {
			// TODO: handle exception
			System.err.println("SQL ERR!!");
		}catch (Exception e) {
			// TODO: handle exception
			System.err.println("Unknown EXP @ proxy");
		}
		System.out.println("findAllFriends = "+all!=null);
		return all;
	}
	public List<User> findAllFriends(){
		// TODO Auto-generated method stub
		System.out.println("========findAllFriends========");
		List<User> all = null;
		try{
			all = this.dao.findAllFriends();
		}catch (SQLException e) {
			// TODO: handle exception
			System.err.println("SQL ERR!!");
		}catch (Exception e) {
			// TODO: handle exception
			System.err.println("Unknown EXP @ proxy");
		}
		System.out.println("findAllFriends = "+all!=null);
		return all;
	}
	public int isRelate(String hostuid, String taruid){
		// TODO Auto-generated method stub
		System.out.println("=======isRelate=======");
		try {
			return this.dao.isRelate(hostuid, taruid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -2;
	}

}
