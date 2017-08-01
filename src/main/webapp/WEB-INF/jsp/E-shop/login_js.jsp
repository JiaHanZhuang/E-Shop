<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/17
  Time: 0:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<link href="${pageContext.request.contextPath}/resources/login/css/bootstrap.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/resources/login/css/login-register.css" rel="stylesheet" />
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

<%--<script src="${pageContext.request.contextPath}/resources/JQuery/jquery-3.2.1.js" type="text/javascript"></script>--%>
<script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.js" type="text/javascript"></script>
<%--<script src="${pageContext.request.contextPath}/resources/login/js/login-register.js" type="text/javascript"></script>--%>
<script src="${pageContext.request.contextPath}/resources/E-shop/js/login.js" type="text/javascript"></script>
<script type="text/javascript">
    function checkUserIsLogin() {
        if(${user==null}) {
            openLoginModal();
        } else {
            window.location.href = "${pageContext.request.contextPath}/information?id=${user.id}";
        }
    }
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

    function addShopCat(temp) {
        var itemId = temp.itemId.value;
        var url = "${pageContext.request.contextPath}/shoppingCart/add";
        if(${user.id == null}) {
            window.location.href="${pageContext.request.contextPath}/loginSkip";
        } else {
            $.ajax({
                type: "GET",
                url: url,
                data:{"itemId":itemId},
                dataType: "json",
                success:function (data) {
                    alert(data.message);
                }
            });
        }
    }

</script>
