<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<title>真正跳转，请稍等....</title>
<body>
<h2>Hello World!</h2>
<a href="${pageContext.request.contextPath}/loginManager/skip">跳转后台</a>
<a href="${pageContext.request.contextPath}/register">跳转注册</a>
<a href="${pageContext.request.contextPath}/homePage">首页</a>
<%--<script language='javascript'>document.location = '${pageContext.request.contextPath}/homePage'</script>--%>
</body>
</html>
