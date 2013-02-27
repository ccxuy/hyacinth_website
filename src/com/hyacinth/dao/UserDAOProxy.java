package com.hyacinth.dao;
import java.sql.SQLException;
import java.util.* ;
import com.hyacinth.model.User;

public class UserDAOProxy implements UserDAO{
	private DatabaseConnection dbc = null ;
	private UserDAO dao = null ;
	public UserDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection() ;
		this.dao = new UserDAOBase(this.dbc.getConnection()) ;
	}
	public boolean addUser(User user) throws Exception {
		System.out.println("----$ addUser START!");
		boolean flag = false ;
		try{
			if(this.dao.findUserByLoginId(user.getLoginID()) == null){
				flag = this.dao.addUser(user) ;
			}else{
				System.out.println("LoginId already exist!");
			}
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		System.out.println("----$ addUser END!");
		return flag ;
	}
	
	/**
	 * @param user
	 * @return true if success
	 * @throws Exception
	 */
	public boolean updateUserInfoByUID(User user) throws Exception {
		boolean flag = false ;
		System.out.println("======updateUserInfoByUID=====");
		System.out.println("user : "+(user==null) );
		System.out.println("userid = "+user.getUserID());
		try{
			if(this.dao.findUserByLoginId(user.getLoginID()) != null){
				System.out.println("updating........");
				flag = this.dao.updateUserInfoByUID(user);
			}else{
				System.out.println("findUserId FAIL!! ");
			}
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return flag ;
	}
	
	public boolean deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false ;
		try{
			if(this.dao.findUserByLoginId(user.getLoginID()) == null){
				flag = this.dao.deleteUser(user) ;
			}
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return flag ;
	}
	
	public List<User> findAll(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<User> all = null ;
		System.out.println("----$ findAll User by keyWord $----");
		try{
			all = this.dao.findAll(keyWord) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return all ;
	}
	public List<User> findAll() throws Exception {
		// TODO Auto-generated method stub
		List<User> all = null ;
		System.out.println("----$ findAll User $----");
		try{
			all = this.dao.findAll() ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return all ;
	}
	public User findUserByUserId(String userid) {
		// TODO Auto-generated method stub
		User user = null ;
		try{
			System.out.println("----$ findUserByUserId $----");
			System.out.println("Finding User ID =  " + userid);
			user = this.dao.findUserByUserId(userid) ;
			this.dbc.close() ;
			System.out.println("Find User : "+(user!=null));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		return user ;
	}
	public User findUserByLoginId(String loginid) throws Exception {
		// TODO Auto-generated method stub
		User user = null ;
		try{
			user = this.dao.findUserByLoginId(loginid) ;
		}catch(SQLException e){
			System.err.println("Find user FAIL @ userDAOProxy");
		}finally{
			this.dbc.close() ;
		}
		return user ;
	}

	
	
}
