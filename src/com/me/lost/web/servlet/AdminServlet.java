package com.me.lost.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.me.lost.domain.Admin;
import com.me.lost.domain.PageBean;
import com.me.lost.domain.Thing;
import com.me.lost.domain.User;
import com.me.lost.service.AdminService;
import com.me.lost.service.ThingService;
import com.me.lost.service.UserService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class AdminServlet extends BaseServlet {
	
	AdminService adminService = new AdminService();
	ThingService thingService = new ThingService();
	UserService userService = new UserService();
	//管理员登陆
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admin form = CommonUtils.toBean(request.getParameterMap(), Admin.class);
		
		Map<String,String> errors = new HashMap<String, String>();
		
		String aName = form.getaName();
		String aPassword = form.getaPassword();
		
		if (aName == null || aName.trim().isEmpty()) {
			errors.put("aName", "用户名不能为空！");
		} else if (adminService.findByName(form.getaName()) == null) {
			errors.put("uName", "用户名不存在！");
		} else if (aPassword == null || aPassword.trim().isEmpty()) {
			errors.put("uPassword", "密码不能为空！");
		} else if (!adminService.findByName(form.getaName()).getaPassword()
				.equals(form.getaPassword())) {
			errors.put("uPassword", "密码错误！");
		}
		// 对验证码校验
		String sessionVerifyCode = (String) request.getSession().getAttribute(
				"session_vcode");
		//System.out.println(sessionVerifyCode);
		String verifyCode = request.getParameter("verifyCode");
		if (verifyCode == null || verifyCode.trim().isEmpty()) {
			errors.put("verifyCode", "验证码不能为空！");
		} else if (verifyCode.length() != 4) {
			errors.put("verifyCode", "验证码长度必须为4！");
		} else if (!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
			errors.put("verifyCode", "验证码错误！");
		}

		// 验证完成-------------------------------------------------------
		// 判断map是否为空，不为空，说明存在错误
		if (errors != null && errors.size() > 0) {

			request.setAttribute("errors", errors);
			request.setAttribute("uName", aName);
			request.setAttribute("uPassword", aPassword);
			request.setAttribute("verifyCode", verifyCode);
			return "f:/adminLogin.jsp";
		}
		return "f:/admin/index.jsp";
	}
	
	//管理员注销
	public String adminQuit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.getSession().invalidate();
		return "f:/index.jsp";
	}
	//显示全部消息
	public String findAllThing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pc = getPC(request);
		int ps = 10;
		PageBean<Thing> pb = thingService.findAll(pc,ps);
		pb.setUrl(getUrl(request));
		request.setAttribute("pb", pb);
		return "f:/admin/thing.jsp";
	}
	
	//编辑-查详细信息
	public String detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tid = request.getParameter("tid");
		Thing one = thingService.detail(tid);
		request.setAttribute("one", one);
		
		return "f:admin/editThing.jsp";
	}
	
	//删除信息
	public String deleteThing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String tid = request.getParameter("tid");		
		adminService.deleteThing(tid);
		request.setAttribute("msg", "删除成功");
		return "f:admin/msg.jsp";
	}
	//编辑信息
	public String editThing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Thing thing = CommonUtils.toBean(request.getParameterMap(), Thing.class);
		adminService.editThing(thing);
		request.setAttribute("msg", "编辑成功！");
		return "f:/admin/msg.jsp";
	}
	
	//显示全部用户
	public String findAllUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pc = getPC(request);
		int ps = 10;
		PageBean<User> pb = adminService.findAllUser(pc,ps);
		pb.setUrl(getUrl(request));
		request.setAttribute("pb", pb);
		return "f:/admin/user.jsp";
	}
	//删除用户
	public String deleteUserById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pc = getPC(request);
		int ps = 10;
		String uid = request.getParameter("uid");
		String msg = userService.deleteUserById(uid);
		request.setAttribute("msg", msg);
		return this.findAllUser(request, response);
	}
	
	//获取pageCode 当前页数
	private int getPC(HttpServletRequest request){
		String pc = request.getParameter("pc");
		if(pc == null || pc.trim().isEmpty()){
			return 1;
		}
		return Integer.parseInt(pc);		
	}
	//截取URL
	private String getUrl(HttpServletRequest request) {
		String contextPath = request.getContextPath();//获取项目名
		String servletPath = request.getServletPath();//获取servletPath，即/CustomerServlet
		String queryString = request.getQueryString();//获取问号之后的参数部份			
			//  判断参数部份中是否包含pc这个参数，如果包含，需要截取下去，不要这一部份
		if(queryString.contains("&pc=")) {
			int index = queryString.lastIndexOf("&pc=");
			queryString = queryString.substring(0, index);
		}
		
		return contextPath + servletPath + "?" + queryString;
	}
}
