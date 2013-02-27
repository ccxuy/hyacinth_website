package com.hyacinth.dao;
import java.util.*;

import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface FriendDAO {
	
	/**
	 * 为用户添加朋友 addFriend
	 * @param hostuid
	 * @param taruid
	 * @return
	 * @throws Exception
	 */
	public boolean addFriendByUID(String hostuid,String taruid) throws Exception;
	/**
	 * 为用户添加朋友 addFriend
	 * @param host 
	 * @param tar
	 * @return
	 * @throws Exception
	 */
	public boolean addFriend(User host, User tar) throws Exception;
	
	/**
	 * 添加黑名单  addBan
	 * @param host
	 * @param tar
	 * @return
	 * @throws Exception
	 */
	public boolean addBan(User host, User tar) throws Exception;
	
	
	/**
	 * 删除关系
	 * @param host
	 * @param tar
	 * @return
	 * @throws Exception
	 */
	public boolean deleteRelationship(User host, User tar) throws Exception;
	
	
	/**
	 * 提取所有朋友
	 * @param uid
	 * @return	USER 返回用户
	 * @throws Exception
	 */
	public List<User> findAllFriends(String uid) throws Exception;
	/**
	 * @return 所有朋友
	 */
	public List<User> findAllFriends()throws Exception ;

	public Friendship findFriendByUserId(String user1,String user2) throws Exception ;
	
	/**
	 * @param hostuid
	 * @param taruid
	 * @return 1是朋友 -1黑名单 0没有关系
	 * @throws Exception
	 */
	public int isRelate(String hostuid,String taruid)throws Exception ;
	
	
}
