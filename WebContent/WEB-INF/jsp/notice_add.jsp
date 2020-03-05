<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
<form id="ff" name="ff"  method="post">
<div style="margin-bottom:20px">
	<input class="easyui-textbox" name="username" id="username" label="发布者:" value="${user.username}" data-options="required:true" readonly="readonly"  style="width:20%;">
</div>
<div style="margin-bottom:20px">
	<input class="easyui-textbox" name="name" id="name" label="公告名称:"  data-options="prompt:'请输入公告名称',required:true" style="width:20%;">
</div>
<div style="margin-bottom:20px">
	<input class="easyui-textbox" name="title" id="title" label="公告题目:"  data-options="prompt:'请输入公告题目',required:true" style="width:20%;">
</div>
<div style="margin-bottom:20px">
	<input class="easyui-textbox" name="remark" id="remark" label="备注:"  data-options="prompt:'备注'" style="width:20%;">
</div>
	<p>内容:</p>
	<script name="content" id="content" type="text/plain"
		style="width: 1024px; height: 500px;">
	</script>
	<div style="margin-top:20px;text-align: left;">
		<a href="#" class="easyui-linkbutton c1" style="width:100px;height: 40px" onclick="submitForm()">发布</a>
    </div>
</form>
</body>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('content');


    function isFocus(e){
        alert(UE.getEditor('content').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('content').blur();
        UE.dom.domUtils.preventDefault(e)
    }
	
    function submitForm() {
    	
    	var name = $("#name").val();
    	var title = $("#title").val();
    	var content = UE.getEditor('content').getContent();
    	var remark = $("#remark").val();
    	var username = $("#username").val();
    	var json = {
				"name" : name,
				"title" : title,
				"content" : content,
				"remark" : remark,
				"username" : username
		};
    	
	 $.post("addnotice", json, function(data) {
		 	if (data == "0") {
				$.messager.alert('错误提示', '发布失败', 'error');
			}
			if (data == "1") {
				$.messager.alert('恭喜你', '发布成功', 'info');
			}
			
		});
	}
    
</script>
</html>