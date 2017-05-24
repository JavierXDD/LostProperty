package com.me.lost.service;

import java.sql.SQLException;

import com.me.lost.dao.AdminDao;
import com.me.lost.domain.Admin;
import com.me.lost.domain.PageBean;
import com.me.lost.domain.Thing;
import com.me.lost.domain.User;

public class AdminService {

	AdminDao adminDao = new AdminDao();
	
	public Admin findByName(String aName) {
		return adminDao.findByName(aName);
	}

	public void deleteThing(String tid){
		adminDao.deleteThing(tid);
	}

	public void editThing(Thing thing) {
		adminDao.editThing(thing);
	}

	public PageBean<User> findAllUser(int pc, int ps) {
		return adminDao.findAllUser(pc,ps);
	}

}
