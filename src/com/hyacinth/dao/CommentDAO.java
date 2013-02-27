package com.hyacinth.dao;
import java.util.*;

import com.hyacinth.model.*;

/**
 * @author Andrew
 *
 */
public interface CommentDAO {
	
	
	
	/**
	 * addComment
	 * @param co
	 * @return
	 * @throws Exception
	 */
	public boolean addComment(Comment co) throws Exception;
	
	
	public List<Resource> findAll(String keyWord) throws Exception;
	
	
	/**
	 * @param resid
	 * @return
	 * @throws Exception
	 */
	public List<Comment> findCommetnByResourceId (String resid)throws Exception;
	
	
	public List<Resource> findResourceByUserId (String userid)throws Exception;
}
