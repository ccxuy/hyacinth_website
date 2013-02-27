package com.hyacinth.dao;
import java.util.*;

import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface ResourceDAO {
	
	
	/**
	 * 数据库增加文章 addResource
	 * @param res
	 * @return
	 * @throws Exception
	 */
	public boolean addResource(Resource res) throws Exception;
	
	/**
	 * 查询所有resource 按照时间排序
	 * @param keyWord 查找关键字
	 * @return 返回一个List 每个User代表表的一行记录
	 * @throws Exception
	 */
	public List<Resource> findAll(String keyWord) throws Exception;
	
	/**
	 * 按编号查找resource 
	 * @param resid
	 * @return 返回用户对象
	 * @throws Exception
	 */
	public Resource findResourceByResourceId (String resid)throws Exception;
	/**
	 * 按用户查找Resource 按时间排序
	 * @param userid
	 * @return 返回用户对象
	 * @throws Exception
	 */
	public List<Resource> findResourceByUserId (String userid)throws Exception;
}
