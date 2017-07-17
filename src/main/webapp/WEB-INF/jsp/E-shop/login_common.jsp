<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/17
  Time: 0:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

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
                                <input id="email" class="form-control" type="text" placeholder="邮箱" name="email" >
                                <input id="password" class="form-control" type="password" placeholder="密码" name="password">
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
