<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="margin:20px 0;"></div>
	<form id="ff" multiple="multiple" enctype="multipart/form-data" method="post" action="">
		<div class="easyui-panel" style="width:100%;padding:30px 70px 50px 70px;margin: 0 auto;text-align: center;">
		<div style="margin-bottom:20px">
			<input label="上传者:"  id="username" name="username" value="${user.username}" readonly="readonly" class="easyui-textbox" style="width:25%">
		</div>
		<div style="margin-bottom:20px">
			<input label="文件命名:" id="filename" name="filename" class="easyui-textbox" style="width:25%" data-options="prompt:'默认上传文件名'">
		</div>
		<div style="margin-bottom:20px">
			<input label="请选择上传文件:"   class="easyui-filebox" id="file" name="file" data-options="prompt:'选择文件'" validType="fileSize" style="width:25%">
		</div>
		<div> 	
			<a href="javascript:void(0)" class="easyui-linkbutton c1" style="width: 120px" onclick="submitForm()">上传</a>
		</div>
	</div>
	</form>
</body>
<script type="text/javascript">
$(function () {
	  $('#file').filebox({
		 /* onChange : function(e) {
			// file对象
			var file = $(this).next().find('input[id^="file"]');
			// 上传的文件大小
			var fileSize = file.size;
			alert(fileSize.length);
			}, */
         buttonText: '选择文件',
         multiple:true
     }) 
     
       $.extend($.fn.validatebox.defaults.rules, {
         // filebox验证文件大小的规则函数
         // 如：validType : [‘fileSize[1,"MB"]‘]
         fileSize : {
             validator : function(value) {
            	 for(var i=0;i<$('#file').filebox("files").length;i++)
            		if(!($('#file').filebox("files")[i].size>0))
            		{
            			 return false;
            		}
            	 
                 return true;
             },
             message : '不能上传空文件'
         }
     }); 
     
     
})

function submitForm() {
	
    var value=$("#file").filebox('getValue');
	if(value==null||value=="")
	{	
		$.messager.alert('错误提示', '上传失败', 'error');
		return false;
	}
	$('#ff').form('submit',{
		url:"upload",
		success:function(data){
			if (data == "0") {
				$.messager.alert('错误提示', '上传失败', 'error');
			}
			if (data == "1") {
				$.messager.alert('恭喜你', '上传成功', 'info');
			}
		}
	});
	
}
</script>
</html>