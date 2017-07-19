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
<head>
    <title>E-shop</title>
    <link href="${pageContext.request.contextPath}/resources/E-shop/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resources/E-shop/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="${pageContext.request.contextPath}/resources/E-shop/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--fonts-->
    <link href='https://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet'
          type='text/css'>
    <!--//fonts-->
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/E-shop/js/move-top.js"></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/E-shop/js/easing.js"></script>--%>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <!--slider-script-->
    <script src="${pageContext.request.contextPath}/resources/E-shop/js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider1").responsiveSlides({
                auto: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
    <!--//slider-script-->
    <script>$(document).ready(function (c) {
        $('.alert-close').on('click', function (c) {
            $('.message').fadeOut('slow', function (c) {
                $('.message').remove();
            });
        });
    });
    </script>
    <script>$(document).ready(function (c) {
        $('.alert-close1').on('click', function (c) {
            $('.message1').fadeOut('slow', function (c) {
                $('.message1').remove();
            });
        });
    });
    </script>
    <jsp:include page="login_js.jsp"></jsp:include>

</head>
<body>
<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="header-top-in">
                <div class="logo">
                    <a href="#"><img src="${pageContext.request.contextPath}/resources/E-shop/images/logo.png" alt=" "></a>
                </div>
                <div class="header-in">
                    <ul class="icon1 sub-icon1">
                        <li><a href="#" onclick="checkUserIsLogin()">我的账户</a></li>
                        <li><a href="#">购物车</a></li>
                        <li><a href="#">账单</a></li>
                        <c:if test="${user!=null}">
                            <li><a href="${pageContext.request.contextPath}/logout">注销</a></li>
                        </c:if>
                        <li>
                            <div class="cart">
                                <a href="#" class="cart-in"> </a>
                                <span> 0</span>
                            </div>
                            <ul class="sub-icon1 list">
                                <h3>添加购物车中的商品</h3>
                                <div class="shopping_cart">
                                    <div class="cart_box">
                                        <div class="message">
                                            <div class="alert-close"></div>
                                            <div class="list_img"><img src="${pageContext.request.contextPath}/resources/E-shop/images/14.jpg" class="img-responsive"
                                                                       alt=""></div>
                                            <div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>1 x<span
                                                    class="actual">
		                             $12.00</span></div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="cart_box1">
                                        <div class="message1">
                                            <div class="alert-close1"></div>
                                            <div class="list_img"><img src="${pageContext.request.contextPath}/resources/E-shop/images/15.jpg" class="img-responsive"
                                                                       alt=""></div>
                                            <div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>1 x<span
                                                    class="actual">
		                             $12.00</span></div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="total">
                                    <div class="total_left">总价 :</div>
                                    <div class="total_right">$250.00</div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="login_buttons">
                                    <div class="check_button"><a href="#">结算</a></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="h_menu4">
                <a class="toggleMenu" href="#">Menu</a>
                <ul class="nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/homePage"><i> </i>首页</a></li>
                    <li><a href="#">食物&&服装</a>
                        <ul class="drop">
                            <li><a href="#">童装</a></li>
                            <li><a href="#">女装</a></li>
                            <li><a href="#">男装</a></li>
                            <li><a href="#">补品</a></li>
                            <li><a href="#">蔬菜水果</a></li>
                            <li><a href="#">零食</a></li>
                            <li><a href="#">主食</a></li>
                        </ul>
                    </li>
                    <li><a href="#">台式电脑</a></li>
                    <li><a href="#">笔记本电脑</a></li>
                    <li><a href="#">手机硬件</a></li>
                    <li><a href="#">数码电子</a></li>
                    <li><a href="#">联系我们</a></li>

                </ul>
                <script type="text/javascript" src="${pageContext.request.contextPath}/resources/E-shop/js/nav.js"></script>
            </div>
        </div>
    </div>
    <div class="header-bottom-in">
        <div class="container">
            <div class="header-bottom-on">
                <p class="wel">查询您想要的商品</p>
                <div class="header-can">
                    <div class="down-top">
                        <select class="in-drop">
                            <option value="Dollars" class="in-of">名称</option>
                            <option value="Euro" class="in-of">类型</option>
                            <option value="Yen" class="in-of">店名</option>
                        </select>
                    </div>
                    <div class="search">
                        <form>
                            <input type="text" value="内容" onFocus="this.value = '';"
                                   onBlur="if (this.value == '') {this.value = '';}">
                            <input type="submit" value="">
                        </form>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a></div>
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
                    <a href="#" class="hvr-shutter-in-vertical ">查看</a>
                </div>
                <div class="purchase">
                    <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">查看</a>
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
                <div class="col-md-3 md-col">
                    <div class="col-md">
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/E-shop/images/pi.jpg" alt=""/></a>
                        <div class="top-content">
                            <h5><a href="#">Mascot Kitty - White</a></h5>
                            <div class="white">
                                <a href="#"
                                   class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                <div class="clearfix"></div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 md-col">
                    <div class="col-md">
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/E-shop/images/pi1.jpg" alt=""/> </a>
                        <div class="top-content">
                            <h5><a href="#">Bite Me</a></h5>
                            <div class="white">
                                <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>3</span><span>0</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 md-col">
                    <div class="col-md">
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/E-shop/images/pi2.jpg" alt=""/></a>
                        <div class="top-content">
                            <h5><a href="#">Little Fella</a></h5>
                            <div class="white">
                                <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>5</span><span>0</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 md-col">
                    <div class="col-md">
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/E-shop/images/pi3.jpg" alt=""/></a>
                        <div class="top-content">
                            <h5><a href="#">Astral Cruise</a></h5>
                            <div class="white">
                                <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>4</span><span>5</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
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
                <script type="text/javascript" src="${pageContext.request.contextPath}/resources/E-shop/js/jquery.flexisel.js"></script>

            </div>
        </div>
        <!---->
        <div class="content-bottom">
            <h3 class="future">最新的</h3>
            <div class="content-bottom-in">
                <ul id="flexiselDemo2">
                    <li>
                        <div class="col-md men">
                            <a href="#" class="compare-in "><img src="${pageContext.request.contextPath}/resources/E-shop/images/pi4.jpg" alt=""/>
                                <div class="compare in-compare">
                                    <span>添加到购物车</span>
                                    <span>查看详情</span>
                                </div>
                            </a>
                            <div class="top-content bag">
                                <h5><a href="#">Symbolic Bag</a></h5>
                                <div class="white">
                                    <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">添加到购物车</a>
                                    <p class="dollar"><span class="in-dollar">$</span><span>4</span><span>0</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="col-md men">
                            <a href="#" class="compare-in "><img src="${pageContext.request.contextPath}/resources/E-shop/images/pi5.jpg" alt=""/>
                                <div class="compare in-compare">
                                    <span>添加到购物车</span>
                                    <span>查看详情</span>
                                </div>
                            </a>
                            <div class="top-content bag">
                                <h5><a href="#">Interesting Read</a></h5>
                                <div class="white">
                                    <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">添加到购物车</a>
                                    <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>5</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="col-md men">
                            <a href="#" class="compare-in "><img src="${pageContext.request.contextPath}/resources/E-shop/images/pi6.jpg" alt=""/>
                                <div class="compare in-compare">
                                    <span>添加到购物车</span>
                                    <span>查看详情</span>
                                </div>
                            </a>
                            <div class="top-content bag">
                                <h5><a href="#">The Carter</a></h5>
                                <div class="white">
                                    <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">添加到购物车</a>
                                    <p class="dollar"><span class="in-dollar">$</span><span>1</span><span>0</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="col-md men">
                            <a href="#" class="compare-in "><img src="${pageContext.request.contextPath}/resources/E-shop/images/pi7.jpg" alt=""/>
                                <div class="compare in-compare">
                                    <span>添加到购物车</span>
                                    <span>查看详情</span>
                                </div>
                            </a>
                            <div class="top-content bag">
                                <h5><a href="#">Onesie</a></h5>
                                <div class="white">
                                    <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">添加到购物车</a>
                                    <p class="dollar"><span class="in-dollar">$</span><span>6</span><span>0</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </li>

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
            <li><a href="#"><i></i></a></li>
            <li><span>1</span></li>
            <li class="arrow"><a href="#">2</a></li>
            <li class="arrow"><a href="#">3</a></li>
            <li class="arrow"><a href="#">4</a></li>
            <li class="arrow"><a href="#">5</a></li>
            <li><a href="#"><i class="next"> </i></a></li>
        </ul>
    </div>
</div>
<!---->
<div class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="col-md-4 footer-in">
                <h4><i> </i>Suspendisse sed</h4>
                <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam.
                    Lorem ipsum dolor sit amet, consectetur.</p>
            </div>
            <div class="col-md-4 footer-in">
                <h4><i class="cross"> </i>Suspendisse sed</h4>
                <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam.
                    Lorem ipsum dolor sit amet, consectetur.</p>
            </div>
            <div class="col-md-4 footer-in">
                <h4><i class="down"> </i>Suspendisse sed</h4>
                <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam.
                    Lorem ipsum dolor sit amet, consectetur.</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!---->
    <div class="footer-middle">
        <div class="container">
            <div class="footer-middle-in">
                <h6>About us</h6>
                <p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique
                    nisi, in interdum libero magna tristique ante. adipiscing varius. Vestibulum dolor lorem.</p>
            </div>
            <div class="footer-middle-in">
                <h6>客户服务</h6>
                <ul>
                    <li><a href="#">联系我们</a></li>
                    <li><a href="#">地图</a></li>
                </ul>
            </div>
            <div class="footer-middle-in">
                <h6>账户</h6>
                <ul>
                    <li><a href="#" onclick="checkUserIsLogin()">我的账户</a></li>
                    <li><a href="#">订单历史</a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.More Templates <a
            href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a
            href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
    <script type="text/javascript">
        $(document).ready(function () {
            /*
             var defaults = {
             containerID: 'toTop', // fading element id
             containerHoverID: 'toTopHover', // fading element hover id
             scrollSpeed: 1200,
             easingType: 'linear'
             };
             */

            $().UItoTop({easingType: 'easeOutQuart'});

        });
    </script>
    <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</div>
<jsp:include page="login_common.jsp"></jsp:include>
</body>
</html>