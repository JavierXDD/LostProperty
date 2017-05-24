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
                      <a href=""<c:url value='/AdminServlet?method=findAllFMessage'/>"">
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
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>修改信息</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 信息详情</h4>
                      <form class="form-horizontal style-form" action="<c:url value='/AdminServlet'/>" method="post">
                      <input type="hidden" name="method" value="editThing">
                      	 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">信息编号：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="tid" value="${one.tid }" size="40">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">信息类型：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="tType" value="${one.tType }">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">主题：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="tName" value="${one.tName }">
                              </div>
                          </div>                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">关键字：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="mType" value="${one.mType }">
                              </div>
                          </div>                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">地址：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="tAddress" value="${one.tAddress }">
                              </div>
                          </div> 
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">时间：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="tTime" value="${one.tTime }">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">描述：</label>
                              <div class="col-sm-10">
                                  <textarea name="tDescription" cols="40" rows="2">${one.tDescription }</textarea>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">发布者姓名：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="uName" value="${one.uName }">
                              </div>
                          </div>                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">发布者手机：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="uTelephone" value="${one.uTelephone }">
                              </div>
                          </div>                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">申请者姓名：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="gName" value="${one.gName }">
                              </div>
                          </div>                           
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">申请者手机：</label>
                              <div class="col-sm-10">
                                  <input type="text" name="gTelephone" value="${one.gTelephone }">
                              </div>
                          </div>
                                                                         
                         </div> 
                     
                          <button type="submit" class=" btn btn-theme">确认修改</button>
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->      	
		</section><! --/wrapper -->
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
