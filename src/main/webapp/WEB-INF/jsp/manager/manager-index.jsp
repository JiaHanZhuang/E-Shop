<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/7
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理员系统</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <script type="text/javascript">
        $(function(){
            $("#install").click(function(){
                var url = "${pageContext.request.contextPath}/install";
                var args = {"time": new Date()}
                $.getJSON(url,args,function(data){
                    alert(data.message);
                });
            });
        })
    </script>
</head>
<body>
<div id="wrapper">
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="adjust-nav">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><i class="fa fa-square-o "></i>${manager.name}管理员</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">修改密码</a></li>
                    <li><a href="#">退出登录</a></li>
                </ul>
            </div>

        </div>
    </div>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center user-image-back">
                    <img src="${pageContext.request.contextPath}/resources/manager-shop/img/find_user.png" class="img-responsive" />
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/login/managerIndex"><i class="fa fa-desktop "></i>首页</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table"></i>公司财政<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#">导入公司财政</a>
                        </li>
                        <li>
                            <a href="#">导出公司财政</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-sitemap "></i>查看<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#">商家</a>
                        </li>
                        <li>
                            <a href="#">公司财政</a>
                        </li>
                        <li>
                            <a href="#">活动<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="#">发布活动</a>
                                </li>
                                <li>
                                    <a href="#">查看活动</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-qrcode "></i>生成二维码</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>e商城管理员指示版</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-md-6 col-sm-3 col-xs-6">
                    <h5>商标</h5>
                    <img src="${pageContext.request.contextPath}/resources/manager-shop/img/e.jpg" class="img-responsive" width="260px"/>
                </div>
                <div class="col-md-4">
                    <h5>商城简介</h5>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            简介
                        </div>
                        <div class="panel-body">
                            <p>其实就是这个不存在的东西</p>
                        </div>
                        <div class="panel-footer">
                            2017/07/06
                        </div>
                    </div>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
            <div class="row">
                <div class="col-md-6">
                    <h5>管理员功能</h5>
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">功能 #1</a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse" style="height: 0px;">
                                <div class="panel-body">
                                    发布/终止 优惠活动
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">功能 #2</a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse in" style="height: auto;">
                                <div class="panel-body">
                                    安装系统（即向数据库插入有关于商品的类型的数据）.
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" class="collapsed">功能 #3</a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse">
                                <div class="panel-body">
                                    将恶意店家从网站中去除
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <label>安装系统</label>
                    <a id="install" target="_blank" class="btn btn-danger btn-lg btn-block">安装</a>
                </div>
            </div>
            <div class="row">
            </div>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/JQuery/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/custom.js"></script>


</body>
</html>