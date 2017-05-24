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
			<form action="<c:url value='/AdminServlet'/>" method="post">
				<input type="hidden" name="method" value="login" /> 
				<input type="text" class="user" placeholder="管理员名" name="aName" value="${aName }">
				<div style="color:red;">${errors.aName}</div>
				<input type="password" class="upassword" placeholder="密码"name="aPassword">
				<div style="color:red;">${errors.aPassword}</div>

				<input type="text" name="verifyCode" placeholder="验证码" class="vc" value="${verifyCode }" /> 
					<img id="vCode" src="<c:url value='/VerifyCodeServlet'/>" /> 
					<a href="javascript:_change()" style="color:white;">换一张</a>
				<div style="color:red;">${errors.verifyCode}</div>
				
				<input type="submit" class="right" value="登录">
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />


</body>
</html>