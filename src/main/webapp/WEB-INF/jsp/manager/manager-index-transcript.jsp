<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 验证密码窗口 -->
<div class="modal fade login" id="loginModal1">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">请输入原密码</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="post" id="loginform1" name="loginform" action="#" accept-charset="UTF-8">
                                <input  class="form-control" type="password" placeholder="密码" name="password">
                                <input class="btn btn-default btn-login" type="button" value="验证" onclick="checkAjax(this.form)">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 上传窗口 -->


<div class="modal fade login" id="uploadingModel">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">选择上传的文件</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="post" id="uploading" name="uploading" accept-charset="UTF-8" enctype="multipart/form-data"
                                    action="${pageContext.request.contextPath}/manager/uploadingExcel" >
                                <input  class="form-control" type="file" placeholder="文件路径" name="excel">
                                <input class="btn btn-default btn-login" type="submit" value="提交" onclick="uploadingAjax()">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


