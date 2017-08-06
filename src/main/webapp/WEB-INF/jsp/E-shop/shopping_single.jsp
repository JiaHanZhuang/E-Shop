<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/29
  Time: 11:52
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
<!---->
<div class="container">
    <div class="single">
        <div class="col-md-9 top-in-single">
            <div class="col-md-5 single-top">
                <!-- start product_slider -->
                <div class="flexslider">
                    <!-- FlexSlider -->
                    <script src="${pageContext.request.contextPath}/resources/E-shop/js/imagezoom.js"></script>
                    <script defer
                            src="${pageContext.request.contextPath}/resources/E-shop/js/jquery.flexslider.js"></script>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/E-shop/css/flexslider.css"
                          type="text/css" media="screen"/>

                    <script>
                        // Can also be used with $(document).ready()
                        $(window).load(function () {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
                    </script>
                    <!-- //FlexSlider-->
                    <ul class="slides">
                        <c:forEach items="${commoditySingle.paths}" var="path">
                            <li data-thumb="http://39.108.4.2/ftpuser/${path}">
                                <div class="thumb-image"><img src="http://39.108.4.2/ftpuser/${path}" height="1100" width="762"
                                                              data-imagezoom="true" class="img-responsive"></div>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <!-- end product_slider -->

            </div>
            <div class="col-md-7 single-top-in">
                <div class="single-para">
                    <h4>${commoditySingle.detail}</h4>
                    <div class="para-grid">
                        <span class="add-to">${commoditySingle.price}</span>
                        <form action="#" method="post" id="tempForm">
                            <input type="hidden" id="itemId" value="${commodity.id}" name="itemId">
                            <input type="button" onclick="addShopCat(this.form)"
                                   class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 " value="加入购物车">
                        </form>
                        <div class="clearfix"></div>
                    </div>
                    <h5>库存:${commoditySingle.inventory}</h5>
                    <form method="post" action="${pageContext.request.contextPath}/buy/createOrder" >
                    <div class="available">
                        <h6>选择款式</h6>
                        <input type="hidden" name="itemId" value="${commoditySingle.id}">
                        <input type="hidden" name="userId" value="${user.id}">
                        <ul>
                            <li>大小:<select name="size" id="size">
                                <option value="L">L</option>
                                <option value="M">M</option>
                                <option value="S">S</option>
                                <option value="XL">XL</option>
                                <option value="XXL">XXL</option>
                            </select></li>
                            <li>数量<select name="count" id="count">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select></li>
                        </ul>
                    </div>
                    <p>${commoditySingle.detail}</p>

                        <input type="submit" value="购买" class="hvr-shutter-in-vertical ">
                    <%--<button onclick="buy()">购买</button>--%>
                    <%--<a href="#" class="hvr-shutter-in-vertical " onclick="buyCommodity()">购买</a>--%>
                    </form>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="content-top-in">
                <!-- 商家其他的商品 -->
                <c:forEach items="${commodities.list}" var="commodity" begin="0" end="2">
                    <div class="col-md-4 top-single">

                        <div class="col-md">
                            <a href="${pageContext.request.contextPath}/single?id=${commodity.id}">
                                <img src="http://39.108.4.2/${commodity.paths[0]}" alt="" height="177" width="204"/>
                                <div class="top-content">
                                    <h5>${commodity.detail}</h5>
                                    <div class="white">
                                        <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                        <p class="dollar"><span
                                                class="in-dollar">$</span><span>${commodity.price}</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </div>
                </c:forEach>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="single-bottom">
                <h4>同类型商品</h4>
                <ul>
                    <c:forEach items="${commodityType.list}" var="commodity" begin="0" end="5">
                        <li><a href="#">${commodity.detail}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="single-bottom">
                <h4>类型</h4>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=laptop">笔记本电脑</a></li>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=phone">手机硬件</a></li>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=electronic">数码电子</a></li>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=woman">女装</a></li>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=man">男装</a></li>
                </ul>
            </div>
            <div class="single-bottom">
                <h4>其他商品</h4>
                <c:forEach items="${commodities.list}" var="commodity" begin="3" end="5">
                    <div class="product">
                        <a href="${pageContext.request.contextPath}/single?id=${commodity.id}">
                            <img class="img-responsive fashion"
                                 src="http://39.108.4.2/${commodity.paths[0]}" alt="" height="98" width="98">
                            <div class="grid-product">
                                <a href="#" class="elit">${commodity.detail}</a>
                                <span class="price price-in"><small>${commodity.price +100}</small>
                                        ${commodity.price}</span>
                            </div>
                            <div class="clearfix"></div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!---->
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
