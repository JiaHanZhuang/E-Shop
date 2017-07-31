<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/17
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="E-shop.jsp"></jsp:include>
<script type="text/javascript">
    function checkPassword(update_password) {
        var url = "${pageContext.request.contextPath}/checkPassword?id=${user.id}";
        var old_password = update_password.old_password.value
        if (old_password == null) {
            alert("密码不能为空");
        } else {
            $.post(url, {
                old_password: old_password
            }, function (data) {
                if (data.url == null) {
                    alert(data.message);
                } else {
                    openPasswordModal();
                }
            }, "JSON");
        }
    }


    function phone() {
        var url = "${pageContext.request.contextPath}/passwordByPhone";
        $.post(url, {
            id:${user.id}
        }, function (data) {
            if (data.message != null) {
                alert(data.message);
            } else {
                openCodeModal();
            }
        }, "JSON");
    }

    function email() {
        var url = "${pageContext.request.contextPath}/passwordByEmail";
        $.post(url, {
            id:${user.id}
        }, function (data) {
            if (data.message != null) {
                alert(data.message);
            } else {
                openCodeModal();
            }
        }, "JSON");
    }

    function checkIdentifyingCode(codeform) {
        var url = "${pageContext.request.contextPath}/checkIdentifyingCode";
        $.post(url, {
            identifyingCode: codeform.identifyingCode.value
        }, function (data) {
            if (data.url == null) {
                alert(data.message);
            } else {
                closeCodeModal();
                openPasswordModal();
            }
        }, "JSON");
    }

</script>
<body>
<!--header-->
<jsp:include page="E-shop_header.jsp"></jsp:include>

<div class="container">
    <div class="account">
        <h2 class="account-in">修改密码</h2>
        <form action="#" id="update_password" method="post">
            <div>
                <span class="word">原密码</span>
                <input type="password" name="old_password">
            </div>
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <input type="button" value="确认" onclick="checkPassword(this.form)">
            </div>
        </form>
        <span class="word">忘记密码</span>
        <a href="#" onclick="phone()">
            <button>手机找回</button>
        </a>
        <a href="#" onclick="email()">
            <button>邮箱找回</button>
        </a>
    </div>
</div>
<!---->
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
