<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery.datepick.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>

	<script type="text/javascript">
	$(function() {
		$("#tTime").datepick({dateFormat:"yy-mm-dd"});
	});
	</script>

	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<title>丢了么</title>
	<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
	<div id="top">
		<jsp:include page="top.jsp"/>
		<jsp:include page="search.jsp"/>
	</div>
<form method="post" action="<c:url value='/ThingServlet'/>" >
<input type="hidden" name="method" value="addThing"/>
	<div id="message">
		<div class="container">
			<div class="message-title">
				<img src="img/message.png">
			</div>
			<div class="message1">
				<img src="img/step1.png">
				<div class="input-group">
					<label>信息类型</label>
                    <select name="mType">
                                                <option value ="失物招领">失物招领</option>
                                                <option value ="寻物启事">寻物启事</option>
                                            </select>
				</div>				
				<div class="input-group time">
					<label>名称</label>
					<input type="text" name="tName" value="${tName}"><br>
					<div style="color:#F0FF00;">${errors.tName}</div>
				</div>
				<div class="input-group">
					<label>类別</label>
                    <select name="tType" >
                                                <option value ="钥匙">钥匙</option>
                                                <option value ="证件">证件</option>
                                                <option value ="金钱">金钱</option>
                                                <option value ="手机">手机</option>
                                                <option value ="水杯">水杯</option>
                                                <option value ="饭卡">饭卡</option>
                                                <option value ="其他">其他</option>
                                                <option value ="书本">书本</option>
                                            </select>
				</div>				
				<div class="input-group">
					<label>地点</label>
                    <select name="tAddress">
                                                <option value ="明德楼">明德楼</option>
                                                <option value ="食堂">食堂</option>
                                                <option value ="小树林">小树林</option>
                                                <option value ="图书馆">图书馆</option>
                                                <option value ="弘文楼">弘文楼</option>
                                                <option value ="其他">其他</option>
                                            </select>
				</div>
				<div class="input-group time">
					<label>时间</label>
					<input type="text" name="tTime" id="tTime" value="${tTime}" readonly="readonly"><br>
					<p style="color:#F0FF00;">${errors.tTime}</p>
				</div>
				<div class="input-group area">
					<label>描述</label>
					<textarea style="height:150px" name="tDescription" ></textarea><br><br><br><br><br><br><br><br>
					<p style="color:#F0FF00;">${errors.tDescription}</p>
				</div>
			</div>
			<div class="message2">
				<img src="img/step2.png">
				<div class="input-group">
					<label>姓名</label>
					<input type="text" name="uName" value="${sessionScope.session_uName}">
					<p style="color:#F0FF00;">${errors.uName}</p>
				</div>
				<div class="input-group">
					<label>手机</label>
					<input type="text" name="uTelephone" value="${sessionScope.session_uTelephone}">
					<p style="color:#F0FF00;">${errors.uTelephone}</p>
				</div>
				<p>留下您的联系方式，我们在找到物品的可能的真正主人之前</p>
				<p>将不会展示您的个人信息</p>
				<div class="buttons">
					<button type="submit" id="find-publish" name="share">>>发布信息</button>
				</div>
			</div>
		</div>
	</div>
</form>
	<jsp:include page="footer.jsp"/>

</body>
</html>