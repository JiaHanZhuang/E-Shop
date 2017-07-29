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
<head>
    <title>E-shop</title>
    <link href="${pageContext.request.contextPath}/resources/E-shop/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resources/E-shop/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="${pageContext.request.contextPath}/resources/E-shop/css/style.css" rel="stylesheet" type="text/css"
          media="all"/>
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
                                            <div class="list_img"><img
                                                    src="${pageContext.request.contextPath}/resources/E-shop/images/14.jpg"
                                                    class="img-responsive"
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
                                            <div class="list_img"><img
                                                    src="${pageContext.request.contextPath}/resources/E-shop/images/15.jpg"
                                                    class="img-responsive"
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
                            <li><a href="${pageContext.request.contextPath}/shopping?type=child">童装</a></li>
                            <li><a href="${pageContext.request.contextPath}/shopping?type=woman">女装</a></li>
                            <li><a href="${pageContext.request.contextPath}/shopping?type=man">男装</a></li>
                            <li><a href="${pageContext.request.contextPath}/shopping?type=tonic">补品</a></li>
                            <li><a href="${pageContext.request.contextPath}/shopping?type=fruits">蔬菜水果</a></li>
                            <li><a href="${pageContext.request.contextPath}/shopping?type=snacks">零食</a></li>
                            <li><a href="${pageContext.request.contextPath}/shopping?type=food">主食</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=desktop">台式电脑</a></li>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=laptop">笔记本电脑</a></li>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=phone">手机硬件</a></li>
                    <li><a href="${pageContext.request.contextPath}/shopping?type=electronic">数码电子</a></li>
                    <li><a href="#">联系我们</a></li>

                </ul>
                <script type="text/javascript"
                        src="${pageContext.request.contextPath}/resources/E-shop/js/nav.js"></script>
            </div>
        </div>
    </div>
    <div class="header-bottom-in">
        <div class="container">
            <div class="header-bottom-on">
                <p class="wel"><a href="#">查询您想要的商品</a></p>
                <div class="header-can">
                    <div class="down-top">
                        <select class="in-drop">
                            <option value="Dollars" class="in-of">名称</option>
                            <option value="Euro" class="in-of">类型</option>
                        </select>
                    </div>
                    <div class="search">
                        <form>
                            <input type="text" value="Search" onfocus="this.value = '';"
                                   onblur="if (this.value == '') {this.value = '';}">
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
                    <li><a href="${pageContext.request.contextPath}/map">地图</a></li>
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
