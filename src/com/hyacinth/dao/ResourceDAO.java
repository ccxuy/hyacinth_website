package com.hyacinth.dao;
import java.util.*;

import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface ResourceDAO {
	
	
	/**
	 * ���ݿ��������� addResource
	 * @param res
	 * @return
	 * @throws Exception
	 */
	public boolean addResource(Resource res) throws Exception;
	
	/**
	 * ��ѯ����resource ����ʱ������
	 * @param keyWord ���ҹؼ���
	 * @return ����һ��List ÿ��User������һ�м�¼
	 * @throws Exception
	 */
	public List<Resource> findAll(String keyWord) throws Exception;
	
	/**
	 * ����Ų���resource 
	 * @param resid
	 * @return �����û�����
	 * @throws Exception
	 */
	public Resource findResourceByResourceId (String resid)throws Exception;
	/**
	 * ���û�����Resource ��ʱ������
	 * @param userid
	 * @return �����û�����
	 * @throws Exception
	 */
	public List<Resource> findResourceByUserId (String userid)throws Exception;
}
