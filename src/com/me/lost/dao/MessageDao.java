package com.me.lost.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.me.lost.domain.Message;

import cn.itcast.jdbc.TxQueryRunner;

public class MessageDao {
	private QueryRunner qr = new TxQueryRunner();

	//留言
	public boolean leaveMessage(Message message) {
		try {
			String sql = "insert into message values(?,?,?,?,?)";
			Object[] params = {message.getMid(),message.getName(),message.getEmail(),message.getPhone(),message.getMessage()};

			qr.update(sql, params);
			return true;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	//查找所有留言
	public List<Message> findAllMessage() {
		try {
			String sql = "select * from message";
			return qr.query(sql, new BeanListHandler<Message>(Message.class));
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}		
	}
	
	//删除留言
	public void deleteMessageByMid(String mid){
		try {
			String sql = "delete from message where mid = ?";
			Object[] params = { mid };
			qr.update(sql, params);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
