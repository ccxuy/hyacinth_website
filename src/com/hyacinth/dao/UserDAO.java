package com.hyacinth.dao;
import java.util.*;

import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface UserDAO {
	
	/**
	 * ���ݿ������û� addUser
	 * @param user
	 * @return boolean �Ƿ�ɹ�
	 * @throws Exception
	 */
	public boolean addUser(User user) throws Exception;
	public boolean updateUserInfoByUID(User user) throws Exception;
	public boolean deleteUser(User user) throws Exception;
	
	/**
	 * ��ѯ�û�����
	 * @param keyWord ���ҹؼ���
	 * @return ����һ��List ÿ��User������һ�м�¼
	 * @throws Exception
	 */
	public List<User> findAll(String keyWord) throws Exception;
	/**
	 * @return ���������û�
	 * @throws Exception
	 */
	public List<User> findAll()throws Exception;
	/**
	 * ����Ų����û�
	 * @param userid
	 * @return �����û�����
	 * @throws Exception
	 */
	public User findUserByUserId (String userid)throws Exception;
	/**
	 * ����Ų����û�
	 * @param userid
	 * @return �����û�����
	 * @throws Exception
	 */
	public User findUserByLoginId (String loginid)throws Exception;

	
}
