<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/1
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="E-shop.jsp"></jsp:include>
<body>
<jsp:include page="E-shop_header.jsp"></jsp:include>
<div class="container">
    <div class="check-out">
        <c:if test="${shopCat != null}">
            <table border="10" cellpadding="10" cellspacing="1">
                <thead>
                <tr>
                    <th>商品类型</th>
                    <th>商品颜色</th>
                    <th>商品描述</th>
                    <th>商品单价</th>
                    <th>商品大小</th>
                    <th>商品数量</th>
                    <th>总价　　</th>
                    <th>订单号　</th>
                    <th>结算　　</th>
                    <th>查看商品</th>
                    <th>删除订单</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${shopCat.list}" var="orderSingle">
                    <tr>
                        <td>${orderSingle.commodity.type}</td>
                        <td>${orderSingle.commodity.color}</td>
                        <td>${orderSingle.commodity.detail}</td>
                        <td>${orderSingle.commodity.price}</td>
                        <td>${orderSingle.orderDetail.size}</td>
                        <td>${orderSingle.orderDetail.count}</td>
                        <td>${orderSingle.commodity.price * orderSingle.orderDetail.count}</td>
                        <td>${orderSingle.orderDetail.buyNumber}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/buy/selectOrder?buyNumber=${orderSingle.orderDetail.buyNumber}">结算</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/single?id=${orderSingle.commodity.id}">查看</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/buy/deleteOrder?page=${shopCat.pageNum}&id=${orderSingle.orderDetail.id}">删除该订单</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <ul class="start">
                <c:if test="${shopCat.hasPreviousPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/buy/selectShopCat?page=${shopCat.prePage}"><i></i></a>
                    </li>
                </c:if>
                <li><span>${shopCat.pageNum}</span></li>
                <c:if test="${shopCat.hasNextPage}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/buy/selectShopCat?page=${shopCat.nextPage}">${shopCat.pageNum +1}</a>
                    </li>
                </c:if>
                <c:if test="${shopCat.pageNum +2 <= shopCat.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/buy/selectShopCat?page=${shopCat.pageNum +2}">${shopCat.pageNum +2}</a>
                    </li>
                </c:if>
                <c:if test="${shopCat.pageNum +3 <= shopCat.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/buy/selectShopCat?page=${shopCat.pageNum +3}">${shopCat.pageNum +3}</a>
                    </li>
                </c:if>
                <c:if test="${shopCat.pageNum +4 <= shopCat.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/buy/selectShopCat?page=${shopCat.pageNum +4}">${shopCat.pageNum +1}</a>
                    </li>
                </c:if>
                <c:if test="${shopCat.hasNextPage}">
                    <li><a href="${pageContext.request.contextPath}/buy/selectShopCat?page=${shopCat.nextPage}"><i
                            class="next"> </i></a></li>
                </c:if>
            </ul>

        </c:if>
        <c:if test="${shopCat == null}">
            <h4 class="title">购物车为空</h4>
            <p class="cart">去添加商品吧<br>点击<a href="${pageContext.request.contextPath}/homePage">
                这里</a> 前往首页</p>
        </c:if>
    </div>
</div>
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
