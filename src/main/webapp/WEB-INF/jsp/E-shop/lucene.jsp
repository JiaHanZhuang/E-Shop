<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/5
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="E-shop.jsp"></jsp:include>

<body>
<jsp:include page="E-shop_header.jsp"></jsp:include>

<div class="container">
    <div class="check-out">
        <h2>搜索结果</h2>
        <c:if test="${commodities.size() > 0}">
            <table border="10" cellpadding="10" cellspacing="1">
                <thead>
                <tr>
                    <th>商品描述</th>
                    <th>查看此商品</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${commodities}" var="commodity">
                    <tr>
                        <td>${commodity.detail}</td>
                        <td><a href="${pageContext.request.contextPath}/single?id=${commodity.id}">查看</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${commodities.size() == 0}">
            <h3>查无此结果点击<a href="${pageContext.request.contextPath}/homePage">此处</a>返回首页</h3>
        </c:if>
    </div>
</div>

<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
