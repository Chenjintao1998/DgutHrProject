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
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<!--表单查询  -->
	<div>
		<form id="ff" method="post">
			 <label for="number">账号</label>
			<input class="easyui-textbox" style="width: 200px" name="number"
				id="number" /> <label for="username">姓名</label> <input
				class="easyui-textbox" style="width: 200px" name="username"
				id="username" /> <label for="phone">電話</label> <input
				class="easyui-textbox" style="width: 200px" name="phone" id="phone" />
			<!-- <label for="email">邮箱</label> <input class="easyui-textbox"
				style="width: 200px" name="email" id="email" /> --> <label for="role">角色</label>
			<input class="easyui-combobox" id="roleId" name="roleId"
				data-options="
				url: 'findRoles',
				method: 'post',
				valueField: 'id',
				textField: 'name',editable:false,panelHeight:'auto'"
				 style="width: 15%; height: 34px; padding: 10px;" />

			<a data-options="iconCls:'icon-search'" href="javascript:void(0)"
				class="easyui-linkbutton" onclick="submitForm()">查询</a>

		</form>
	</div>

	<!-- 显示的tabel,注意是动态获取的数据 -->
	<table id="dg" data-options="remoteSort: false" style="width: 100%; height: 420px">
	</table>
	
	<form id="dlg" method="post" class="easyui-dialog" title="修改个人信息" data-options="iconCls:'icon-edit'" closed="true"  style="width:600px;height:600px;">
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
	

</body>
<script type="text/javascript">
	$(function() {
		//$("dlg").css('display','none')
		getData("${pageContext.request.contextPath}/findEmployees");

	})

	function submitForm() {
		var number = $("#number").val();
		var username = $("#username").val();
		var phone = $("#phone").val();
		//var email = $("#email").val();
		var roleId = $("#roleId").val();

		getData("${pageContext.request.contextPath}/findEmployeeLike", number,
				username, phone, roleId);
		$('#dg').datagrid('reload');
	}

	function getData(url, number, username, phone,  roleId) {
		$('#dg')
				.datagrid(
						{
							url : url,
							title : '用户列表',
							border : false,
							rownumbers : true,
							toolbar : '#tb',
							pagination : true,
							pageSize : "10",
							queryParams : {
								number : number,
								username : username,
								phone : phone,
								roleId : roleId,
							},
							pageList : [ 10, 15, 20, 25, 999 ],
							singleSelect : false,
							columns : [ [
									{
										field : 'id',
										value : 'id',
										checkbox : true,
										title : '选择',
										width : 50
									},
									{
										field : 'dept',
										title : '部门',
										sortable : true,
										formatter : function(value, row, index) {
											
											return row.dept.name;

										},
										width : 80
									},
									{
										field : 'job',
										title : '职位',
										sortable : true,
										formatter : function(value, row, index) {
											
											return row.job.name;

										},
										width : 80
									},
									{
										field : 'name',
										title : '姓名',
										sortable : true,
										width : 80
									},
									
									{
										field : 'createdate',
										title : '入职时间',
										sortable : true,
										formatter : formatDatebox,
										width : 150
									},
									{
										field : 'remark',
										title : '備註',
										sortable : true,
										width : 420
									},
									{
										field : 'Btn',
										title : '详细',
										width : 50,
										formatter : function(value, row, index) {
											var str = '<a name="detailed"  href="javascript:void(0)" class="easyui-linkbutton" onclick="replace('+row.id+')"></a>';

											return str;
										}

									} ] ],

									onLoadSuccess:function(data){  
									        $("a[name='detailed']").linkbutton({plain:true,iconCls:'icon-search'});  
									}

						});
		//$.parser.parse();  // 解析所有页面
		var pager = $('#dg').datagrid().datagrid('getPager');
		pager.pagination({
					buttons : [ {
						iconCls : 'icon-delete',
						text:"解雇",
						handler : function() {
							//var checkedItems = $('#dg').datagrid('getChecked');
							//alert(checkedItems[0].number);
							var row = $('#dg').datagrid('getSelections');
							var id = [];
							for (i = 0; i < row.length; i++) {
								id.push(row[i].id);
							}

							if (id.length == 0) {
								$.messager.alert('错误提示', '请选择一个员工', 'error');
								return;
							}
							$.messager
									.confirm(
											'确定',
											'您确定要解雇所选员工吗',
											function(t) {
												if (t) {
													$.ajaxSetup({async: false});
													$.ajax({
																url : "${pageContext.request.contextPath}/deleteEmployee",
																traditional : true,
																type : "post",
																dataType : "json",
																data : {
																	'id' : id
																},
																success : function(
																		callback) {
																	if (callback == "1")
																		$.messager
																				.alert(
																						'恭喜你',
																						'解雇成功',
																						'info');
																	else
																		$.messager
																				.alert(
																						'错误提示',
																						'解雇成功',
																						'error');

																}
															})

													$('#dg').datagrid('reload');
												}
											})
						}
					} ]
				});

		
		
		replace=function(number){
			
			//$.ajaxSetup({async: false});
			var json = {
					"number" : number
				};
			$.post("findUser", json, function(row) {
				$("#number_update").textbox('setValue',row.number);
				$("#username_update").textbox('setValue',row.username);	
				$("#password_update").passwordbox('setValue',row.password);				
				$("#roleId_update").textbox('setValue',row.role.name);				
				$("#phone_update").numberbox('setValue',row.phone);	
				//$("#email_update").textbox('setValue',row.email);
				
				$("#remark_update").textbox('setValue',row.remark);
				//$("[name=phone_update]").val(row.phone);
			});
			
			
			
			$('#dlg').dialog('open');
		}
		
		 
		 
		function formatDatebox(value) {
			if (value == null || value == '') {
				return '';
			}
			var dt;
			if (value instanceof Date) {
				dt = value;
			} else {

				dt = new Date(value);

			}

			return dt.format("yyyy-MM-dd hh:mm:ss"); //扩展的Date的format方法(上述插件实现)
		}

		Date.prototype.format = function(format) {
			var o = {
				"M+" : this.getMonth() + 1, // month  
				"d+" : this.getDate(), // day  
				"h+" : this.getHours(), // hour  
				"m+" : this.getMinutes(), // minute  
				"s+" : this.getSeconds(), // second  
				"q+" : Math.floor((this.getMonth() + 3) / 3),
				"S" : this.getMilliseconds()
			// millisecond  
			}
			if (/(y+)/.test(format))
				format = format.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(format))
					format = format.replace(RegExp.$1,
							RegExp.$1.length == 1 ? o[k] : ("00" + o[k])
									.substr(("" + o[k]).length));
			return format;
		}
	}
	
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
	
	
	
	function modify() {
			
		var number_update = $("#number_update").val();
		var username_update = $("#username_update").val();
		var password_update = $("#password_update").val();
		
		var roleId_update = $("#roleId_update").val();
		
		
		var phone_update = $("#phone_update").val();
		//var email_update = $("#email_update").val();
		var remark_update = $("#remark_update").val();
		
		var json = {
				"number" : number_update,
				"username" : username_update,
				"password" : password_update,
				"roleId" : roleId_update,
				"phone" : phone_update,
				//"email" : email_update,
				"remark" : remark_update,
			};
		
		$.post("updateUser", json, function(data) {
			if (data == "0") {
				$.messager.alert('错误提示', '修改失败', 'error');
			}
			if (data == "1") {
				$.messager.alert('恭喜你', '修改成功', 'info');
				$('#dg').datagrid('reload');
				$('#dlg').dialog('close');
			}
		});
		/* $('#dlg').form('submit', {
			url : '${pageContext.request.contextPath}/updateUser',
			onSubmit : function() {
				return $(this).form('enableValidation').form('validate');
			},
			success : function(data) {

				if (data == "0") {
					$.messager.alert('错误提示', '修改失败', 'error');
				}
				if (data == "1") {
					$.messager.alert('恭喜你', '修改成功', 'info');

				}
			}
		}); */
	}
</script>

</html>
