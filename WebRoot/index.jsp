<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<title>丢了么</title>
	<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
	<div id="top">
	<jsp:include page="top.jsp"/>
		
		<div id="time">
			<div class="arrow arrow-left">
				<a href="share.jsp">
					<img src="img/left.png">
					<p>我要找失主</p>
				</a>
			</div>
			<div class="timing">
				<ul>
					<li id="day">
						<span class="figure">-</span>
						<span class="unit">Days</span>
					</li>
					<li id="hour">
						<span class="figure">-</span>
						<span class="unit">Hours</span>
					</li>
					<li id="minute">
						<span class="figure">-</span>
						<span class="unit">Minutes</span>
					</li>
					<li id="second">
						<span class="figure">-</span>
						<span class="unit">Seconds</span>
					</li>
				</ul>
			</div>
			<div class="arrow arrow-right">
				<a href="<c:url value='/ThingServlet?method=findAll'/>">
					<img src="img/right.png">
					<p>我丢东西了</p>
				</a>
			</div>
			<div class="finding">
				<span>F</span><span>i</span><span>n</span><span>d</span><span class="green">i</span><span class="green">n</span><span>g</span>
				<div id="all-time">
					<p style="font-family:'黑体'" id="never-stop">一直在寻找，从不曾停歇</p>
				</div>
			</div>
		</div>
	</div>

	
	<jsp:include page="footer.jsp"/>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</body>
</html>