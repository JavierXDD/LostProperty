package com.me.lost.domain;

public class Thing {
	private String tid;		//物品ID
	private String mType;	//发布信息类型
	private String tName;	//物品名称
	private String tType;	//物品类别
	private String tTime;	//发现或丢失物品的时间
	private String tAddress;		//发现或丢失物品的地点
	private String tDescription;	//对物品的描述
	private String uName;			//信息发布者
	private String uTelephone;		//信息发布者联系电话
	private String tState;			//认领状态
	private String gName;			//申请认领人
	private String gTelephone;		//申请认领人电话
	
	
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgTelephone() {
		return gTelephone;
	}
	public void setgTelephone(String gTelephone) {
		this.gTelephone = gTelephone;
	}
	public String gettState() {
		return tState;
	}
	public void settState(String tState) {
		this.tState = tState;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuTelephone() {
		return uTelephone;
	}
	public void setuTelephone(String uTelephone) {
		this.uTelephone = uTelephone;
	}
	public String getmType() {
		return mType;
	}
	public void setmType(String mType) {
		this.mType = mType;
	}
	public String gettType() {
		return tType;
	}
	public void settType(String tType) {
		this.tType = tType;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String gettTime() {
		return tTime;
	}
	public void settTime(String tTime) {
		this.tTime = tTime;
	}
	public String gettAddress() {
		return tAddress;
	}
	public void settAddress(String tAddress) {
		this.tAddress = tAddress;
	}
	public String gettDescription() {
		return tDescription;
	}
	public void settDescription(String tDescription) {
		this.tDescription = tDescription;
	}
	public Thing() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Thing [tid=" + tid + ", mType=" + mType + ", tName=" + tName
				+ ", tType=" + tType + ", tTime=" + tTime + ", tAddress="
				+ tAddress + ", tDescription=" + tDescription + ", uName="
				+ uName + ", uTelephone=" + uTelephone + ", tState=" + tState
				+ ", gName=" + gName + ", gTelephone=" + gTelephone + "]";
	}
	
}
