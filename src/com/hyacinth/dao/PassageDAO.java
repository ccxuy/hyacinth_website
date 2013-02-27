package com.hyacinth.dao;
import java.util.*;
import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface PassageDAO {
	
	/**
	 * 数据库增加文章 addPassage
	 * @param user
	 * @return boolean 是否成功
	 * @throws Exception
	 */
	public boolean addPassage(Passage psg) throws Exception;
	
	/**
	 * 查询用户数据
	 * @param keyWord 查找关键字
	 * @return 返回一个List 每个User代表表的一行记录
	 * @throws Exception
	 */
	public List<Passage> findAll(String keyWord) throws Exception;
	
	/**
	 * 按编号查找用户
	 * @param userid
	 * @return 返回用户对象
	 * @throws Exception
	 */
	public Passage findPassageByResourceId (String psgid)throws Exception;
	/**
	 * 按编号查找用户
	 * @param userid
	 * @return 返回用户对象
	 * @throws Exception
	 */
	public Passage findPassageByResouceTitle (String title)throws Exception;
}
