<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<title>安装页面</title>
<script src="${pageContext.request.contextPath}/resources/JQuery/jquery-3.2.1.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function(){
        $("#install").click(function(){
            var url = "${pageContext.request.contextPath}/install";
            var args = {"time": new Date()}
            $.getJSON(url,args,function(data){
                alert(data.message);
            });
        });
    })
</script>
<body>
<h2>Hello World!</h2>
<input type="button" id="install" value="安装">
<a href="${pageContext.request.contextPath}/loginManager/skip">跳转</a>
</body>
</html>
