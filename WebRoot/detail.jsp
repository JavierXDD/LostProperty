<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<title>丢了么</title>
	<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
	<div id="top">
		<jsp:include page="top.jsp"/>
		<jsp:include page="search.jsp"/>
	</div>
	<div class="concrete" id="conc">
		<div class="news-concrete">
			<span>信息详情</span>
		</div>
		<div class="news-container">
			<span id="label">关键字</span><p>${one.mType}&nbsp;&nbsp; ${one.tType}</p>
			<span id="label">状态</span><p>${one.tState}</p>
			<span id="label">主题</span><p>${one.tName}</p>
			<span id="label">编号</span><p>${one.tid}</p>
			<span id="label">地点</span><p>${one.tAddress}</p>
			<span id="label">时间</span><p>${one.tTime}</p>
			<span id="label">详情</span>
			
		</div>
		<div class="para">
			<p>${one.tDescription}</p>
		</div>
		<div id="news-contain">
			<div class="issue">
				<h1>发布者:</h1>
				<p>姓名：${one.uName}</p>
				<p>手机：${one.uTelephone}</p>
			</div>
			<div class="mine">
				<h1>我的信息</h1>
				<form action="<c:url value='/ThingServlet'/>" method="post">
				<input type="hidden" name="method" value="want"/>
				<input type="hidden" name="tid" value="${one.tid}"/>
					姓名：<input type="text" name="gName" value="${sessionScope.session_uName}" readonly="readonly">
					手机：<input type="text" name="gTelephone" value="${sessionScope.session_uTelephone}" readonly="readonly">
					<div class="want">
					<input type="submit" value="我要认领">
					</div>
				</form>
			</div>			
		</div>
		<div class="news-concrete">
			<span></span>
		</div>
		<div class="send-message" id="right-now">
			<p>没有找到丢失的宝贝？立刻<a href="/LostProperty/share.jsp">发布新消息</a>!</p>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>