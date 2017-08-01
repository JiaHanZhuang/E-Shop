<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/30
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <li><a href="${pageContext.request.contextPath}/buy/selectShopCat">购物车</a></li>
                        <li><a href="${pageContext.request.contextPath}/buy/selectBill">账单</a></li>
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
                <p class="wel">查询您想要的商品</p>
                <div class="header-can">
                    <div class="down-top">
                        <select class="in-drop">
                            <option value="Dollars" class="in-of">名称</option>
                            <option value="Euro" class="in-of">类型</option>
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
