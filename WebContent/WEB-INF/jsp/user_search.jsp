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
		<div class="easyui-panel" style="width: 100%; height: 100%;margin-top: 20px; border:none; text-align: center;">

			<div style="margin-bottom: 20px">
				<input label="用户编号:" class="easyui-textbox" id="number_update" name="number_update" readOnly=readOnly
					data-options="required:true,validType:['userNum','userwww']"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="用户名称:" class="easyui-textbox" id="username_update" name="username_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="密码:" id="password_update" name="password_update" class="easyui-passwordbox"  data-options="required:true" validType="minLength" style="width: 50%; height: 34px; padding: 10px">
			</div>

			<div style="margin-bottom: 20px">
				<input label="手机号码:" class="easyui-numberbox" id="phone_update" name="phone_update"
					data-options="required:true,validType:['phoneNum','phonewww']"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			<!-- <div style="margin-bottom: 20px">
				<input label="邮箱:" class="easyui-textbox" id="email_update" name="email_update" data-options="required:true,validType:['emailNum','emailwww']" style="width: 50%; height: 34px; padding: 10px;">
			</div> -->
			<div style="margin-bottom: 20px;">
				<input class="easyui-combobox" id="roleId_update" name="roleId_update" 
					data-options="
				url: 'findRoles',
				method: 'post',
				valueField: 'id',
				textField: 'name',
				validType:'rolewww'" editable="false" label="身份:" style="width: 50%; height: 34px; padding: 10px;"  >
			</div>

			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" label="备注:" id="remark_update" name="remark_update"
					multiline="true" style="width: 50%; height: 120px; padding: 10px;">
			</div>
			<div style="margin-top: 20px; text-align: center;">
				<a href="javascript:void(0)" class="easyui-linkbutton c1" style="width: 120px" onclick="modify()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton c1" style="width: 120px" onclick="$('#dlg').dialog('close');">取消</a>
					
			</div>
		</div>
	</form>
	

</body>
<script type="text/javascript">


	var role = ${param.role};
	$(function() {
		//$("dlg").css('display','none')
		getData("${pageContext.request.contextPath}/findUsers");

	})

	function submitForm() {
		var number = $("#number").val();
		var username = $("#username").val();
		var phone = $("#phone").val();
		//var email = $("#email").val();
		var roleId = $("#roleId").val();

		getData("${pageContext.request.contextPath}/findUserLike", number,
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
										value : 'number',
										checkbox : true,
										title : '选择',
										width : 50
									},
									{
										field : 'number',
										title : '账号',
										sortable : true,
										width : 80
									},
									{
										field : 'username',
										title : '姓名',
										sortable : true,
										width : 80
									},
									{
										field : 'password',
										title : '密碼',
										sortable : true,
										width : 80
									},
									{
										field : 'phone',
										title : '電話',
										sortable : true,
										width : 120
									},
									/* {
										field : 'email',
										title : '邮箱',
										sortable : true,
										width : 220
									}, */
									{
										field : 'roles',
										title : '角色',
										sortable : true,
										width : 80,
										formatter : function(value, row, index) {
											
											return row.role.name;

										}
									},
									{
										field : 'createdate',
										title : '注册时间',
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
										title : '修改',
										width : 50,
										formatter : function(value, row, index) {
											var str = '<a name="update"  href="javascript:void(0)" class="easyui-linkbutton" onclick="replace('+row.number+')"></a>';

											return str;
										}

									} ] ],

									onLoadSuccess:function(data){  
									        $("a[name='update']").linkbutton({plain:true,iconCls:'icon-edit'});  
									}

						});
		//$.parser.parse();  // 解析所有页面
		var pager = $('#dg').datagrid().datagrid('getPager');
		pager.pagination({
					buttons : [ {
						iconCls : 'icon-delete',
						text:"删除",
						handler : function() {
							//var checkedItems = $('#dg').datagrid('getChecked');
							//alert(checkedItems[0].number);
							var row = $('#dg').datagrid('getSelections');
							var id = [];
							for (i = 0; i < row.length; i++) {
								id.push(row[i].number);
							}

							if (id.length == 0) {
								$.messager.alert('错误提示', '请选择一个用户', 'error');
								return;
							}
							if(role == 1){
								$.messager.alert('错误提示', '你无权限删除用户', 'error');
								return;
							}
							$.messager
									.confirm(
											'确定',
											'您确定要删除吗',
											function(t) {
												if (t) {
													$.ajaxSetup({async: false});
													$.ajax({
																url : "${pageContext.request.contextPath}/deleteUser",
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
																						'删除成功',
																						'info');
																	else
																		$.messager
																				.alert(
																						'错误提示',
																						'未删除成功',
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
			
			
			if(role == 1){
				$.messager.alert('错误提示', '你无权限修改用户', 'error');
				return;
			}
			
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

		},/* emailNum : { //验证邮箱号   
			validator : function(value, param) {
				return /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/.test(value);
			},
			message : '请输入正确的邮箱。'

		}, */
		minLength : {
			validator : function(value, param) {

				return /^[a-zA-Z0-9]{6,12}$/.test(value);

			},
			message : '密码由数字和字母组成，并在 6 个字符和12 个字符之间.'
		}
		,
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
	
	
	
	function modify() {
		
		
			
		var number_update = $("#number_update").val();
		var username_update = $("#username_update").val();
		var password_update = $("#password_update").val();
		
		var roleId_update = $("#roleId_update").val();
		if(roleId_update=="普通员工")
			roleId_update=1;
		else if(roleId_update=="管理员")
			roleId_update=2;
		else if(roleId_update=="超级管理员")
			roleId_update=3;
		
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
