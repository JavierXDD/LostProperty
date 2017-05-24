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
	<div id="top">
		<jsp:include page="top.jsp" />
		<jsp:include page="search.jsp" />
	</div>

	<div class="list-content">
		<div class="type" id="ac">
			<ul id="ty">
				<li><a href="<c:url value='/ThingServlet?method=findAll'/>">显示全部</a></li>
			</ul>
		</div>
		<div class="cont">
			<div class="cont-list">
				<ul id="thing-name">
					<c:forEach items="${pb.beanList}" var="thing">
						<li><span>【${thing.tType}】【${thing.mType}】【${thing.tState}】</span>
							<p>${thing.tName}</p> <span id='time1'>${thing.tTime}</span> <a
							href="<c:url value='/ThingServlet?method=detail&tid=${thing.tid }'/>">详情</a>
						</li>
					</c:forEach>
				</ul>
				<br><br>
				<center>
					第${pb.pc }页/共${pb.tp }页 <a href="${pb.url }&pc=1">首页</a>
					<c:if test="${pb.pc > 1 }">
						<a href="${pb.url }&pc=${pb.pc-1}">上一页</a>
					</c:if>

					<%-- 计算begin、end --%>
					<c:choose>
						<%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
						<c:when test="${pb.tp <= 10 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="${pb.tp }" />
						</c:when>
						<c:otherwise>
							<%-- 当总页数>10时，通过公式计算出begin和end --%>
							<c:set var="begin" value="${pb.pc-5 }" />
							<c:set var="end" value="${pb.pc+4 }" />
							<%-- 头溢出 --%>
							<c:if test="${begin < 1 }">
								<c:set var="begin" value="1" />
								<c:set var="end" value="10" />
							</c:if>
							<%-- 尾溢出 --%>
							<c:if test="${end > pb.tp }">
								<c:set var="begin" value="${pb.tp - 9 }" />
								<c:set var="end" value="${pb.tp }" />
							</c:if>
						</c:otherwise>
					</c:choose>
					<%-- 循环遍历页码列表 --%>
					<c:forEach var="i" begin="${begin }" end="${end }">
						<c:choose>
							<c:when test="${i eq pb.pc }">
								[${i }]
							</c:when>
							<c:otherwise>
								<a href="${pb.url }&pc=${i}">[${i }]</a>
							</c:otherwise>
						</c:choose>

					</c:forEach>

					<c:if test="${pb.pc < pb.tp }">
						<a href="${pb.url }&pc=${pb.pc+1}">下一页</a>
					</c:if>
					<a href="${pb.url }&pc=${pb.tp}">尾页</a>
				</center>
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