<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/9
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理员系统</title>
    <jsp:include page="manager-common.jsp"/>
    <script src="${pageContext.request.contextPath}/resources/JQuery/ueditor.config.js"  type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/JQuery/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/JQuery/lang/zh-cn.js"></script>
    <script type="text/javascript">
        function formAjax(testform) {
            var txt = ue.getContentTxt();
            var url = "${pageContext.request.contextPath}/managerModel/insertActivity";
            $.post(url,{
                text:txt,
                args:new Date()
            },function (data) {
                window.location.href = "${pageContext.request.contextPath}/"+data.url;
            },"JSON");
        }

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
                    <a href="#"><i class="fa fa-table "></i>公司财政<span class="fa arrow"></span></a>
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
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>活动信息</h2>
                </div>
                <hr/>
                <div class="col-md-8">
                    <form method="post" id="textform" action="#">
                        <script id="container" name="text" type="text/plain">活动内容</script>
                        <input type="button" value="提交" onclick="formAjax(this.form)">
                    </form>
                    <!-- 实例化编辑器 -->
                    <script type="text/javascript">
                        var ue = UE.getEditor('container', {
                            toolbars: [
                                ['fullscreen', 'source', 'undo', 'redo'],
                                ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript',
                                    'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote',
                                    'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist',
                                    'insertunorderedlist', 'selectall', 'cleardoc']
                            ],
                            autoHeightEnabled: true,
                            autoFloatEnabled: true
                        });
                    </script>
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

<jsp:include page="manager-index-transcript.jsp"/>
</body>
</html>
