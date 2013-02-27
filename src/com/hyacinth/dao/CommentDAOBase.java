package com.hyacinth.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.hyacinth.model.Comment;
import com.hyacinth.model.Resource;

public class CommentDAOBase implements CommentDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private PreparedStatement pstmt2 = null;
	public CommentDAOBase(Connection conn){
		this.conn = conn;
	}
	
	public boolean addComment(Comment co) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		String sql = "INSERT INTO comment(id, date,content,floor,resourceId) VALUES (?,?,?,?,?)";
		try {
			System.out.println("----$ Try adding comment");
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1,co.getId());
			this.pstmt.setDate(2, new Date(new java.util.Date().getTime()));
			this.pstmt.setString(3, co.getContent());//For Comment in resource Content
			this.pstmt.setInt(4, co.getFloor());
			this.pstmt.setString(5, co.getResourceid());
			
			
			
			System.out.println(co.getId()+" Saved! @ "+ new java.util.Date().getTime());
			//如果存在更新
			if (this.pstmt.executeUpdate()>0 ) {
				flag = true;
			}
			this.pstmt.close();
		} catch (SQLException e) {
			// TODO: handle exception
			System.err.println("SQL ERR @ base!");
			e.printStackTrace();
			throw e;
		}catch (Exception er){
			er.printStackTrace();
		}finally{
			System.out.println("addComment @ Base : "+flag);
		}
		return flag;
	}
	
	
	public List<Resource> findAll(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Comment> findCommetnByResourceId(String resid) throws Exception {
		// TODO Auto-generated method stub
		List<Comment> all = new ArrayList<Comment>();
		Comment com = null;
		String sql = "SELECT * FROM comment WHERE resourceid = ? ORDER BY date ASC";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1,resid) ;
		ResultSet rs = this.pstmt.executeQuery();
		
		while(rs.next()){
			com = new Comment();
			com.setId(rs.getString("id"));
			com.setDate(rs.getDate("date"));
			com.setContent(rs.getString("content"));
			com.setFloor(rs.getInt("floor"));
			com.setResourceid(rs.getString("resourceId"));
			all.add(com);
		}
		this.pstmt.close();
		return all;
	}
	public List<Resource> findResourceByUserId(String userid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*public List<Resource> findAll(String keyWord) throws Exception {
		List<Resource> all = new ArrayList<Resource>();
		String sql = "SELECT * FROM resource WHERE title LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%"+keyWord+"%");
		ResultSet rs = this.pstmt.executeQuery();
		Resource res = null;
		while(rs.next()){
			res = new Resource();
			res.setId(rs.getString("id"));
			res.setDate(rs.getDate("date"));
			res.setRank(rs.getInt("rank"));
			res.setPicUrl(rs.getString("pic_url"));
			res.setTitle(rs.getString("title"));
			res.setUrl(rs.getString("url"));
			res.setUserid(rs.getString("userid"));
			
			all.add(res);
		}
		
		
		this.pstmt.close();
		return all;
	}
	public Resource findResourceByResourceId(String resid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("--> @Base");
		Resource res = null;
		String sql = "SELECT * FROM resource WHERE id = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1,resid) ;
		ResultSet rs = this.pstmt.executeQuery();
		res = new Resource();
		if(rs.next()){
			System.out.println("!! Res Found : #"+resid);
			res.setId(rs.getString("id"));
			res.setDate(rs.getDate("date"));
			res.setRank(rs.getInt("rank"));
			res.setPicUrl(rs.getString("pic_url"));
			res.setTitle(rs.getString("title"));
			res.setUrl(rs.getString("url"));
			res.setUserid(rs.getString("userid"));
		}
		this.pstmt.close();
		return res;
	}
	public Resource findResourceByResouceTitle(String title) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	 (non-Javadoc)
	 * @see com.hyacinth.dao.ResourceDAO#addResource(com.hyacinth.model.Resource)
	 
	public boolean addResource(Resource res) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		String sql = "INSERT INTO resource(id, date, rank, pic_url, title, userid, url ) VALUES (?,?,?,?,?,?,?)";
		try {
			System.out.println("==================");
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, res.getId());
			this.pstmt.setDate(2, new Date(new java.util.Date().getTime()));
			this.pstmt.setInt(3, res.getRank());//For Comment in resource Content
			this.pstmt.setString(4, res.getPicUrl());
			this.pstmt.setString(5, res.getTitle());
			this.pstmt.setString(6, res.getUserid());
			this.pstmt.setString(7,	res.getUrl());
			
			
			
			System.out.println(res.getId()+" Saved! @ "+ new java.util.Date().getTime());
			//如果存在更新
			if (this.pstmt.executeUpdate()>0 ) {
				flag = true;
			}
			this.pstmt.close();
		} catch (SQLException e) {
			// TODO: handle exception
			System.err.println("SQL ERR @ base!");
			e.printStackTrace();
			throw e;
		}catch (Exception er){
			er.printStackTrace();
		}finally{
			System.out.println("addRes @ Base : "+flag);
		}
		return flag;
	}

	 (non-Javadoc)
	 * @see com.hyacinth.dao.ResourceDAO#findResourceByUserId(java.lang.String)
	 
	public List<Resource> findResourceByUserId(String userid) throws Exception {
		// TODO Auto-generated method stub
		List<Resource> all = new ArrayList<Resource>();
		Resource res = null;
		String sql = "SELECT * FROM resource WHERE userid = ? ORDER BY date ASC";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1,userid) ;
		ResultSet rs = this.pstmt.executeQuery();
		
		while(rs.next()){
			res = new Resource();
			res.setId(rs.getString("id"));
			res.setDate(rs.getDate("date"));
			res.setRank(rs.getInt("rank"));
			res.setPicUrl(rs.getString("pic_url"));
			res.setTitle(rs.getString("title"));
			res.setUrl(rs.getString("url"));
			res.setUserid(rs.getString("userid"));
			all.add(res);
		}
		this.pstmt.close();
		return all;
	}*/
}
