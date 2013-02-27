package com.hyacinth.dao;
import java.util.*;

import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface FriendDAO {
	
	/**
	 * Ϊ�û�������� addFriend
	 * @param hostuid
	 * @param taruid
	 * @return
	 * @throws Exception
	 */
	public boolean addFriendByUID(String hostuid,String taruid) throws Exception;
	/**
	 * Ϊ�û�������� addFriend
	 * @param host 
	 * @param tar
	 * @return
	 * @throws Exception
	 */
	public boolean addFriend(User host, User tar) throws Exception;
	
	/**
	 * ��Ӻ�����  addBan
	 * @param host
	 * @param tar
	 * @return
	 * @throws Exception
	 */
	public boolean addBan(User host, User tar) throws Exception;
	
	
	/**
	 * ɾ����ϵ
	 * @param host
	 * @param tar
	 * @return
	 * @throws Exception
	 */
	public boolean deleteRelationship(User host, User tar) throws Exception;
	
	
	/**
	 * ��ȡ��������
	 * @param uid
	 * @return	USER �����û�
	 * @throws Exception
	 */
	public List<User> findAllFriends(String uid) throws Exception;
	/**
	 * @return ��������
	 */
	public List<User> findAllFriends()throws Exception ;

	public Friendship findFriendByUserId(String user1,String user2) throws Exception ;
	
	/**
	 * @param hostuid
	 * @param taruid
	 * @return 1������ -1������ 0û�й�ϵ
	 * @throws Exception
	 */
	public int isRelate(String hostuid,String taruid)throws Exception ;
	
	
}
