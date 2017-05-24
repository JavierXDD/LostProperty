package com.me.lost.service;

import java.util.HashMap;
import java.util.Map;

import com.me.lost.dao.UserDao;
import com.me.lost.domain.PageBean;
import com.me.lost.domain.User;

public class UserService {

	private UserDao userDao = new UserDao();
	
	public UserService() {
		super();
		
	}
	
	//添加用户
	public void addUser(User u){
		userDao.addUser(u);
	}

	//依据用户名查询用户
	public User findByName(String uName) {
		return userDao.findByName(uName);
	}

	//根据用户id删除用户
	public String deleteUserById(String uid) {
		if(userDao.deleteUserById(uid) == true){
			return "删除成功！";
		}else{
			return "删除失败！";
		}
	}

	

}
