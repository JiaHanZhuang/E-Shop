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
    <jsp:include page="manager-common.jsp"/>
    <script type="text/javascript">
        function install() {
            var url = "${pageContext.request.contextPath}/install/action";
            var args = {"time": new Date()}
            $.getJSON(url,args,function(data){
                alert(data.message);
            });
        }

        function checkAjax (loginform1) {
            if(loginform1.password.value==""){       //验证密码是否为空
                alert("请输入密码！");
                loginform1.password.focus();
                return false;
            }
            var password = loginform1.password.value;
            var old_password =${manager.password};
            if(password == old_password) {
                openLoginModal1();
            } else {
                alert("输入错误,请重新输入");
            }
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
                <a class="navbar-brand" href="#"><i class="fa fa-square-o "></i>${manager.name}管理员</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" href="javascript:void(0)" onclick="openLoginModal()">修改密码</a></li>
                    <li><a href="${pageContext.request.contextPath}/loginManager/logoutManager">退出登录</a></li>
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
                    <a href="${pageContext.request.contextPath}/loginManager/managerIndex"><i class="fa fa-desktop "></i>首页</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table"></i>公司财政<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/managerModel/financialList">公司财政</a>
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
                            <a href="#">活动<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/managerModel/Activity">发布活动</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/managerModel/selectActivity">查看活动</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/managerModel/creatQRCode"><i class="fa fa-qrcode "></i>生成二维码</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>二维码</h2>
                    <img src="/QRcode/${QR}" class="img-responsive" width="260px"/>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="manager-index-transcript.jsp"/>
</body>
</html>
