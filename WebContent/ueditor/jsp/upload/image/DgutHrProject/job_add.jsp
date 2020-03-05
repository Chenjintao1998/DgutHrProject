<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css"	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>




</head>
<body>
	<form id="ff" method="post">
		<div class="easyui-panel"
			style="width: 100%; height: 100%; padding: 50px 60px; text-align: center;">

			<div style="margin-bottom: 20px">
				<input label="职位编号:" class="easyui-textbox" name="id"
					data-options="required:true,validType:['id','idcheck']"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="职位名称:" class="easyui-textbox" name="name"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>


			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" label="备注:" name="remark"
					multiline="true" style="width: 50%; height: 120px; padding: 10px;">
			</div>
			<div style="margin-top: 20px; text-align: center;">
				<a href="javascript:void(0)" class="easyui-linkbutton c1"
					style="width: 120px" onclick="submitForm()">添加</a>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		
		$.extend($.fn.validatebox.defaults.rules, {
		
			id : {
				validator : function(value, param) {
					return /^[1-9]\d{0,9}$/.test(value);
				},
				message : '职位编号最大10位，且开头不为0'
			},
			idcheck: {
				validator : function(value, param) {
					var id = value;
					var l = true;
					var json = {
						'id' : id
					};
					$.ajaxSettings.async = false;
					$.post("jobidAjax", json, function(data) {

						if (data == "1") {
							l = false;
						} else {

						}
						return data;
					});
					$.ajaxSettings.async = true;
					return l;

				},
				message : '职位编号已存在!'
			}
		});

		
		function submitForm() {
			
			$('#ff').form('submit', {
			
				url : '${pageContext.request.contextPath}/addjob',
				onSubmit : function() {				
					return $(this).form('enableValidation').form('validate');
				},
				success : function(data) {

					if (data == "0") {
						$.messager.alert('错误提示', '添加失败', 'error');
					}
					if (data == "1") {
						$.messager.alert('恭喜你', '添加成功', 'info');

					}
				}
			});
		}
	</script>

</body>
</html>