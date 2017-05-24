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
<style type="text/css">
#top{
	background-image: url(img/banner.jpg);
	background-repeat: no-repeat;
	background-size: 100%; 
	height: 666px;
}
</style>
</head>
<body>
	<div id="top">
		<jsp:include page="top.jsp" />
		<div id="log">
			<form action="<c:url value='/UserServlet'/>" method="post">
				<input type="hidden" name="method" value="addUser" /> 
				<input type="text" class="user" placeholder="用户名" id="user" name="uName"value="${uName }"> 
				<span style="color:red;">${errors.uName}</span>
				<input type="password" class="upassword" placeholder="密码" id="password1" name="uPassword"> 
				<span style="color:red;">${errors.uPassword}</span>
				<input type="password" class="upassword" placeholder="确认密码" id="password2" name="uPassword2"> 
				<span style="color:red;">${errors.uPassword2}</span>
				<input type="text" class="user" placeholder="联系电话" id="user"name="uTelephone" value="${uTelephone }"> 
				<span style="color:red;">${errors.uTelephone}</span> 
				<input type="text" name="verifyCode" placeholder="验证码" class="vc" value="${verifyCode }" /> 
				<img id="vCode" src="<c:url value='/VerifyCodeServlet'/>" /> 
				<a href="javascript:_change()" style="color:red">换一张</a>
				<div style="color:red;">${errors.verifyCode}</div>
				<input type="button" class="left" onclick="location='login.jsp'"value="返回登陆"> 
				<input type="submit" class="right" id="register" value="立即注册">
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />

	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>

</body>
</html>