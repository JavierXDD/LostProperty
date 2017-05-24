<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>丢了么</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>

	<div class="list-content">
		<div class="type" id="ac">
			<ul id="ty">
				<li><a href="<c:url value='/ThingServlet?method=person'/>">我参与的</a></li>
			</ul>
		</div>
		<div class="cont">
			<div class="cont-list">
				<ul id="thing-name">
					<c:forEach items="${listThing}" var="thing">
						<li><span>【${thing.tType}】【${thing.mType}】【${thing.tState}】</span>
							<p>${thing.tName}</p> <span id='time1'>${thing.tTime}</span> <a
							href="<c:url value='/ThingServlet?method=detail&tid=${thing.tid }'/>">详情</a>
						</li>
					</c:forEach>
				</ul>
				<br><br>				
			</div>
		</div>
	</div>
	<div class="send-message" id="right-now">
		<p>
			没有找到丢失的宝贝？立刻<a href="/LostProperty/share.jsp">发布新消息</a>!
		</p>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>