package com.me.lost.service;

import java.util.List;

import com.me.lost.dao.ThingDao;
import com.me.lost.domain.PageBean;
import com.me.lost.domain.Thing;

public class ThingService {
	
	ThingDao thingDao = new ThingDao();
	
	public ThingService() {
		super();
	}

	//发布信息
	public void addThing(Thing form) {
		thingDao.addThing(form);
	}

	//显示所有信息
	public PageBean<Thing> findAll(int pc, int ps) {	
		return thingDao.findAll(pc,ps);
	}

	//单个信息的详细信息
	public Thing detail(String tid) {
		return thingDao.detail(tid);
	}
	//认领
	public void want(String tid,String gName,String gTelephone) {
		thingDao.want(tid,gName,gTelephone);		
	}
	//搜索
	public PageBean<Thing> query(String search, int pc, int ps) {
		return thingDao.query(search,pc,ps);
	}
	
	//个人中心
	public List<Thing> person(String session_uName, String session_uTelephone) {
		return thingDao.person(session_uName,session_uTelephone);
	}

}
