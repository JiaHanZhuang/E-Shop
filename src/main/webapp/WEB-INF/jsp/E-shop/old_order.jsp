<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 20:51
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
        <c:if test="${order.list.size() > 0}">
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
                    <th>购买时间</th>
                    <th>查看商品</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${order.list}" var="orderSingle">
                    <tr>
                        <td>${orderSingle.commodity.type}</td>
                        <td>${orderSingle.commodity.color}</td>
                        <td>${orderSingle.commodity.detail}</td>
                        <td>${orderSingle.commodity.price}</td>
                        <td>${orderSingle.orderDetail.size}</td>
                        <td>${orderSingle.orderDetail.count}</td>
                        <td>${orderSingle.commodity.price * orderSingle.orderDetail.count}</td>
                        <td>${orderSingle.orderDetail.buyNumber}</td>
                        <td><fmt:formatDate value="${orderSingle.orderDetail.buyTime}"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/single?id=${orderSingle.commodity.id}">查看</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <ul class="start">
                <c:if test="${order.hasPreviousPage}">
                    <li><a href="${pageContext.request.contextPath}/buy/selectBill?page=${order.prePage}"><i></i></a></li>
                </c:if>
                <li><span>${order.pageNum}</span></li>
                <c:if test="${order.hasNextPage}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/buy/selectBill?page=${order.nextPage}">${order.pageNum +1}</a>
                    </li>
                </c:if>
                <c:if test="${order.pageNum +2 <= order.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/buy/selectBill?page=${order.pageNum +2}">${order.pageNum +2}</a>
                    </li>
                </c:if>
                <c:if test="${order.pageNum +3 <= order.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/buy/selectBill?page=${order.pageNum +3}">${order.pageNum +3}</a>
                    </li>
                </c:if>
                <c:if test="${order.pageNum +4 <= order.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/buy/selectBill?page=${order.pageNum +4}">${order.pageNum +1}</a>
                    </li>
                </c:if>
                <c:if test="${order.hasNextPage}">
                    <li><a href="${pageContext.request.contextPath}/buy/selectBill?page=${order.nextPage}"><i
                            class="next"> </i></a></li>
                </c:if>
            </ul>

        </c:if>
        <c:if test="${order.list.size() == 0}">
            <h4 class="title">账单为空</h4>
            <p class="cart">去添加商品吧<br>点击<a href="${pageContext.request.contextPath}/homePage">
                这里</a> 前往首页</p>
        </c:if>
    </div>
</div>
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
