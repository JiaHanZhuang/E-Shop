//创建百度编辑器的图片上传和附近上传
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

document.getElementById('j_upload_file_btn').onclick = function () {
    var dialog = uploadEditor.getDialog("attachment");
    dialog.title = '附件上传';
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

// 附件上传
function _afterUpfile(t, result) {
    var fileHtml = '';
    for(var i in result){
        fileHtml += '<li><a href="'+result[i].url+'" target="_blank">'+result[i].url+'</a></li>';
    }
    document.getElementById('upload_file_wrap').innerHTML = fileHtml;
}

// 初始化选择类目组件
function initItemCat(data){
    //i : index
    //e : ele
    $(".selectItemCat").each(function(i,e){
        var _ele = $(e);
        if(data && data.cid){
            _ele.after("<span style='margin-left:10px;'>"+data.cid+"</span>");
        }else{
            _ele.after("<span style='margin-left:10px;'></span>");
        }
        _ele.unbind('click').click(function(){
            $("<div>").css({padding:"5px"}).html("<ul>")
                .window({
                    width:'500',
                    height:"450",
                    modal:true,
                    closed:true,
                    iconCls:'icon-save',
                    title:'选择类目',
                    onOpen : function(){//当窗口打开时执行
                        var _win = this;
                        $("ul",_win).tree({
                            url:'/rest/item/cat',
                            method : "GET",
                            animate:true,
                            onClick : function(node){
                                if($(this).tree("isLeaf",node.target)){
                                    // 填写到cid中
                                    _ele.parent().find("[name=cid]").val(node.id);
                                    _ele.next().text(node.text).attr("cid",node.id);
                                    $(_win).window('close');
                                    if(data && data.fun){
                                        //执行传入到fun方法
                                        //.call的第一个参数是固定，一般都是this，从第二个参数开始是自定义参数
                                        data.fun.call(this,node);
                                    }
                                }
                            }
                        });
                    },
                    onClose : function(){
                        $(this).window("destroy");
                    }
                }).window('open');
        });
    });
}

/**
 * 创建一个窗口，关闭窗口后销毁该窗口对象。<br/>
 *
 * 默认：<br/>
 * width : 80% <br/>
 * height : 80% <br/>
 * title : (空字符串) <br/>
 *
 * 参数：<br/>
 * width : <br/>
 * height : <br/>
 * title : <br/>
 * url : 必填参数 <br/>
 * onLoad : function 加载完窗口内容后执行<br/>
 *
 *
 */
function createWindow(params){
    $("<div>").css({padding:"5px"}).window({
        width : params.width?params.width:"80%",
        height : params.height?params.height:"80%",
        modal:true,
        title : params.title?params.title:" ",
        href : params.url,
        onClose : function(){
            $(this).window("destroy");
        },
        onLoad : function(){
            if(params.onLoad){
                params.onLoad.call(this);
            }
        }
    }).window("open");
}

 function closeCurrentWindow(){
    $(".panel-tool-close").click();
}

function changeItemParam(node,formId){

    $.ajax({
        type: "GET",
        url: "/rest/item/param/" + node.id,
        dataType:"json",
        statusCode : {
            200 : function(data){
                //模板已经存在
                $("#"+formId+" .params").show();
                var paramData = JSON.parse(data.paramData);
                var html = "<ul>";
                for(var i in paramData){
                    var pd = paramData[i];
                    html+="<li><table>";
                    html+="<tr><td colspan=\"2\" class=\"group\">"+pd.group+"</td></tr>";

                    for(var j in pd.params){
                        var ps = pd.params[j];
                        html+="<tr><td class=\"param\"><span>"+ps+"</span>: </td><td><input autocomplete=\"off\" type=\"text\"/></td></tr>";
                    }

                    html+="</li></table>";
                }
                html+= "</ul>";
                $("#"+formId+" .params td").eq(1).html(html);
            },
            404 : function(){
                //模板不存在
                $("#"+formId+" .params").hide();
                $("#"+formId+" .params td").eq(1).empty();
            },
            500 : function(){
                //出错
                alert("error");
            }

        }
    });
}

  function getSelectionsIds(select){
    var list = $(select);
    var sels = list.datagrid("getSelections");
    var ids = [];
    for(var i in sels){
        ids.push(sels[i].id);
    }
    ids = ids.join(",");
    return ids;
}

