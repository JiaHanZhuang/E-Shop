<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/27
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
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
        function login(loginform){
            if(loginform.email.value==""){
                alert("请输入邮箱！");
                loginform.email.focus();
                return false;
            }
            if(loginform.password.value==""){
                alert("请输入密码！");
                loginform.password.focus();
                return false;
            }
            var url = "${pageContext.request.contextPath}/login"
            $.post(url,{
                email:loginform.email.value,
                password:loginform.password.value
            },function (data) {
                if(data.url==null){
                    alert(data.message);
                } else {
                    window.location.href = "${pageContext.request.contextPath}"+data.url;
                }
            },"JSON");
        }
    </script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <a class="btn big-login" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">登录</a>
            <a class="btn big-register" data-toggle="modal" href="${pageContext.request.contextPath}/register" >注册</a></div>
        <div class="col-sm-4"></div>
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
                                <form method="post" action="#" accept-charset="UTF-8" id="loginform">
                                    <input  class="form-control" type="text" placeholder="账号" name="email" id="email">
                                    <input  class="form-control" type="password" placeholder="密码" name="password" id="password">
                                    <input class="btn btn-default btn-login" type="button" value="登录" onclick="login(this.form)">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="forgot login-footer">
                            <span>还没有账号？
                                 <a href="${pageContext.request.contextPath}/register">注册</a>
                            ?</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
