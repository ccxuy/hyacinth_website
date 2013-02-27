package com.hyacinth.dao;

import java.sql.SQLException;
import java.util.List;

import com.hyacinth.model.Passage;
import com.hyacinth.model.Resource;

public class ResourceDAOProxy implements ResourceDAO{
	private DatabaseConnection dbc = null ;
	private ResourceDAO dao = null;
	
	public ResourceDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection() ;
		this.dao = new ResourceDAOBase(this.dbc.getConnection()) ;
	}

	public List<Resource> findAll(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<Resource> all = null ;
		try{
			all = this.dao.findAll(keyWord) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return all ;
	}

	public Passage findPassageByResourceId(String psgid) throws Exception {
		Passage passageclass = null ;
		try{
			//passageclass = this.dao.findPassageByResourceId(psgid) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return passageclass ;
	}

	public Passage findPassageByResouceTitle(String title) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.hyacinth.dao.ResourceDAO#addResource(com.hyacinth.model.Resource)
	 */
	public boolean addResource(Resource res) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false ;
		try{
			flag = this.dao.addResource(res) ;
			/*if(this.dao.findPassageByResourceId(psg.getId()) == null){
				flag = this.dao.addPassage(psg) ;
			}else{
				System.err.println("PASSAGE ID EXIST");
			}*/
		}catch(SQLException e){
			System.err.println("Add Res ERR @  Proxy");
		}finally{
			this.dbc.close() ;
		}
		return flag ;
	}

	public Resource findResourceByResourceId(String resid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("----$ find Resource By resource id");
		Resource res = null ;
		try{
			res = this.dao.findResourceByResourceId(resid);
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return res ;
	}

	public Passage findPassageByUserId(String userid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Resource> findResourceByUserId(String userid) throws Exception {
		// TODO Auto-generated method stub
		List<Resource> all = null ;
		try{
			all = this.dao.findResourceByUserId(userid);
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		return all;
	}

}
