package com.hyacinth.model;

import java.util.Date;

public class Passage extends Resource {
	private String recourceid;
	private String picUrl;
	private Date date;
	private String title;
	private String comment;
	private int rank;
	private String url;
	@Override
	public String getUrl() {
		return url;
	}
	@Override
	public void setUrl(String url) {
		this.url = url;
	}
	private String passageNum;
	private StringBuffer content;
	/*private Blob passage_content;
	
	public Blob getPassage_content() {
		return passage_content;
	}
	public void setPassage_content(Blob passage_content) {
		this.passage_content = passage_content;
	}
	public void setPassage_content(String c) {
		this.passage_content = c;
	}*/
	@Override
	public String getTitle() {
		return title;
	}
	@Override
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRecourceid() {
		return recourceid;
	}
	public void setRecourceid(String recourceid) {
		this.recourceid = recourceid;
	}
	@Override
	public String getPicUrl() {
		return picUrl;
	}
	@Override
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	@Override
	public Date getDate() {
		return date;
	}
	public void setNowDate() {
		this.date = new Date(System.currentTimeMillis());
	}
	@Override
	public void setDate(Date date) {
		this.date = date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public int getRank() {
		return rank;
	}
	@Override
	public void setRank(int rank) {
		this.rank = rank;
	}
	/*public URL getUrl() {
		return url;
	}
	public boolean setUrl(String spec) {
		try {
			this.url = new URL(spec);
			return true;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public void setUrl(URL url) {
		this.url = url;
	}*/
	public String getPassageNum() {
		return passageNum;
	}
	public void setPassageNum(String passageid) {
		this.passageNum = passageid;
	}
	public StringBuffer getContent() {
		return content;
	}
	public void setContent(StringBuffer content) {
		this.content = content;
	}
	
}
