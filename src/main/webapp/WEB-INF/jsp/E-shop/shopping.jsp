<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="E-shop.jsp"></jsp:include>
<body>
<!--header-->
<jsp:include page="E-shop_header.jsp"></jsp:include>

<div class="container">
    <div class="products">
        <h2 class=" products-in">PRODUCTS</h2>
        <c:if test="${commodities.list.size() > 0}">
            <div class=" top-products">
                <c:forEach items="${commodities.list}" var="commodity" begin="0" end="3">
                    <div class="col-md-3 md-col">
                        <div class="col-md">
                            <a href="${pageContext.request.contextPath}/single?id=${commodity.id}" class="compare-in"><img
                                    src="http://39.108.4.2/ftpuser/${commodity.paths[0]}" alt=""
                                    height="177" width="204"/>
                                <div class="compare">
                                    <span>查看详情</span>
                                </div>
                            </a>
                            <div class="top-content">
                                <h5><a href="#">${commodity.detail}</a></h5>
                                <div class="white">
                                    <form action="#" method="post" id="tempForm">
                                        <input type="hidden" id="itemId" value="${commodity.id}" name="itemId">
                                        <input type="button" onclick="addShopCat(this.form)"
                                               class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 " value="加入购物车">
                                    </form>
                                    <p class="dollar"><span class="in-dollar">$</span><span>${commodity.price}</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
            </div>
            <div class=" top-products">
                <c:forEach items="${commodities.list}" var="commodity" begin="4" end="7">
                    <div class="col-md-3 md-col">
                        <div class="col-md">
                            <a href="${pageContext.request.contextPath}/single?id=${commodity.id}" class="compare-in"><img
                                    src="http://39.108.4.2/ftpuser/${commodity.paths[0]}" alt=""
                                    height="177" width="204"/>
                                <div class="compare">
                                    <span>查看详情</span>
                                </div>
                            </a>
                            <div class="top-content">
                                <h5><a href="#">${commodity.detail}</a></h5>
                                <div class="white">
                                    <form action="#" method="post" id="tempForm">
                                        <input type="hidden" id="itemId" value="${commodity.id}" name="itemId">
                                        <input type="button" onclick="addShopCat(this.form)"
                                               class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 " value="加入购物车">
                                    </form>
                                    <p class="dollar"><span class="in-dollar">$</span><span>${commodity.price}</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
            </div>
            <ul class="start">
                <c:if test="${commodities.hasPreviousPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/shopping?page=${commodities.prePage}&type=${type}"><i></i></a>
                    </li>
                </c:if>
                <c:if test="${commodities.pageNum -4 > 0}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/shopping?page=${commodities.pageNum -4}&type=${type}">${commodities.pageNum -4}</a>
                    </li>
                </c:if>
                <c:if test="${commodities.pageNum -3 > 0}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/shopping?page=${commodities.pageNum -3}&type=${type}">${commodities.pageNum -3}</a>
                    </li>
                </c:if>
                <c:if test="${commodities.pageNum -2 > 0}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/shopping?page=${commodities.pageNum -2}&type=${type}">${commodities.pageNum -2}</a>
                    </li>
                </c:if>
                <c:if test="${commodities.hasPreviousPage}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/shopping?page=${commodities.prePage}&type=${type}">${commodities.pageNum -1}</a>
                    </li>
                </c:if>
                <li><span>${commodities.pageNum}</span></li>
                <c:if test="${commodities.hasNextPage}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/shopping?page=${commodities.nextPage}&type=${type}">${commodities.pageNum +1}</a>
                    </li>
                </c:if>
                <c:if test="${commodities.pageNum +2 <= commodities.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/shopping?page=${commodities.pageNum +2}&type=${type}">${commodities.pageNum +2}</a>
                    </li>
                </c:if>
                <c:if test="${commodities.pageNum +3 <= commodities.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/shopping?page=${commodities.pageNum +3}&type=${type}">${commodities.pageNum +3}</a>
                    </li>
                </c:if>
                <c:if test="${commodities.pageNum +4 <= commodities.pages}">
                    <li class="arrow"><a
                            href="${pageContext.request.contextPath}/shopping?page=${commodities.pageNum +4}&type=${type}">${commodities.pageNum +4}</a>
                    </li>
                </c:if>
                <c:if test="${commodities.hasNextPage}">
                    <li><a href="${pageContext.request.contextPath}/shopping?page=${commodities.nextPage}&type=${type}"><i
                            class="next"> </i></a></li>
                </c:if>
            </ul>
        </c:if>
        <c:if test="${commodities.list.size() == 0}">
            <h4 class="title">商品还未上架,请等待商家上架商品</h4>
            <p class="cart">去看其他商品吧<br>点击<a href="${pageContext.request.contextPath}/homePage">
                这里</a> 前往首页</p>
        </c:if>
    </div>
</div>
<!---->
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
