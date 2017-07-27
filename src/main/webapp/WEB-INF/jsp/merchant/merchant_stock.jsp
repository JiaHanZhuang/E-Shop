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
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>商家</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/font-awesome.css" rel="stylesheet"/>
    <!-- CUSTOM STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>

    <script type="text/javascript">
        function join() {
            var url = "${pageContext.request.contextPath}/merchant/joinActivity";
            $.post(url, {
                activityId: $("#activityId").val(),
                userId:${user.id}
            }, function (data) {
                alert(data.message);
            }, "JSON");
        }

        function addInventory(dataForm) {
            var id = dataForm.id.value;
            var inventory = dataForm.inventory.value;
            var url = "${pageContext.request.contextPath}/merchant/updataCommodity";
            $.post(url, {
                id: id,
                inventory: inventory
            }, function (data) {
                alert(data.message);
            }, "JSON");

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
                    <img src="${pageContext.request.contextPath}/resources/manager-shop/img/find_user.png"
                         class="img-responsive"/>

                </li>


                <li>
                    <a href="#"><i class="fa fa-desktop "></i>店铺首页</a>
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
                    <a href="${pageContext.request.contextPath}/merchant/merchantBackground"><i
                            class="fa fa-desktop "></i>活动公告</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>修改库存</h2>
                </div>
                <div class="col-md-8">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>描述内容</th>
                                <th>是否已上架</th>
                                <th>商品类型</th>
                                <th>库存</th>
                                <th>修改</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${commoditys.list}" var="commodity">
                                <form method="post" action="#" id="inventory${commodity.id}">
                                    <input type="hidden" value="${commodity.id}" id="id" name="id">
                                    <tr>
                                        <td>${commodity.id}</td>
                                        <td>${commodity.detail}</td>
                                        <td>
                                            <c:if test="${commodity.putaway}">
                                                已上架
                                            </c:if>
                                            <c:if test="${! commodity.putaway}">
                                                还未上架
                                            </c:if>
                                        </td>
                                        <td>${commodity.type}</td>
                                        <td>
                                            <input name="inventory" value="${commodity.inventory}" id="inventory">
                                        </td>
                                        <td>
                                            <input type="button" value="提交修改" onclick="addInventory(this.form)">
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${! commoditys.isFirstPage}">
                            <a href="${pageContext.request.contextPath}/merchant/selectMerchantStock">首页</a>
                        </c:if>

                        <c:if test="${commoditys.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/merchant/selectMerchantStock?page=${commoditys.prePage}">上一页</a>
                        </c:if>

                        <c:forEach begin="${commoditys.pageNum}" end="${commoditys.pages}" var="i">
                            <c:if test="${commoditys.pageNum<=commoditys.pages}">
                                <a href="${pageContext.request.contextPath}/merchant/selectMerchantStock?page=${i}">${i}</a>
                            </c:if>
                        </c:forEach>

                        <c:if test="${commoditys.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/merchant/selectMerchantStock?page=${commoditys.nextPage}">下一页</a>
                        </c:if>
                        <c:if test="${! commoditys.isLastPage}">
                            <a href="${pageContext.request.contextPath}/merchant/selectMerchantStock?page=${commoditys.lastPage}">末页</a>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr/>

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
