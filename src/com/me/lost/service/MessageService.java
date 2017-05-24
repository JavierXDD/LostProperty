package com.me.lost.service;

import java.util.List;

import com.me.lost.dao.MessageDao;
import com.me.lost.domain.Message;

public class MessageService {
	MessageDao messageDao = new MessageDao();

	//留言
	public String leaveMessage(Message message) {
		if(messageDao.leaveMessage(message) == true){
			return "留言成功！感谢您的支持！";
		}else{
			return "很抱歉，留言失败！";
		}
		
	}

	//查找所有留言
	public List<Message> findAllMessage() {
		return messageDao.findAllMessage();		
	}
	
	//删除留言
	public void deleteMessageByMid(String mid){
		messageDao.deleteMessageByMid(mid);
	}
}
