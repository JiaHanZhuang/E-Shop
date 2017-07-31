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
<jsp:include page="E-shop.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/TimePlugIn/My97DatePicker/WdatePicker.js"
        type="text/javascript"></script>
<body>
<!--header-->
<jsp:include page="E-shop_header.jsp"></jsp:include>

<div class="container">
    <div class="account">
        <h2 class="account-in">修改个人资料</h2>
        <form method="post" action="${pageContext.request.contextPath}/updateInformation">
            <input type="hidden" value="${User.userBasic.id}" name="id">
            <div>
                <span>姓名　　</span>
                <input type="text" value="${User.userExpand.name}" name="name">
            </div>
            <div>
                <span class="name-in">昵称　　</span>
                <input type="text" value="${User.userBasic.userName}" name="userName">
            </div>
            <div>
                <span class="word">性别　　</span>
                <select name="sex">
                    <option value="true"
                            <c:if test="${User.userExpand.sex}">selected="selected"</c:if>
                    >男
                    </option>
                    <option value="false"
                            <c:if test="${! User.userExpand.sex}">selected="selected"</c:if>
                    >女
                    </option>
                </select>
            </div>
            <div>
                <span class="word">年龄　　</span>
                <input type="text" value="${User.userExpand.age}" name="age">
            </div>
            <c:if test="${User.userExpand.phone == null}">
                <div>
                    <span class="word">手机号码</span>
                    <input type="text" value="${User.userExpand.phone}" name="phone">
                </div>
            </c:if>
            <div>
                <span class="word">出生日期</span>
                <input type="text" style="height: 40px;width: 60%" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                       value="<fmt:formatDate value='${User.userExpand.birthday}'/>" name="birthday">
            </div>
            <div>
                <input value="修改" type="submit">
            </div>
        </form>
    </div>
</div>
<!---->
<jsp:include page="E-shop_footer.jsp"></jsp:include>
</body>
</html>
