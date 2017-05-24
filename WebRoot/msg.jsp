<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
	<title>丢了么</title>
	<link rel="stylesheet" type="text/css" href="css/index.css">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="3;url=index.jsp">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

<body>
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<div id="top">
		<jsp:include page="top.jsp" /><br> <br>
		<h1 style="color:white;" align="center">${msg }</h1>
		<div style="text-align:center;">
			<a style="color:white;" href="index.jsp">三秒后自动跳转到主页，若未自动跳转请单击此处</a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</body>
</html>
