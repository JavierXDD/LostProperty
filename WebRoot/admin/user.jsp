<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=path %>/admin/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=path %>/admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="<%=path %>/admin/assets/css/style.css" rel="stylesheet">
    <link href="<%=path %>/admin/assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>丢了吗 后台管理</b></a>
            <!--logo end-->
            
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="<c:url value='/AdminServlet?method=adminQuit'/>">注销登陆</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="profile.html"><img src="<%=path %>/admin/assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">admin</h5>
              	  	
                  <li class="mt">
                      <a href="<c:url value='/MessageServlet?method=findAllMessage'/>">
                          <i class="fa fa-dashboard"></i>
                          <span>留言信息</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="<c:url value='/AdminServlet?method=findAllUser'/>" >
                          <i class="fa fa-desktop"></i>
                          <span>用户管理</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="<c:url value='/AdminServlet?method=findAllUser'/>">查看所有用户</a></li>
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a href="<c:url value='/AdminServlet?method=findAllThing'/>" >
                          <i class="fa fa-cogs"></i>
                          <span>消息管理</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="<c:url value='/AdminServlet?method=findAllThing'/>">查看所有消息</a></li>
                      </ul>
                  </li>
                  

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> 用户管理</h3>
				<i style="color: red">${msg }</i>
<div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i> 用户管理</h4>
	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-bullhorn"></i> 编号</th>
                                  <th class="hidden-phone"><i class="fa fa-question-circle"></i> 用户名</th>
                                  <th><i class="fa fa-bookmark"></i> 用户电话</th>
                                  <th></th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${pb.beanList}" var="user">
                              <tr>
                                  <td><a href="basic_table.html#">${user.uid}</a></td>
                                  <td class="hidden-phone">${user.uName}</td>
                                  <td>${user.uTelephone}</td>
                                  <td>
                                      <button class="btn btn-danger btn-xs" onclick="location='<c:url value='/AdminServlet?method=deleteUserById&uid=${user.uid }'/>'"><i class="fa fa-trash-o "></i></button>
                                  </td>
                                 </tr>
                              </c:forEach>
							</tbody>
							</table>

				<div style="text-align:center; font-size: 1.5em">
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
			</div>

			          </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
		</section>
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->

  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<%=path %>/admin/assets/js/jquery.js"></script>
    <script src="<%=path %>/admin/assets/js/bootstrap.min.js"></script>
    <script src="<%=path %>/admin/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="<%=path %>/admin/assets/js/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="<%=path %>/admin/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="<%=path %>/admin/assets/js/jquery.scrollTo.min.js"></script>
    <script src="<%=path %>/admin/assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
	
