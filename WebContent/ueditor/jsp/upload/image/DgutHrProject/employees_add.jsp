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
			
			<div style="margin-bottom: 20px;">
				<input class="easyui-combobox" name="deptId" 
					data-options="
				url: 'findDepts',
				method: 'post',
				valueField: 'id',
				textField: 'name',
				validType:'deptwww',editable:false,panelHeight:'auto'"  label="部门:" style="width: 50%; height: 34px; padding: 10px;"  >
			</div>
			
			<div style="margin-bottom: 20px;">
				<input class="easyui-combobox" name="jobId" 
					data-options="
				url: 'findJobs',
				method: 'post',
				valueField: 'id',
				textField: 'name',
				validType:'jobwww',editable:false,panelHeight:'auto'"  label="职位:" style="width: 50%; height: 34px; padding: 10px;"  >
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="姓名:" class="easyui-textbox" name="name"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="身份证:" class="easyui-textbox" name="cardId"
					data-options="required:true,validType:'cardIdNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="地址:" id="password" class="easyui-textbox"
					name="address" data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px">
			</div>

			<div style="margin-bottom: 20px">
				<input label="邮政编码:" class="easyui-numberbox" name="postCode"
					 data-options="required:true,validType:'postcodeNum'" 
					style="width: 50%; height: 34px; padding: 10px">
			</div>

			<div style="margin-bottom: 20px">
				<input label="电话:" class="easyui-numberbox" name="telephone"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="手机:" class="easyui-numberbox" name="phone"
					data-options="required:true,validType:'phoneNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			 
			<div style="margin-bottom: 20px">
				<input label="QQ:" class="easyui-numberbox" name="qqNum"
					data-options="required:true,validType:'qqNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="邮箱:" class="easyui-textbox" name="email"
					data-options="required:true,validType:'emailNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<select name="sex" id="sex" label="性別:" class="easyui-combobox" style="width: 50%; height: 34px; padding: 10px;" data-options="editable:false,panelHeight:'auto'">
					<option value="1">男</option>
					<option value="2">女</option>
				</select>
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="政治面貌:" class="easyui-textbox" name="party"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="生日:" class="easyui-datebox" name="birthday"
					data-options="required:true,editable:false,validType:'birthdayNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="民族:" class="easyui-textbox" name="race"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="学历:" class="easyui-textbox" name="education"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="专业:" class="easyui-textbox" name="speciality"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="兴趣爱好:" class="easyui-textbox" name="hobby"
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

			},emailNum : {    
				validator : function(value, param) {
					return /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/.test(value);
				},
				message : '请输入正确的邮箱。'

			},
			birthdayNum : {    
				validator : function(value, param) {
					
					var d1=Date.parse(new Date(value))
					var now = Date.parse(new Date());
				    return d1 <= now;
				},
				message : '请输入正确的日期。'

			},
			postcodeNum : {
				validator : function(value, param) {

					return /^[1-9]\d{5}$/.test(value);

				},
				message : '请输入正确的邮政编码.'
			},
			qqNum : {
				validator : function(value, param) {
					return /^[1-9][0-9]{4,11}$/.test(value);
				},
				message : '请输入正确的qq号码.'
			},
			cardIdNum : {
				validator : function(value, param) {
					return /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/.test(value);
				},
				message : '请输入正确的身份证号码.'
			},
			cardIdwww : {
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
				message : '该身份证已使用!'
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
			cardIdNum : {
				validator : function(value, param) {
					return /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/.test(value);
				},
				message : '请输入正确的身份证号码.'
			},
			jobwww : {
				validator : function(value, param) {
					var jobvalue = value;
					var l = true;
					var json = {
						'job' : jobvalue
					};
					$.ajaxSettings.async = false;
					$.post("jobAjax", json, function(data) {

						if (data == "1") {
							l = false;
						} else {

						}
						return data;
					});
					$.ajaxSettings.async = true;
					return l;

				},
				message : '请选择职位'
			},
			deptwww : {
				validator : function(value, param) {
					var deptvalue = value;
					var l = true;
					var json = {
						'dept' : deptvalue
					};
					$.ajaxSettings.async = false;
					$.post("deptAjax", json, function(data) {

						if (data == "1") {
							l = false;
						} else {

						}
						return data;
					});
					$.ajaxSettings.async = true;
					return l;

				},
				message : '请选择部门'
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
				url : '${pageContext.request.contextPath}/addemployee',
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