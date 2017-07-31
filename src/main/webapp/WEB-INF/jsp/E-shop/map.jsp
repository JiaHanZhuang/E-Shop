<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/28
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<jsp:include page="E-shop.jsp"></jsp:include>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=0fYwzvlB9LUcWcWLKCeB8Ig42gX8QEMc"></script>
<body>
<!--header-->
<jsp:include page="E-shop_header.jsp"></jsp:include>
<!---->
<div class="container">
    <div class="banner">
        <div style="width:600px;height:300px;border:#ccc solid 1px;font-size:12px" id="map"></div>
        <script src="${pageContext.request.contextPath}/resources/E-shop/js/map.js" type="text/javascript"></script>
        <script type="text/javascript">
            //创建和初始化地图函数：
            function initMap() {
                createMap();//创建地图
                setMapEvent();//设置地图事件
                addMapControl();//向地图添加控件
                addMapOverlay();//向地图添加覆盖物
            }
            initMap();
        </script>
    </div>
</div>

<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>