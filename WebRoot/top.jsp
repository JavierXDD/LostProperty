<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<div id="header">
			<div class="container">
				<div class="eager-logo">
					<c:choose>
  					<c:when test="${empty sessionScope.session_user}"><p style="color:white;font-size:18px">请先登录！</p></c:when>
  					<c:otherwise>
  					<p style="color:white;font-size:18px">欢迎 ${sessionScope.session_uName }</p>
  					</c:otherwise>
  					</c:choose>
				</div>
				<div class="navigation">
					<c:choose>
					<c:when test="${empty sessionScope.session_user}">
					<ul>
						<li><a href="index.jsp" class="active">首页</a></li>
						<li><a href="login.jsp">登录/注册</a></li>
						<li><a href="<c:url value='/ThingServlet?method=findAll'/>">寻找失物</a></li>
						<li><a href="share.jsp">发布消息</a></li>
						<li><a href="help.jsp">帮助</a></li>
					</ul></c:when>
					<c:otherwise>
					<ul>
						<li><a href="index.jsp" class="active">首页</a></li>
						<li><a href="<c:url value='/UserServlet?method=quit'/>">注销登录</a></li>
						<li><a href="<c:url value='/ThingServlet?method=person'/>">个人中心</a></li>
						<li><a href="<c:url value='/ThingServlet?method=findAll'/>">寻找失物</a></li>
						<li><a href="share.jsp">发布消息</a></li>
						<li><a href="">帮助</a></li>
					</ul></c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="diuleme-logo">
			<img src="img/logo-line.png" class="line">
			<img src="img/diuleme.png" class="diuleme">
			<img src="img/logo-line.png" class="line">
		</div>
