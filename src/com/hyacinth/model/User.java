package com.hyacinth.model;

import static java.util.UUID.randomUUID;

import java.sql.Date;
import java.util.UUID;

public class User {
	private String userID;
	private String loginID;
	private String name;
	private String password;
	private String email;
	private String qqnum;
	private String credit;
	private int security;
	private Date regdate;
	private String url;
	private String pic_url;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPic_url() {
		return pic_url;
	}
	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}
	public String getUserID() {
		return userID;
	}
	public void setGenerateNewUserID() {
		UUID id = randomUUID();
		this.userID = id.toString().toString().replace("-", "");;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQqnum() {
		return qqnum;
	}
	public void setQqnum(String qqnum) {
		this.qqnum = qqnum;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public int getSecurity() {
		return security;
	}
	public void setSecurity(int i) {
		this.security = i;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setGenerateNewRegdate() {
		this.regdate = new Date(System.currentTimeMillis());
		System.out.println("regdate = "+regdate);
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
