package com.me.lost.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.itcast.jdbc.TxQueryRunner;

import com.me.lost.domain.User;

public class UserDao {
	
	private QueryRunner qr = new TxQueryRunner();

	
	//添加用户
	public void addUser(User u) {
		try{
			String sql = "insert into user values (?,?,?,?)";
			Object[] params = {u.getUid(),u.getuName(),u.getuPassword(),u.getuTelephone()};
	
			qr.update(sql, params);
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		
	}
	//依据用户名查询用户
	public User findByName(String uName) {
		try {
			String sql = "select * from user where uName=?";
			Object[] params = {uName};
			return qr.query(sql, new BeanHandler<User>(User.class), params);
		} catch (SQLException e) {
			new RuntimeException("出错啦！",e);
			return null;
		}
	}
	
	//根据uid删除用户
	public boolean deleteUserById(String uid) {
		try {
			String sql = "delete from user where uid = ?";
			Object[] params = { uid };
			qr.update(sql, params);
			return true;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}


}
