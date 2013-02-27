package com.hyacinth.dao;

import static java.util.UUID.randomUUID;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.hyacinth.model.Passage;

public class PassageDAOBase implements PassageDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private PreparedStatement pstmt2 = null;
	public PassageDAOBase(Connection conn){
		this.conn = conn;
	}
	public boolean addPassage(Passage psg) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		String sql = "INSERT INTO resource(resource_id,resource_date,resource_content,resource_rank,resource_pic_url,resource_title) VALUES (?,?,?,?,?,?)";
		String sql2 = "INSERT INTO passage(resource_id,passage_url,passage_content) VALUES (?,?,?)";
		try {
			System.out.println("==================");
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt2 = this.conn.prepareStatement(sql2);
			UUID id = randomUUID();
			System.out.println(id.toString());
			System.out.println(id.toString());
			this.pstmt.setString(1, id.toString().replace("-", ""));
			this.pstmt.setDate(2, new Date(new java.util.Date().getTime()));
			this.pstmt.setString(3, psg.getComment());//For Comment in resource Content
			this.pstmt.setInt(4, psg.getRank());
			this.pstmt.setString(5, psg.getPicUrl());
			this.pstmt.setString(6, psg.getTitle());
			
			this.pstmt2.setString(1, id.toString().replace("-", ""));
			this.pstmt2.setString(2, psg.getUrl().toString());
			this.pstmt2.setString(3, psg.getContent().toString());
			
			System.out.println(psg.getId()+" Registered! @ "+ new java.util.Date().getTime());
			//如果存在更新
			if (this.pstmt.executeUpdate()>0 && this.pstmt2.executeUpdate()>0) {
				flag = true;
			}
			this.pstmt.close();
			this.pstmt2.close();
		} catch (SQLException e) {
			// TODO: handle exception
			System.err.println("SQL ERR @ base!");
			e.printStackTrace();
			throw e;
		}catch (Exception er){
			er.printStackTrace();
		}finally{
			System.out.println("addPassage @ Base : "+flag);
		}
		return flag;
	}
	public List<Passage> findAll(String keyWord) throws Exception {
		List<Passage> all = new ArrayList<Passage>();
		String sql = "SELECT PASSAGE_ID,PASSAGE_URL,RESOURCE_ID,resource_title FROM PASSAGE";
		String sql2 = "SELECT RESOURCE_ID,resource_date,resource_content,resource_rank,resource_pic_url,resource_title FROM RESOURCE";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt2 = this.conn.prepareStatement(sql2);
		ResultSet rs = this.pstmt.executeQuery();
		ResultSet rs2 = this.pstmt2.executeQuery();
		Passage passageclass = null;
		while(rs.next()&&rs2.next()){
			passageclass = new Passage();
			passageclass.setPassageNum(rs.getString(1) );
			passageclass.setUrl(rs.getString(2));
			passageclass.setId(rs.getString(3));
			passageclass.setTitle(rs.getString(4));
			passageclass.setPicUrl(rs2.getString(5));
			passageclass.setPicUrl(rs2.getString(6));
			System.out.println("psgBase: "+ passageclass.getTitle());
			all.add(passageclass);
		}
		
		
		this.pstmt.close();
		return all;
	}
	public Passage findPassageByResourceId(String psgid) throws Exception {
		// TODO Auto-generated method stub
		Passage passageclass = null;
		String sql = "SELECT PASSAGE_ID,PASSAGE_URL,RESOURCE_ID FROM PASSAGE WHERE resource_id = ?";
		String sql2 = "SELECT RESOURCE_ID,resource_date,resource_content,resource_pic_url,resource_title,resource_rank FROM resource WHERE resource_id = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1,psgid) ;
		this.pstmt2 = this.conn.prepareStatement(sql2);
		this.pstmt2.setString(1,psgid) ;
		ResultSet rs = this.pstmt.executeQuery();
		passageclass = new Passage();
		if(rs.next()){
			passageclass.setId(rs.getString(1));
			passageclass.setUrl(rs.getString(2));
			passageclass.setPassageNum(rs.getString(3));
		}
		rs = this.pstmt2.executeQuery();
		if(rs.next()){
			passageclass.setId(rs.getString(1));
			passageclass.setDate(rs.getDate(2));
			passageclass.setContent(new StringBuffer(rs.getString(3)) );
			passageclass.setUrl(rs.getString(4) );
			passageclass.setTitle(rs.getString(5) );
			passageclass.setRank(rs.getInt(6) );
		}
		this.pstmt.close();
		return passageclass;
	}
	public Passage findPassageByResouceTitle(String title) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
