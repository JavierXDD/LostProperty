package com.me.lost.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.me.lost.domain.User;
import com.me.lost.service.UserService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class UserServlet extends BaseServlet {

	private UserService userService = new UserService();
	
	//添加用户
	public String addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//封装表单数据到User对象中
		User user = CommonUtils.toBean(request.getParameterMap(), User.class);
		
		//验证表单--------------------------------------------------------
		// 用来装载所有错误信息
		Map<String,String> errors = new HashMap<String,String>();
		// 对用户名进行校验
		String uName = user.getuName();//获取表单的username
		if(uName == null || uName.trim().isEmpty()) {
			errors.put("uName", "用户名不能为空！");
		} else if(uName.length() < 3 || uName.length() > 15) {
			errors.put("uName", "用户名长度必须在3~15之间！");
		}else if(userService.findByName(uName) != null){
			errors.put("uName", "用户名已存在！");
		}
		// 对密码进行校验
		String uPassword = user.getuPassword();
		if(uPassword == null || uPassword.trim().isEmpty()) {
			errors.put("uPassword", "密码不能为空！");
		} else if(uPassword.length() < 3 || uPassword.length() > 15) {
			errors.put("uPassword", "密码长度必须在3~15之间！");
		}
		//对二次密码校验
		uPassword = (String)request.getParameter("uPassword");
		String uPassword2 = (String)request.getParameter("uPassword2");
		if(uPassword2 == null || uPassword2.trim().isEmpty()){
			errors.put("uPassword2", "请再次输入一遍密码！");
		}else if(!uPassword.equals(uPassword2)){
			errors.put("uPassword2", "两次密码不一致！");
		}		
		// 对电话进行校验
		String uTelephone = user.getuTelephone();
		String regex="1[358]\\d{9}";
		if(uTelephone == null || uTelephone.trim().isEmpty()) {
			errors.put("uTelephone", "联系电话不能为空！");
		} else if(!uTelephone.matches(regex)) {
			errors.put("uTelephone", "请输入真实电话");
		}	
		//对验证码校验
		String sessionVerifyCode = (String) request.getSession().getAttribute("session_vcode");
		//System.out.println(sessionVerifyCode);
		String verifyCode = request.getParameter("verifyCode");
		if(verifyCode == null || verifyCode.trim().isEmpty()) {
			errors.put("verifyCode", "验证码不能为空！");
		} else if(verifyCode.length() != 4) {
			errors.put("verifyCode", "验证码长度必须为4！");
		} else if(!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
			errors.put("verifyCode", "验证码错误！");
		}
		//验证完成-------------------------------------------------------
		//判断map是否为空，不为空，说明存在错误
		if(errors != null && errors.size() > 0) {

			request.setAttribute("errors", errors);
			request.setAttribute("uName", uName);
			request.setAttribute("uTelephone", uTelephone);
			request.setAttribute("verifyCode", verifyCode);
			return "f:/regist.jsp";			
		}
						
		user.setUid(CommonUtils.uuid());
		userService.addUser(user);
		request.setAttribute("msg", "恭喜，注册成功了！");
		return "f:/msg.jsp";
	}
	
	//用户登陆功能
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		// 验证表单--------------------------------------------------------
		// 用来装载所有错误信息
		Map<String, String> errors = new HashMap<String, String>();
		// 对用户名密码进行校验
		String uName = form.getuName();// 获取表单的username
		String uPassword = form.getuPassword();
		if (uName == null || uName.trim().isEmpty()) {
			errors.put("uName", "用户名不能为空！");
		} else if (userService.findByName(form.getuName()) == null) {
			errors.put("uName", "用户名不存在！");
		} else if (uPassword == null || uPassword.trim().isEmpty()) {
			errors.put("uPassword", "密码不能为空！");
		} else if (!userService.findByName(form.getuName()).getuPassword()
				.equals(form.getuPassword())) {
			errors.put("uPassword", "密码错误！");
		}
		// 对验证码校验
		String sessionVerifyCode = (String) request.getSession().getAttribute(
				"session_vcode");

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
			request.setAttribute("uName", uName);
			request.setAttribute("uPassword", uPassword);
			request.setAttribute("verifyCode", verifyCode);
			return "f:/login.jsp";
		}
		request.setAttribute("msg", "登陆成功");
		request.getSession().setAttribute("session_user", form);
		request.getSession().setAttribute("session_uName", form.getuName());
		request.getSession().setAttribute("session_uTelephone", userService.findByName(form.getuName()).getuTelephone());
		return "f:/msg.jsp";

	}
	//注销登录
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		return "f:/index.jsp";
	}

}
