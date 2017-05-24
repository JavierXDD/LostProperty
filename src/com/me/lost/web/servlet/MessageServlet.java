package com.me.lost.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.me.lost.dao.MessageDao;
import com.me.lost.domain.Message;
import com.me.lost.service.MessageService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class MessageServlet extends BaseServlet {
	MessageService messageService = new MessageService();
	//留言
	public String leaveMessage  (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Message message = CommonUtils.toBean(request.getParameterMap(), Message.class);
		message.setMid(CommonUtils.uuid());
		

		String result = messageService.leaveMessage(message);
		
		request.setAttribute("result", result); 
		return "f:/index.jsp";
	}
	
	//查找所有留言
	public String findAllMessage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		List<Message> messageList = messageService.findAllMessage();
		request.setAttribute("messageList", messageList);
		return "f:/admin/message.jsp";
	}
	
	//查看留言byid
	public String deleteMessageByMid (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String mid = request.getParameter("mid");
		messageService.deleteMessageByMid(mid);
		String result = "删除成功";
		request.setAttribute("result", result);
		return "f:/admin/message.jsp";
	}
}
