package com.hyacinth.factory;

import com.hyacinth.dao.*;

public class DAOFactory {
	public static UserDAO getUserDAOInstnace() throws Exception {
		return new UserDAOProxy();
	}
	public static FriendDAO getFriendDaoInstnace() throws Exception {
		return new FriendDAOProxy();
	}
	/*public static PassageDAO getPassageclassDAOInstnace() throws Exception {
		return new PassageDAOProxy();
	}*/
	public static ResourceDAO getResourceDAOInstance() throws Exception {
		return new ResourceDAOProxy();
	}
	public static CommentDAO getCommentDAOInstance() throws Exception{
		return new CommentDAOProxy();
	}
}
