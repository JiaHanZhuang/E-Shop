<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/14
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/login_register/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/login_register/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>注册</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/login_register/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/login_register/assets/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/login_register/assets/css/demo.css" rel="stylesheet" />
    <script type="text/javascript">
        function checkRegister() {
            var url = "${pageContext.request.contextPath}/checkRegisterInformation";
            var params = $("#information").serialize();
            $.ajax({
                type:"POST",
                url:url,
                data:params,
                dataType: "json",
                success:function (data) {
                    if(data.url==null){
                        alert(data.message);
                    } else {
                        var url = "${pageContext.request.contextPath}"+data.url;
                        $.ajax({
                            type:"POST",
                            url:url,
                            data:params,
                            dataType: "json",
                            success:function (result) {
                                if(result.url==null){
                                    alert(result.message);
                                } else {
                                    window.location.href = "${pageContext.request.contextPath}"+result.url;
                                }
                            }
                        });
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="image-container set-full-height" style="background-image: url('${pageContext.request.contextPath}/resources/login_register/assets/img/wizard.jpg')">
    <!--   Creative Tim Branding   -->
    <a href="#">
        <div class="logo-container">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/resources/login_register/assets/img/new_logo.png">
            </div>
            <div class="brand">
                Creative Tim
            </div>
        </div>
    </a>

    <!--  Made With Get Shit Done Kit  -->
    <a href="#${pageContext.request.contextPath}/resources/login_register/get-shit-done/index.html?ref=get-shit-done-bootstrap-wizard" class="made-with-mk">
        <div class="brand">登录</div>
        <div class="made-with">前往 <strong>登录</strong></div>
    </a>

    <!--   Big container   -->
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">

                <!--      Wizard container        -->
                <div class="wizard-container">

                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form action="${pageContext.request.contextPath}/creatUser" method="post" id="information">
                            <!--        You can switch ' data-color="orange" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                            <div class="wizard-header">
                                <h3>
                                    <b>注册</b>你的信息 <br>
                                    <small>这些信息会让我们更加了解您</small>
                                </h3>
                            </div>

                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">基本</a></li>
                                    <li><a href="#account" data-toggle="tab">身份</a></li>
                                    <li><a href="#address" data-toggle="tab">结果</a></li>
                                </ul>

                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <h4 class="info-text"> 基本信息验证</h4>
                                        <div class="col-sm-4 col-sm-offset-1">
                                            <div class="picture-container">
                                                <div class="picture">
                                                    <img src="${pageContext.request.contextPath}/resources/login_register/assets/img/default-avatar.png" class="picture-src" id="wizardPicturePreview" title=""/>
                                                    <input type="file" id="wizard-picture">
                                                </div>
                                                <h6>头像</h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>您的名字 <small>(必填)</small></label>
                                                <input name="name" type="text" class="form-control" placeholder="姓名.">
                                            </div>
                                            <div class="form-group">
                                                <label>密码<small>(必填)</small></label>
                                                <input name="password" type="password" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-sm-10 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>邮箱 <small>(必填)</small></label>
                                                <input name="email" type="email" class="form-control" placeholder="andrew@creative-tim.com">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="account">
                                    <h4 class="info-text"> 你想以什么身份注册(单选) </h4>
                                    <div class="row">

                                        <div class="col-sm-10 col-sm-offset-1">
                                            <div class="col-sm-6">
                                                <div class="choice" data-toggle="wizard-radio">
                                                    <input type="radio" name="shop" value="true">
                                                    <div class="icon">
                                                        <i class="fa fa-terminal"></i>
                                                    </div>
                                                    <h6>商家</h6>
                                                </div>

                                            </div>
                                            <div class="col-sm-6">
                                                <div class="choice" data-toggle="wizard-radio">
                                                    <input type="radio" name="shop" value="false">
                                                    <div class="icon">
                                                        <i class="fa fa-laptop"></i>
                                                    </div>
                                                    <h6>用户</h6>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane" id="address">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4 class="info-text"> 完善信息（可跳过） </h4>
                                        </div>
                                        <div class="col-sm-7 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>手机号码</label>
                                                <input type="text" class="form-control" name="phone">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>年龄</label>
                                                <input type="text" class="form-control" name="age">
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group">
                                                <c:if test="${allErrors != null}">
                                                    <c:forEach items="${allErrors}" var="error">
                                                        ${error.defaultMessage}
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="form-group">
                                                <label>性别</label><br>
                                                <select name="sex" class="form-control">
                                                    <option value="true"> 男 </option>
                                                    <option value="false"> 女 </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-footer height-wizard">
                                <div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='下一步' />
                                    <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='确认' onclick="checkRegister()"/>

                                </div>

                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='上一步' />
                                </div>
                                <div class="clearfix"></div>
                            </div>

                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div><!-- end row -->
    </div> <!--  big container -->

    <div class="footer">
        <div class="container">
            made with <i class="fa fa-heart heart"></i> by <a href="#">Creative Tim</a>. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
        </div>
    </div>

</div>

</div>
</body>
<script src="${pageContext.request.contextPath}/resources/JQuery/jquery-3.2.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/login_register/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/login_register/assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/login_register/assets/js/gsdk-bootstrap-wizard.js"></script>
<script src="${pageContext.request.contextPath}/resources/login_register/assets/js/jquery.validate.min.js"></script>
</html>
