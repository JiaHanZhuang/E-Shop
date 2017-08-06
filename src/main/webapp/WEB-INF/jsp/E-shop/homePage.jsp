<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/16
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="E-shop.jsp"></jsp:include>
<body>
<jsp:include page="E-shop_header.jsp"></jsp:include>
<div class="banner-mat">
    <div class="container">
        <div class="banner">

            <!-- Slideshow 4 -->
            <div class="slider">
                <ul class="rslides" id="slider1">
                    <li><img src="${pageContext.request.contextPath}/resources/E-shop/images/banner.jpg" alt="">
                    </li>
                    <li><img src="${pageContext.request.contextPath}/resources/E-shop/images/banner1.jpg" alt="">
                    </li>
                    <li><img src="${pageContext.request.contextPath}/resources/E-shop/images/banner.jpg" alt="">
                    </li>
                    <li><img src="${pageContext.request.contextPath}/resources/E-shop/images/banner2.jpg" alt="">
                    </li>
                </ul>
            </div>

            <div class="banner-bottom">
                <div class="banner-matter">
                    <p>最新夏季新品</p>
                    <a href="${pageContext.request.contextPath}/shopping?type=woman"
                       class="hvr-shutter-in-vertical ">查看</a>
                </div>
                <div class="purchase">
                    <a href="${pageContext.request.contextPath}/shopping?type=woman"
                       class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">查看</a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //slider-->
    </div>
</div>
<!---->
<div class="container">
    <div class="content">
        <div class="content-top">
            <h3 class="future">特色</h3>
            <div class="content-top-in">
                <c:forEach items="${commoditys.list}" var="commodity">
                    <div class="col-md-3 md-col">
                        <div class="col-md">
                            <a href="${pageContext.request.contextPath}/single?id=${commodity.id}"><img
                                    src="http://39.108.4.2/ftpuser/${commodity.paths[0]}" alt="" height="177"
                                    width="204"/></a>
                            <div class="top-content">
                                <h5><a href="#">${commodity.detail}</a></h5>
                                <div class="white">
                                    <form action="#" method="post" id="tempForm">
                                        <input type="hidden" id="itemId" value="${commodity.id}" name="itemId">
                                        <input type="button" onclick="addShopCat(this.form)"
                                               class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 " value="加入购物车">
                                    </form>
                                    <p class="dollar"><span class="in-dollar">$</span><span>${commodity.price}</span>
                                    </p>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
            </div>
        </div>
        <!---->
        <div class="content-middle">
            <h3 class="future">品牌</h3>
            <div class="content-middle-in">
                <ul id="flexiselDemo1">
                    <li><img src="${pageContext.request.contextPath}/resources/E-shop/images/ap.png"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/E-shop/images/ap1.png"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/E-shop/images/ap2.png"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/E-shop/images/ap3.png"/></li>

                </ul>
                <script type="text/javascript">
                    $(window).load(function () {
                        $("#flexiselDemo1").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint: 480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint: 640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint: 768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript"
                        src="${pageContext.request.contextPath}/resources/E-shop/js/jquery.flexisel.js"></script>

            </div>
        </div>
        <!---->
        <div class="content-bottom">
            <h3 class="future">最新的</h3>
            <div class="content-bottom-in">
                <ul id="flexiselDemo2">
                    <c:forEach items="${commoditys.list}" var="commodity">
                        <li>
                            <div class="col-md men">
                                <a href="${pageContext.request.contextPath}/single?id=${commodity.id}"
                                   class="compare-in "><img src="http://39.108.4.2/ftpuser/${commodity.paths[0]}"
                                                            alt="" height="177" width="204"/>
                                    <div class="compare in-compare">
                                        <span>查看详情</span>
                                    </div>
                                </a>
                                <div class="top-content bag">
                                    <h5><a href="#">${commodity.detail}</a></h5>
                                    <div class="white">
                                        <form action="#" method="post" id="tempForm">
                                            <input type="hidden" id="itemId" value="${commodity.id}" name="itemId">
                                            <input type="button" onclick="addShopCat(this.form)"
                                                   class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 " value="加入购物车">
                                        </form>
                                        <p class="dollar"><span
                                                class="in-dollar">$</span><span>${commodity.price}</span></p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <script type="text/javascript">
                    $(window).load(function () {
                        $("#flexiselDemo2").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint: 480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint: 640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint: 768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
            </div>
        </div>
        <ul class="start">
            <c:if test="${commoditys.hasPreviousPage}">
                <li><a href="${pageContext.request.contextPath}/homePage?page=${commoditys.prePage}"><i></i></a></li>
            </c:if>
            <li><span>${commoditys.pageNum}</span></li>
            <c:if test="${commoditys.hasNextPage}">
                <li class="arrow"><a
                        href="${pageContext.request.contextPath}/homePage?page=${commoditys.nextPage}">${commoditys.pageNum +1}</a>
                </li>
            </c:if>
            <c:if test="${commoditys.pageNum +2 <= commoditys.pages}">
                <li class="arrow"><a
                        href="${pageContext.request.contextPath}/homePage?page=${commoditys.pageNum +2}">${commoditys.pageNum +2}</a>
                </li>
            </c:if>
            <c:if test="${commoditys.pageNum +3 <= commoditys.pages}">
                <li class="arrow"><a
                        href="${pageContext.request.contextPath}/homePage?page=${commoditys.pageNum +3}">${commoditys.pageNum +3}</a>
                </li>
            </c:if>
            <c:if test="${commoditys.pageNum +4 <= commoditys.pages}">
                <li class="arrow"><a
                        href="${pageContext.request.contextPath}/homePage?page=${commoditys.pageNum +4}">${commoditys.pageNum +1}</a>
                </li>
            </c:if>
            <c:if test="${commoditys.hasNextPage}">
                <li><a href="${pageContext.request.contextPath}/homePage?page=${commoditys.nextPage}"><i
                        class="next"> </i></a></li>
            </c:if>
        </ul>
    </div>
</div>
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>