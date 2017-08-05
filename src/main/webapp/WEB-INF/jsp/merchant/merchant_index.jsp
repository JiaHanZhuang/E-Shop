<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/25
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>商家</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <script type="text/javascript">
        function join () {
            var url ="${pageContext.request.contextPath}/merchant/joinActivity";
            $.post(url,{
                activityId:$("#activityId").val(),
                userId:${user.id}
            },function (data) {
                alert(data.message);
            },"JSON");
        }
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
                <a class="navbar-brand" href="#"><i class="fa fa-square-o "></i>商家后台</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/homePage">退回首页</a></li>
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
                    <a href="#"><i class="fa fa-table "></i>商品管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/merchant/addCommodityAction">添加商品</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/merchant/selectMerchantStock?id=${user.id}">增加库存</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/merchant/selectMerchantPutaway?id=${user.id}">商品上下架</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/merchant/merchantBackground"><i class="fa fa-desktop "></i>活动公告</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>活动公告</h2>
                </div>
                <div class="col-md-8">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>内容</th>
                                <th>是否过期</th>
                                <th>参加活动</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${activities.list}" var="activity">
                                <tr>
                                    <td>${activity.id}</td>
                                    <td>${activity.text}</td>
                                    <td>
                                        <c:if test="${activity.deadline}">
                                            过期
                                        </c:if>
                                        <c:if test="${! activity.deadline}">
                                            还未过期
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${! activity.deadline}">
                                            <input type="hidden" value="${activity.id}" id="activityId">
                                            <a href="#" onclick="join()">参加</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${! activities.isFirstPage}">
                            <a href="${pageContext.request.contextPath}/merchant/merchantBackground">首页</a>
                        </c:if>

                        <c:if test="${activities.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/merchant/merchantBackground?page=${activities.prePage}">上一页</a>
                        </c:if>

                        <c:forEach begin="${activities.pageNum}" end="${activities.pages}" var="i">
                            <c:if test="${activities.pageNum<=activities.pages}" >
                                <a href="${pageContext.request.contextPath}/merchant/merchantBackground?page=${i}">${i}</a>
                            </c:if>
                        </c:forEach>

                        <c:if test="${activities.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/merchant/merchantBackground?page=${activities.nextPage}">下一页</a>
                        </c:if>
                        <c:if test="${! activities.isLastPage}">
                            <a href="${pageContext.request.contextPath}/merchant/merchantBackground?page=${activities.lastPage}">末页</a>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />

            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/JQuery/jquery-3.2.1.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/custom.js"></script>


</body>
</html>
