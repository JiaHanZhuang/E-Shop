<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/25
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>商家</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="${pageContext.request.contextPath}/resources/manager-shop/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"  type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>



<div id="wrapper">
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="adjust-nav">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><i class="fa fa-square-o "></i>,您好</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/homePage">退回首页</a></li>
                </ul>
            </div>

        </div>
    </div>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center user-image-back">
                    <img src="${pageContext.request.contextPath}/resources/manager-shop/img/find_user.png" class="img-responsive" />

                </li>

                <li>
                    <a href="#"><i class="fa fa-table "></i>商品管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="${pageContext.request.contextPath}/merchant/addCommodityAction">添加商品</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/merchant/selectMerchantStock?id=${user.id}">增加库存</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/merchant/selectMerchantPutaway?id=${user.id}">商品上下架</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/merchant/merchantBackground"><i class="fa fa-desktop "></i>活动公告</a>
                </li>
            </ul>

        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>添加商品</h2>
                    <form method="post" id="commodityform" action="#">
                        <input type="hidden" value="${user.id}" name="userId">
                        <div>
                            <span>商品一级类型</span>
                            <select id="firstCommodity">
                                <option>请选择...</option>
                                <c:forEach items="${typeList}" var="commodityType">
                                    <option value="${commodityType.id}">${commodityType.typeName}</option>
                                </c:forEach>
                            </select>
                            <span>商品二级类型</span>
                            <select id="secondCommodity" name="type">
                                <option>请选择...</option>
                            </select>
                        </div>
                        <hr/>
                        <div >
                            <span>商品颜色　</span>
                            <select name="color">
                                <option selected="selected">紫色</option>
                                <option>红色</option>
                                <option>蓝色</option>
                                <option>绿色</option>
                                <option>白色</option>
                                <option>玫瑰金</option>
                                <option>土豪金</option>
                                <option>黑色</option>
                            </select>
                        </div>
                        <hr/>
                        <div >
                            <span>价格　　　</span>
                            <input type="text" name="price">
                        </div>
                        <hr/>
                        <div>
                            <span>库存　　　</span>
                            <input type="text" name="inventory">
                        </div>
                        <hr/>
                        <div>
                            <span>上传图片　</span>
                            <button type="button" id="j_upload_img_btn">上传</button>
                            <ul id="upload_img_wrap"></ul>
                            <!-- 加载编辑器的容器 -->
                            <textarea id="uploadEditor" style="display: none;"></textarea>
                        </div>
                        <hr/>
                        <div>
                            <span>描述　　　</span>
                            <script id="container" name="detail" type="text/plain">商品描述</script>
                        </div>
                        <hr/>
                        <input type="button" value="提交" onclick="formAjax()">
                    </form>
                </div>
            </div>
            <script type="text/javascript">
                var ue = UE.getEditor('container', {
                    toolbars: [
                        ['fullscreen', 'source', 'undo', 'redo'],
                        ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript',
                            'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote',
                            'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist',
                            'insertunorderedlist', 'selectall', 'cleardoc']
                    ],
                    autoHeightEnabled: true,
                    autoFloatEnabled: true
                });
            </script>
            <!-- /. ROW  -->
            <hr />

            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/JQuery/jquery-3.2.1.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/manager-shop/js/custom.js"></script>

<script type="text/javascript">

    function formAjax() {
        var url = "${pageContext.request.contextPath}/merchant/addCommodity";
        var detail = ue.getContentTxt();
        var params  = $("#commodityform").serialize();
        $.ajax({
           type:"POST",
            url:url,
            datail:detail,
            data:params,
            dataType:"json",
            success:function (data) {
                if(data.url==null) {
                    alert(data.message);
                } else {
                    alert(data.message);
                    window.location.href = "${pageContext.request.contextPath}"+data.url;
                }
            }
        });
    }

    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action) {
        if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo') {
            return '${pageContext.request.contextPath}/merchant/upload';
        } else {
            return this._bkGetActionUrl.call(this, action);
        }
    }

    $(function () {
        $("#firstCommodity").change(function () {
            $("#secondCommodity option:not(:first)").remove();
            var commodityType = $(this).val();
            if (commodityType!="") {
                var url="${pageContext.request.contextPath}/merchant/secondCommodity";
                var arg = {parentId:commodityType,time:new Date()};
                $.getJSON(url,arg,function(data) {
                    if(data.length==0) {
                        alert("这已经是最低级目录了");
                    } else {
                        for(var i=0;i<data.length;i++) {
                            var commodityTypeName = data[i].typeName;
                            $("#secondCommodity").append("<option value='"+ commodityTypeName +"'>"
                                + commodityTypeName +"</option>");
                        }
                    }
                });
            }
        });
    })

    // 实例化编辑器，这里注意配置项隐藏编辑器并禁用默认的基础功能。
    var uploadEditor = UE.getEditor("uploadEditor", {
        isShow: false,
        focus: false,
        enableAutoSave: false,
        autoSyncData: false,
        autoFloatEnabled:false,
        wordCount: false,
        sourceEditor: null,
        scaleEnabled:true,
        toolbars: [["insertimage", "attachment"]]
    });

    // 监听多图上传和上传附件组件的插入动作
    uploadEditor.ready(function () {
        uploadEditor.addListener("beforeInsertImage", _beforeInsertImage);
        uploadEditor.addListener("afterUpfile",_afterUpfile);
    });

    // 自定义按钮绑定触发多图上传和上传附件对话框事件
    document.getElementById('j_upload_img_btn').onclick = function () {
        var dialog = uploadEditor.getDialog("insertimage");
        dialog.title = '多图上传';
        dialog.render();
        dialog.open();
    };


    // 多图上传动作
    function _beforeInsertImage(t, result) {
        var imageHtml = '';
        for(var i in result){
            imageHtml += '<li><img src="'+result[i].src+'" alt="'+result[i].alt+'" height="150"></li>';
        }
        document.getElementById('upload_img_wrap').innerHTML = imageHtml;
    }



</script>
</body>
</html>
