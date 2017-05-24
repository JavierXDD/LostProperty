<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript">
	function _change() {
		//1.获取<img>元素
		var ele = document.getElementById("vCode");
		ele.src = "<c:url value='/VerifyCodeServlet'/>?xxx="
				+ new Date().getTime();
	}
</script>
</head>
<body>
	<div id="top">
		<jsp:include page="top.jsp" />
		<div id="log">
			<form action="<c:url value='/UserServlet'/>" method="post">
				<input type="hidden" name="method" value="login" />
				<div style="color:white;">${msg}</div>
				<input type="text" class="user" placeholder="用户名" name="uName" value="${uName }">
				<div style="color:red;">${errors.uName}</div>
				<input type="password" class="upassword" placeholder="密码"name="uPassword">
				<div style="color:red;">${errors.uPassword}</div>

				<input type="text" name="verifyCode" placeholder="验证码" class="vc" value="${verifyCode }" /> 
					<img id="vCode" src="<c:url value='/VerifyCodeServlet'/>" /> 
					<a href="javascript:_change()" style="color:white;">换一张</a>
				<div style="color:red;">${errors.verifyCode}</div>
				<input type="button" class="left" value="前去注册"onclick="location='regist.jsp'"> 
				<input type="submit" class="right" value="登陆">
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />


</body>
</html>