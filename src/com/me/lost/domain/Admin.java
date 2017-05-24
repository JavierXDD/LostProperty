package com.me.lost.domain;

public class Admin {
	private String aName;
	private String aPassword;
	private int isSuper;
	
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getaPassword() {
		return aPassword;
	}
	public void setaPassword(String aPassword) {
		this.aPassword = aPassword;
	}
	public int getIsSuper() {
		return isSuper;
	}
	public void setIsSuper(int isSuper) {
		this.isSuper = isSuper;
	}
	@Override
	public String toString() {
		return "Admin [aName=" + aName + ", aPassword=" + aPassword
				+ ", isSuper=" + isSuper + "]";
	}
	
	
}
