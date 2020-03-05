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
			<input class="easyui-combobox" id="deptname" name="deptname"
				data-options="
				url: 'findDepts',
				method: 'post',
				valueField: 'id',
				textField: 'name',editable:false,panelHeight:'auto'"
				 style="width: 15%; height: 34px; padding: 10px;" />
				 
			<input class="easyui-combobox" id="jobname" name="jobname"
				data-options="
				url: 'findJobs',
				method: 'post',
				valueField: 'id',
				textField: 'name',editable:false,panelHeight:'auto'"
				 style="width: 15%; height: 34px; padding: 10px;" />
				 	 
			<label for="name">姓名</label> <input
				class="easyui-textbox" style="width: 200px" name="name"
				id="name" /> 
			<a data-options="iconCls:'icon-search'" href="javascript:void(0)"
				class="easyui-linkbutton" onclick="submitForm()">查询</a>

		</form>
	</div>

	<!-- 显示的tabel,注意是动态获取的数据 -->
	<table id="dg" data-options="remoteSort: false" style="width: 100%; height: 420px">
	</table>
	
	<form id="dlg" method="post" class="easyui-dialog" title="修改个人信息" data-options="iconCls:'icon-edit'" closed="true"  style="width:1200px;height:600px;">
		<div class="easyui-panel"
			style="width: 100%; height: 100%; padding: 50px 60px; text-align: center;">
			<div style="margin-bottom: 20px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="width:100px;margin-bottom: 10px;" onclick="openedit()">点击编辑</a>
			</div>
			<div style="margin-bottom: 20px;">
				<input class="easyui-combobox" name="deptId_update" id="deptId_update"
					data-options="
				url: 'findDepts',
				method: 'post',
				valueField: 'id',
				textField: 'name',
				validType:'deptwww',editable:false,panelHeight:'auto'"  label="部门:" style="width: 50%; height: 34px; padding: 10px;"  >
			</div>
			
			<div style="margin-bottom: 20px;">
				<input class="easyui-combobox" name="jobId_update" id="jobId_update" 
					data-options="
				url: 'findJobs',
				method: 'post',
				valueField: 'id',
				textField: 'name',
				validType:'jobwww',editable:false,panelHeight:'auto'"  label="职位:" style="width: 50%; height: 34px; padding: 10px;"  >
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="姓名:" class="easyui-textbox" name="name_update" id="name_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="身份证:" class="easyui-textbox" name="cardId_update" id="cardId_update"
					data-options="required:true,validType:'cardIdNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="地址:"  class="easyui-textbox"
					name="address_update" id="address_update" data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px">
			</div>

			<div style="margin-bottom: 20px">
				<input label="邮政编码:" class="easyui-numberbox" name="postCode_update" id="postCode_update"
					 data-options="required:true,validType:'postcodeNum'" 
					style="width: 50%; height: 34px; padding: 10px">
			</div>

			<div style="margin-bottom: 20px">
				<input label="电话:" class="easyui-numberbox" name="telephone_update" id="telephone_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="手机:" class="easyui-numberbox" name="phone_update" id="phone_update"
					data-options="required:true,validType:'phoneNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			 
			<div style="margin-bottom: 20px">
				<input label="QQ:" class="easyui-numberbox" name="qqNum_update" id="qqNum_update"
					data-options="required:true,validType:'qqNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="邮箱:" class="easyui-textbox" name="email_update" id="email_update"
					data-options="required:true,validType:'emailNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<select name="sex_update" id="sex_update" label="性別:" class="easyui-combobox" style="width: 50%; height: 34px; padding: 10px;" data-options="editable:false,panelHeight:'auto'">
					<option value="1">男</option>
					<option value="2">女</option>
				</select>
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="政治面貌:" class="easyui-textbox" name="party_update" id="party_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="生日:" class="easyui-datebox" name="birthday_update" id="birthday_update"
					data-options="required:true,editable:false,validType:'birthdayNum'"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="民族:" class="easyui-textbox" name="race_update" id="race_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="学历:" class="easyui-textbox" name="education_update" id="education_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="专业:" class="easyui-textbox" name="speciality_update" id="speciality_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="兴趣爱好:" class="easyui-textbox" name="hobby_update" id="hobby_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" label="备注:" name="remark_update" id="remark_update"
					multiline="true" style="width: 50%; height: 120px; padding: 10px;">
			</div>
			<div style="margin-top: 20px; text-align: center;">
				<a id="edit" href="javascript:void(0)" class="easyui-linkbutton c1" style="visibility:hidden;width: 120px" onclick="modify()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton c1" style="wsidth: 120px" onclick="closeedit()">关闭</a>
			</div>
		</div>
	</form>
	

</body>
<script type="text/javascript">

	var employeeId;

	var deptId_updateid;
	var jobId_updateid;
	$(function() {
		//$("dlg").css('display','none')
		getData("${pageContext.request.contextPath}/findEmployees");

	})
	function openedit() {
		$("input").attr('readonly',false);
		var deptId_update=$("#deptId_update").val();
		var jobId_update=$("#jobId_update").val();
		var birthday_update=$("#birthday_update").val();
		
		
		
		$("#deptId_update").combobox({readonly:false});
		$("#jobId_update").combobox({readonly:false});
		$("#sex_update").combobox({readonly:false});
		$("#birthday_update").datebox({readonly:false});
		$("#remark_update").textbox({readonly:false});
		
		$("#deptId_update").textbox('setValue',deptId_update);
		$("#jobId_update").textbox('setValue',jobId_update);
		$("#birthday_update").datebox('setValue',birthday_update);

		document.getElementById("edit").style.visibility = "visible";
	}
	function closeedit() {
		$('#dlg').dialog('close');
		
	}
	function submitForm() {
		
		var deptname = $("#deptname").val();
		var jobname = $("#jobname").val();
		var name = $("#name").val();

		getData("${pageContext.request.contextPath}/findEmployeeLike", deptname,jobname, name);
		$('#dg').datagrid('reload');
	}

	
	
	
	function getData(url, deptname,jobname, name) {
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
								deptId : deptname,
								jobId : jobname,
								name : name
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
										field : 'createDate',
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

		
		
		replace=function(id){
			
			//$.ajaxSetup({async: false});
			employeeId=id;
			var json = {
					"id" : id
				};
			$.post("findEmployee", json, function(row) {
				createtime=row.createDate;
				deptId_updateid=row.dept.id;
				jobId_updateid=row.job.id;
				$("input").attr('readonly',true);
				$("#deptId_update").combobox({readonly:true});
				$("#jobId_update").combobox({readonly:true});
				$("#sex_update").combobox({readonly:true});
				$("#birthday_update").datebox({readonly:true});
				$("#remark_update").textbox({readonly:true});
				
				$("#deptId_update").textbox('setValue',row.dept.name);
				$("#jobId_update").textbox('setValue',row.job.name);	
				
				$("#name_update").textbox('setValue',row.name);				
				$("#cardId_update").textbox('setValue',row.cardId);	
				$("#address_update").textbox('setValue',row.address);
				$("#postCode_update").textbox('setValue',row.postCode);
				$("#telephone_update").numberbox('setValue',row.tel);
				$("#phone_update").numberbox('setValue',row.phone);
				$("#qqNum_update").textbox('setValue',row.qqNum);
				$("#email_update").textbox('setValue',row.email);
				if(row.sex==1)
					$("#sex_update").textbox('setValue',"男");
				else
					$("#sex_update").textbox('setValue',"女");
				
				$("#party_update").textbox('setValue',row.party);
				$("#birthday_update").datebox('setValue',parsedate(row.birthday));
				$("#race_update").textbox('setValue',row.race);
				$("#education_update").textbox('setValue',row.education);
				$("#speciality_update").textbox('setValue',row.speciality);
				$("#hobby_update").textbox('setValue',row.hobby);
				$("#remark_update").textbox('setValue',row.remark);
				
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
	function parsedate(value) {

        var date = new Date(value).format("yyyy-MM-dd");
        return date;
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
			
		
		
		
		
		
		var deptId_update = $("#deptId_update").val();
		var jobId_update = $("#jobId_update").val();
		var name_update = $("#name_update").val();
		var cardId_update = $("#cardId_update").val();
		var address_update = $("#address_update").val();
		var postCode_update = $("#postCode_update").val();
		var telephone_update = $("#telephone_update").val();
		var phone_update = $("#phone_update").val();
		var postCode_update = $("#postCode_update").val();
		var qqNum_update = $("#qqNum_update").val();
		
		var email_update = $("#email_update").val();
		var sex_update = $("#sex_update").val();
		var party_update = $("#party_update").val();
		
		var birthday_update = new Date($("#birthday_update").val());
		var race_update = $("#race_update").val();
		var education_update = $("#education_update").val();
		
		var speciality_update = $("#speciality_update").val();
		var hobby_update = $("#hobby_update").val();
		var remark_update = $("#remark_update").val();
		
		
		if(/[\u4e00-\u9fa5]/.test(deptId_update))
			deptId_update=deptId_updateid;
		
		if(/[\u4e00-\u9fa5]/.test(jobId_update))
			jobId_update=jobId_updateid;
		
		var json = {
				"id" : employeeId,
				"deptId" : deptId_update,
				"jobId" : jobId_update,
				"name" : name_update,
				"cardId" : cardId_update,
				"address" : address_update,
				"postCode" : postCode_update,
				"telephone" : telephone_update,
				
				"phone" : phone_update,
				"postCode" : postCode_update,
				"qqNum" : qqNum_update,
				
				"email" : email_update,
				"sex" : sex_update,
				"party" : party_update,
				"birthday" : birthday_update,
				
				"race" : race_update,
				"education" : education_update,
				"speciality" : speciality_update,
				"hobby" : hobby_update,
				
				
				"remark" : remark_update
			};
		
		$.post("updateEmployee", json, function(data) {
			
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
