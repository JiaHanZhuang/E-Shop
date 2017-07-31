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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="E-shop.jsp"></jsp:include>
</head>
<body>
<!--header-->
<jsp:include page="E-shop_header.jsp"></jsp:include>

<div class="container">
    <div class="account">
        <h2 class="account-in">个人资料</h2>
        <div>
            <span>姓名　　</span>
            <input type="text" value="${User.userExpand.name}" disabled="disabled">
        </div>
        <div>
            <span class="name-in">昵称　　</span>
            <input type="text" value="${User.userBasic.userName}" disabled="disabled">
        </div>
        <div>
            <span class="name-in">会员等级</span>
            <input type="text" value="${User.userBasic.member}" disabled="disabled">
        </div>
        <div>
            <span class="word">积分　　</span>
            <input type="text" value="${User.userBasic.integral}" disabled="disabled">
        </div>
        <div>
            <span class="mail">邮箱</span>
            <input type="text" value="${User.userBasic.email}" disabled="disabled">
        </div>
        <div>
            <span class="word">性别　　</span>
            <input type="text" value="${User.userExpand.sex?'男':'女'}" disabled="disabled">
        </div>
        <div>
            <span class="word">年龄　　</span>
            <input type="text" value="${User.userExpand.age}" disabled="disabled">
        </div>
        <div>
            <span class="word">手机号码</span>
            <input type="text" value="${User.userExpand.phone}" disabled="disabled">
        </div>
        <div>
            <span class="word">出生日期</span>
            <input type="text" value="<fmt:formatDate value='${User.userExpand.birthday}'/>" disabled="disabled">
        </div>
        <div>
            <span class="word">账号余额</span>
            <input type="text" value="${User.userBasic.money}" disabled="disabled">
        </div>
        <div>
            <span class="word">修改</span>
            <a href="${pageContext.request.contextPath}/passwordAction"><button>修改密码</button></a>
            <a href="${pageContext.request.contextPath}/updateBySelectUser?id=${User.userBasic.id}"><button>修改个人信息</button></a>
        </div>
        <c:if test="${User.userBasic.shop}">
            <div>
                <span class="word">进入</span>
                <a href="${pageContext.request.contextPath}/merchant/merchantBackground"><button>店铺后台</button></a>
            </div>
        </c:if>
        <div>
            <a href="#" onclick="openPayModal()"><button>充值</button></a>
        </div>
    </div>
</div>
<!---->
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
