<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
    <title>My JSP 'help.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


  </head>
  
  <body>
    <div id="top">
		<jsp:include page="top.jsp" />
		<jsp:include page="search.jsp"/>
	</div>
	<div id="list">
		
			<div class="notfound">
				<img src="img/notfound.png">
				<div class="p1">
					<p>没有找到你想要找的心爱之物？</p>
					<p>别着急，根据提示完成以下步骤，发布你想找的丢失物品！</p>
				</div>
				<div class="p2">
					<img src="img/step1.png">
					<p>第一步：添加物品的各项信息，让别人知道你要找的是什么，只要告诉别人你在何时何处</p>
					<p>丢失的什么物品，有何特征，以便他人验证您的身份</p>
				</div>
				<div class="p3">
					<img src="img/step2.png">
					<p>第二步：添加自己的各项信息，以便在有人捡到时能够联系你，同时我们也能作好记录，以免</p>
					<p>发生冒领，误领的情况，因此请务必完善个人信息</p>
				</div>
				<div class="p4">
					<p>温馨提示：要经常过来看看哦，说不定一会就有人见到了你的东西来这里发布失物招领呢</p>
					<p>单击下方立即前往发布丢失的物品，让大家都看到</p>
				</div>
				<a href="/LostProperty/share.jsp">>>立即发布信息</a>
			</div>
		</div>
	
	<jsp:include page="footer.jsp" />
  </body>
</html>
