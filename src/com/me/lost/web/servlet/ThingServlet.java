package com.me.lost.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.me.lost.domain.PageBean;
import com.me.lost.domain.Thing;
import com.me.lost.service.ThingService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class ThingServlet extends BaseServlet {
	
	private ThingService thingService = new ThingService();
	
	//发布消息
	public String addThing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//封装表单数据到Thing对象中
		Thing form = CommonUtils.toBean(request.getParameterMap(), Thing.class);
		
		// 验证表单--------------------------------------------------------
				// 用来装载所有错误信息
				Map<String, String> errors = new HashMap<String, String>();
				//验证是否登陆
				if(request.getSession().getAttribute("session_user") == null){
					request.setAttribute("msg", "未登录，请登录！");
					return "f:/login.jsp";
				}
				// 对物品名进行校验
				String tName = form.gettName();
				if (tName == null || tName.trim().isEmpty()) {
					errors.put("tName", "请输入物品的名称");
				}
				// 对发现时间进行校验
				String tTime = form.gettTime();
				if (tTime == null || tTime.trim().isEmpty()) {
					errors.put("tTime", "请输入发现或丢失物品的时间");
				}
				//对物品描述校验
				String tDescription = form.gettDescription();
				if (tDescription == null || tDescription.trim().isEmpty()) {
					errors.put("tDescription", "给这个物品写点描述吧");
				}
				
				//对联系人姓名校验
				String uName = request.getParameter("uName");
				if (uName == null || uName.trim().isEmpty()) {
					errors.put("uName", "请填写称呼，方便联系");
				}
				//对联系人电话校验
				String uTelephone = request.getParameter("uTelephone");
				String regex="1[358]\\d{9}";
				if (uTelephone == null || uTelephone.trim().isEmpty()) {
					errors.put("uTelephone", "请填写联系电话，方便联系");
				}else if(!uTelephone.matches(regex)){
					errors.put("uTelephone", "请填写正确的联系电话，方便联系");
				}
				

				// 验证完成-------------------------------------------------------
				// 判断map是否为空，不为空，说明存在错误
				if (errors != null && errors.size() > 0) {

					request.setAttribute("errors", errors);
					request.setAttribute("tName", tName);
					request.setAttribute("tTime", tTime);
					request.setAttribute("tDiscription", tDescription);
					return "f:/share.jsp";
				}				
				form.setTid(CommonUtils.uuid());
				thingService.addThing(form);
				request.setAttribute("msg", "发布信息成功");
				return "f:/msg.jsp";

	}
	
	
/*	//显示所有消息
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Thing> listThing = thingService.findAll();
		request.setAttribute("listThing", listThing);
		return "f:/find.jsp";
	}*/
	
	

	//显示所有消息
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int pc = getPC(request);
		int ps = 10;
		PageBean<Thing> pb = thingService.findAll(pc,ps);
		pb.setUrl(getUrl(request));
		request.setAttribute("pb", pb);
		return "f:/find.jsp";
	}
	
	//获取pageCode 当前页数
	private int getPC(HttpServletRequest request){
		String pc = request.getParameter("pc");
		if(pc == null || pc.trim().isEmpty()){
			return 1;
		}
		return Integer.parseInt(pc);		
	}
	
	//单个消息的详细信息
	public String detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tid = request.getParameter("tid");
		Thing one = thingService.detail(tid);
		request.setAttribute("one", one);
		return "f:/detail.jsp";
	}
	
	//认领
	public String want(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//验证是否登陆
		if(request.getSession().getAttribute("session_user") == null){
			request.setAttribute("msg", "*** 请先登录！***");
			return "f:/login.jsp";
		}
		String tid = request.getParameter("tid");
		String gName = request.getParameter("gName");
		String gTelephone = request.getParameter("gTelephone");
		thingService.want(tid,gName,gTelephone);
		request.setAttribute("msg", "认领申请已提交");
		return "f:/msg.jsp";
	}
	
	//搜索
	public String query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String search = request.getParameter("search").trim();
		search = new String(search.getBytes("iso8859-1"),"UTF-8");
		//System.out.println(search);
		
		int pc = getPC(request);//得到pc
		int ps = 10;//给定ps的值，第页10行记录
		PageBean<Thing> pb = thingService.query(search, pc, ps);
		
		// 得到url，保存到pb中
		pb.setUrl(getUrl(request));
		
		request.setAttribute("pb", pb);
		return "f:/find.jsp";
		
	}
	
	//个人中心
	public String person(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String session_uName = (String) request.getSession().getAttribute("session_uName");
		String session_uTelephone = (String) request.getSession().getAttribute("session_uTelephone");
		
		List<Thing> listThing = thingService.person(session_uName,session_uTelephone);
		request.setAttribute("listThing", listThing);
		return "f:/person.jsp";
	}
	
	//截取URL
	private String getUrl(HttpServletRequest request) {
		String contextPath = request.getContextPath();//获取项目名
		String servletPath = request.getServletPath();//获取servletPath，即/CustomerServlet
		String queryString = request.getQueryString();//获取问号之后的参数部份
		
		//  判断参数部份中是否包含pc这个参数，如果包含，需要截取下去，不要这一部份。
		if(queryString.contains("&pc=")) {
			int index = queryString.lastIndexOf("&pc=");
			queryString = queryString.substring(0, index);
		}
		
		return contextPath + servletPath + "?" + queryString;
	}

}
