<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validate Password - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>




</head>
<body>
	<form id="ff" method="post">
		<div class="easyui-panel"
			style="width: 100%; height: 100%; padding: 50px 60px; text-align: center;">

			<div style="margin-bottom: 20px">
				<input label="用户编号:" class="easyui-textbox" name="number"
					data-options="required:true,validType:['userNum','userwww']"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="用户名称:" class="easyui-textbox" name="username"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="密码:" id="password" class="easyui-passwordbox"
					name="password" data-options="required:true" validType="minLength"
					style="width: 50%; height: 34px; padding: 10px">
			</div>

			<div style="margin-bottom: 20px">
				<input label="确认密码:" class="easyui-passwordbox"
					validType="equals['#password']" data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px">
			</div>

			<div style="margin-bottom: 20px">
				<input label="手机号码:" class="easyui-numberbox" name="phone"
					data-options="required:true,validType:['phoneNum','phonewww']"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			<!-- <div style="margin-bottom: 20px">
				<input label="邮箱:" class="easyui-textbox" name="email"
					data-options="required:true,validType:['emailNum','emailwww']"
					style="width: 50%; height: 34px; padding: 10px;">
			</div> -->
			<div style="margin-bottom: 20px;">
				<input class="easyui-combobox" name="roleId" 
					data-options="
				url: 'findRoles',
				method: 'post',
				valueField: 'id',
				textField: 'name',
				validType:'rolewww',editable:false,panelHeight:'auto'"  label="身份:" style="width: 50%; height: 34px; padding: 10px;"  >
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
		/* $(function(){
			//键盘抬起事件
			$('#number').textbox({
				inputEvents:$.extend({},$.fn.textbox.defaults.inputEvents,{
					keyup:function(event){
						var numbervalue=$("#number").val();
						var json={'number':numbervalue};
						$.post("numberAjax",json,function(data){
							if(data=="1"){
								alert("用户已注册");
							}
							
						});
						
					}
				})
			})
		}); */

		$.extend($.fn.validatebox.defaults.rules, {
			phoneNum : { //验证手机号   
				validator : function(value, param) {
					return /^1[3-8]\d{9}$/.test(value);
				},
				message : '请输入正确的手机号码。'

			},emailNum : { //验证手机号   
				validator : function(value, param) {
					return /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/.test(value);
				},
				message : '请输入正确的邮箱。'

			},
			minLength : {
				validator : function(value, param) {

					return /^[a-zA-Z0-9]{6,12}$/.test(value);

				},
				message : '密码由数字和字母组成，并在 6 个字符和12 个字符之间.'
			},
			equals : {
				validator : function(value, param) {
					return value == $(param[0]).val();
				},
				message : '两次密码不同！'
			},
			userNum : {
				validator : function(value, param) {
					return /^[1-9]\d{0,9}$/.test(value);
				},
				message : '员工编号最大10位，且开头不为0'
			},
			userwww : {
				validator : function(value, param) {
					var numbervalue = value;
					var l = true;
					var json = {
						'number' : numbervalue
					};
					$.ajaxSettings.async = false;
					$.post("numberAjax", json, function(data) {

						if (data == "1") {
							l = false;
						} else {

						}
						return data;
					});
					$.ajaxSettings.async = true;
					return l;

				},
				message : '员工已存在!'
			},
			phonewww : {
				validator : function(value, param) {
					var phonevalue = value;
					var l = true;
					var json = {
						'phone' : phonevalue
					};
					$.ajaxSettings.async = false;
					$.post("phoneAjax", json, function(data) {

						if (data == "1") {
							l = false;
						} else {

						}
						return data;
					});
					$.ajaxSettings.async = true;
					return l;

				},
				message : '电话已注册!'
			},
			/* emailwww : {
				validator : function(value, param) {
					var emailvalue = value;
					var l = true;
					var json = {
						'email' : emailvalue
					};
					$.ajaxSettings.async = false;
					$.post("emailAjax", json, function(data) {

						if (data == "1") {
							l = false;
						} else {

						}
						return data;
					});
					$.ajaxSettings.async = true;
					return l;

				},
				message : '邮箱已注册!'
			} , */
			rolewww : {
				validator : function(value, param) {
					var rolevalue = value;
					var l = true;
					var json = {
						'role' : rolevalue
					};
					$.ajaxSettings.async = false;
					$.post("roleAjax", json, function(data) {

						if (data == "1") {
							l = false;
						} else {

						}
						return data;
					});
					$.ajaxSettings.async = true;
					return l;

				},
				message : '沒有此身份!'
			} 
		});

		/* function submitForm() {
			$('#ff').form('submit', {
				onSubmit : function() {
					return $(this).form('enableValidation').form('validate');
				}
			})
		} */

		/* 
		$(function() {
			var addInfo = "${addInfo}";
			if (addInfo == "0")
				$.messager.alert('错误提示', '添加失败!', 'error');
			if (addInfo == "1")
				$.messager.alert('恭喜你', '添加成功!', 'info');
		}) */

		function submitForm() {
			$('#ff').form('submit', {
				url : '${pageContext.request.contextPath}/adduser',
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