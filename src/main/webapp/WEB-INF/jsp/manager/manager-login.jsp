<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/7
  Time: 1:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>管理员系统</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <style>body{padding-top: 60px;}</style>

    <link href="${pageContext.request.contextPath}/resources/login/css/bootstrap.css" rel="stylesheet" />

    <link href="${pageContext.request.contextPath}/resources/login/css/login-register.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

    <script src="${pageContext.request.contextPath}/resources/JQuery/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/login/js/login-register.js" type="text/javascript"></script>
    <script type="text/javascript">
        function loginAjax(loginform) {
            if(loginform.username.value==""){       //验证用户名是否为空
                alert("请输入用户名！");
                loginform.username.focus();
                return false;
            }
            if(loginform.password.value==""){       //验证密码是否为空
                alert("请输入密码！");
                loginform.password.focus();
                return false;
            }
            var username = loginform.username.value;
            var password = loginform.password.value;
            var url = "${pageContext.request.contextPath}/loginManager/logincheckManager";
            $.post(url,{
                name:username,
                password:password
            },function(data){
                var path = data.url;
                if(path==null) {
                    alert("您输入的用户名或密码有错！");
                    loginform.username.focus();
                    return false;
                } else {
                    //跳转到页面去
                    window.location.href = "${pageContext.request.contextPath}/"+path;
                }
            },"JSON");
        }

    </script>
</head>
<body>
<div class="container">
        <div class="col-sm-5"></div>
        <div class="col-sm-2">
            <a class="btn big-login" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">登录</a></div>
        <div class="col-sm-5"></div>
</div>


    <div class="modal fade login" id="loginModal">
        <div class="modal-dialog login animated">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">请输入账号和密码</h4>
                </div>
                <div class="modal-body">
                    <div class="box">
                        <div class="content">
                            <div class="error"></div>
                            <div class="form loginBox">
                                <form method="post" id="loginform" name="loginform" action="#" accept-charset="UTF-8">
                                    <input  class="form-control" type="text" placeholder="账号" name="username">
                                    <input  class="form-control" type="password" placeholder="密码" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="登录" onclick="loginAjax(this.form)">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
