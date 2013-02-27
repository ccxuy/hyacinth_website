package com.hyacinth.model;

import java.util.Date;
import java.util.UUID;

public class Comment {
	private String id;
	private String url;
	private Date date;
	private String content;
	private int floor;
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	private String resourceid;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setNewId() {
		this.id = UUID.randomUUID().toString();
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getResourceid() {
		return resourceid;
	}
	public void setResourceid(String resourceid) {
		this.resourceid = resourceid;
	}
	
	
	
}
