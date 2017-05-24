<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="find">
			<form action="<c:url value='/ThingServlet'/>" method="get">
				<input type="hidden" name="method" value="query"/>
				<input type="text" class="find-what" name="search">
				<input type="submit" class="sure" value="">
			</form>
		</div>
		<div class="seek">
			<span>搜索：</span>
			<ul>
				<li><a href="<c:url value='/ThingServlet?method=query&search=钥匙'/>">钥匙</a></li>
				<li><a href="<c:url value='/ThingServlet?method=query&search=书本'/>">书本</a></li>
				<li><a href="<c:url value='/ThingServlet?method=query&search=手机'/>">手机</a></li>
				<li><a href="<c:url value='/ThingServlet?method=query&search=明德楼'/>">明德楼</a></li>
				<li><a href="<c:url value='/ThingServlet?method=query&search=操场'/>">操场</a></li>
				<LI><a href="<c:url value='/ThingServlet?method=query&search=食堂'/>">食堂</a></LI>
				<li id="help"><a href="help.jsp">&gt;&gt;帮助</a></li>
			</ul>
		</div>