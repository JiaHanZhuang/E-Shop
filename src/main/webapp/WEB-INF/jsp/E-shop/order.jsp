<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/30
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<jsp:include page="E-shop.jsp"></jsp:include>
<script type="text/javascript">
    function buyCommodity() {
        var url = "${pageContext.request.contextPath}/buy/buyCommodity";
        var params  = $("#buyForm").serialize();
        $.ajax({
            type:"POST",
            url:url,
            data:params,
            dataType:"json",
            success:function (data) {
                if(data.url!=null) {
                    alert(data.message);
                    window.location.href ="${pageContext.request.contextPath}"+data.url;
                } else {
                    alert(data.message);
                }
            }
        });
    }
</script>
<body>
<jsp:include page="E-shop_header.jsp"></jsp:include>
<div class="container">
    <div class="account">
        <h2 class="account-in">订单信息</h2>
        <form action="#" method="post" id="buyForm">
            <input type="hidden" name="orderId" value="${orderAndCommodity.orderDetail.id}">
            <input type="hidden" name="id" value="${orderAndCommodity.commodity.id}">
            <input type="hidden" name="commodityId" value="${orderAndCommodity.commodity.commodityId}">
            <input type="hidden" name="count" value="${orderAndCommodity.orderDetail.count}">
        <div>
            <span>姓名　　</span>
            <input type="text" disabled="disabled" value="${User.userExpand.name}">
        </div>
        <div>
            <span>联系电话</span>
            <input type="text" disabled="disabled" value="${User.userExpand.phone}">
        </div>
        <div>
            <span>联系邮箱</span>
            <input type="text" disabled="disabled" value="${User.userBasic.email}">
        </div>
        <div>
            <span>订单号码</span>
            <input type="text" disabled="disabled" value="${orderAndCommodity.orderDetail.buyNumber}">
        </div>
        <div>
            <span>购买数量</span>
            <input type="text" disabled="disabled" value="${orderAndCommodity.orderDetail.count}">
        </div>
        <div>
            <span>商品单价</span>
            <input type="text" disabled="disabled" value="${orderAndCommodity.commodity.price}">
        </div>
        <div>
            <span>商品大小</span>
            <input type="text" disabled="disabled" value="${orderAndCommodity.orderDetail.size}">
        </div>
        <div>
            <span>支付金额</span>
            <input type="text" disabled="disabled"
                   value="${orderAndCommodity.orderDetail.count * orderAndCommodity.commodity.price}">
        </div>
        <div>
            <span>账户余额</span>
            <input type="text" disabled="disabled" value="${User.userBasic.money}">
        </div>
        <div>
            <span>商品颜色</span>
            <input type="text" disabled="disabled" value="${orderAndCommodity.commodity.color}">
        </div>
        <div>
            <span>商品描述</span><span>${orderAndCommodity.commodity.detail}</span>
        </div>
        <div>
            <span>商品类型</span>
            <input type="text" disabled="disabled" value="${orderAndCommodity.commodity.type}">
        </div>
        <div>
            <input type="button" value="购买" onclick="buyCommodity()">
        </div>
        </form>
        <div>
            <a href="${pageContext.request.contextPath}/homePage">
                <button>放弃回到首页</button>
            </a>
            <a href="#" onclick="openPayModal()">
                <button>充值</button>
            </a>
        </div>
    </div>
</div>
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
