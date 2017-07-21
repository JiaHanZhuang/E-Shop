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

<!-- 修改密码 -->
<div class="modal fade login" id="updatePassword">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">请输入新密码</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="post" id="passwordform" accept-charset="UTF-8"
                                  action="${pageContext.request.contextPath}/updatePassword" >
                                <input type="hidden" value="${user.id}" name="id">
                                <input type="hidden" value="${user.email}" name="email">
                                <input  class="form-control" type="password" placeholder="密码" name="password">
                                <input class="btn btn-default btn-login" type="submit" value="修改">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--验证码-->
<div class="modal fade login" id="identifying_code">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">请输入验证码</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="post" id="codeform" accept-charset="UTF-8"
                                  action="#" >
                                <input class="form-control" type="text" placeholder="验证码" name="identifyingCode">
                                <input class="btn btn-default btn-login" type="button" value="修改" onclick="checkIdentifyingCode(this.form)">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 支付输入框 -->
<div class="modal fade login" id="payCode">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">请输入充值金额</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="post" id="payform" accept-charset="UTF-8"
                                  action="${pageContext.request.contextPath}/pay" >
                                <input name="id" type="hidden" value="${user.id}">
                                <input class="form-control" type="text" placeholder="充值金额" name="money">
                                <input class="btn btn-default btn-login" type="submit" value="充值" >
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
