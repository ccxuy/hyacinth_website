package com.hyacinth.dao;

import java.sql.SQLException;
import java.util.List;

import com.hyacinth.model.Passage;

public class PassageDAOProxy implements PassageDAO{
	private DatabaseConnection dbc = null ;
	private PassageDAO dao = null;
	
	public PassageDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection() ;
		this.dao = new PassageDAOBase(this.dbc.getConnection()) ;
	}

	public boolean addPassage(Passage psg) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false ;
		try{
			flag = this.dao.addPassage(psg) ;
			/*if(this.dao.findPassageByResourceId(psg.getId()) == null){
				flag = this.dao.addPassage(psg) ;
			}else{
				System.err.println("PASSAGE ID EXIST");
			}*/
		}catch(SQLException e){
			System.err.println("Add PASSAGE ERR @ passage Proxy");
		}finally{
			this.dbc.close() ;
		}
		return flag ;
	}

	public List<Passage> findAll(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<Passage> all = null ;
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
			passageclass = this.dao.findPassageByResourceId(psgid) ;
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

}
