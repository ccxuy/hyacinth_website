package com.hyacinth.model;

public class Friendship {
	private String hostid;
	private String targetid;
	private Boolean relationship;
	public String getHostid() {
		return hostid;
	}
	public void setHostid(String hostid) {
		this.hostid = hostid;
	}
	public String getTargetid() {
		return targetid;
	}
	public void setTargetid(String targetid) {
		this.targetid = targetid;
	}
	public Boolean getRelationship() {
		return relationship;
	}
	public void setRelationship(Boolean relationship) {
		this.relationship = relationship;
	}
}
