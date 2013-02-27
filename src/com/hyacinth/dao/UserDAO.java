package com.hyacinth.dao;
import java.util.*;

import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface UserDAO {
	
	/**
	 * 数据库增加用户 addUser
	 * @param user
	 * @return boolean 是否成功
	 * @throws Exception
	 */
	public boolean addUser(User user) throws Exception;
	public boolean updateUserInfoByUID(User user) throws Exception;
	public boolean deleteUser(User user) throws Exception;
	
	/**
	 * 查询用户数据
	 * @param keyWord 查找关键字
	 * @return 返回一个List 每个User代表表的一行记录
	 * @throws Exception
	 */
	public List<User> findAll(String keyWord) throws Exception;
	/**
	 * @return 返回所有用户
	 * @throws Exception
	 */
	public List<User> findAll()throws Exception;
	/**
	 * 按编号查找用户
	 * @param userid
	 * @return 返回用户对象
	 * @throws Exception
	 */
	public User findUserByUserId (String userid)throws Exception;
	/**
	 * 按编号查找用户
	 * @param userid
	 * @return 返回用户对象
	 * @throws Exception
	 */
	public User findUserByLoginId (String loginid)throws Exception;

	
}
