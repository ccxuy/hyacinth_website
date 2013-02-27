package com.hyacinth.dao;
import java.util.*;
import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface PassageDAO {
	
	/**
	 * ���ݿ��������� addPassage
	 * @param user
	 * @return boolean �Ƿ�ɹ�
	 * @throws Exception
	 */
	public boolean addPassage(Passage psg) throws Exception;
	
	/**
	 * ��ѯ�û�����
	 * @param keyWord ���ҹؼ���
	 * @return ����һ��List ÿ��User������һ�м�¼
	 * @throws Exception
	 */
	public List<Passage> findAll(String keyWord) throws Exception;
	
	/**
	 * ����Ų����û�
	 * @param userid
	 * @return �����û�����
	 * @throws Exception
	 */
	public Passage findPassageByResourceId (String psgid)throws Exception;
	/**
	 * ����Ų����û�
	 * @param userid
	 * @return �����û�����
	 * @throws Exception
	 */
	public Passage findPassageByResouceTitle (String title)throws Exception;
}
