<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>


</head>
<body>
	<!--表单查询  -->
	<div>
		<form id="ff" method="post">
			 <label for="name">公告名称</label>
			<input class="easyui-textbox" style="width: 200px" name="number"
				id="name" /> 
				<label for="username">上传者</label> <input
				class="easyui-textbox" style="width: 200px" name="username"
				id="username" /> <label for="title">公告标题</label> <input
				class="easyui-textbox" style="width: 200px" name="phone" id="title" />

			<a data-options="iconCls:'icon-search'" href="javascript:void(0)"
				class="easyui-linkbutton" onclick="submitForm()">查询</a>

		</form>
	</div>

	<!-- 显示的tabel,注意是动态获取的数据 -->
	<table id="dg" data-options="remoteSort: false" style="width: 100%; height: 420px">
	</table>
	
	<form id="dlg" method="post" class="easyui-dialog" title="公告詳細信息" data-options="iconCls:'icon-search'" closed="true"  style="width:1200px;height:600px;">
		
		<div class="easyui-panel" style="width: 100%; height: 100%;margin-top: 20px; border:none; text-align: center;">
			<div style="margin-bottom: 20px">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="width:100px;margin-bottom: 10px;" onclick="openedit()">点击编辑</a>
			</div>
			
			<div style="margin-bottom: 20px">
				<input label="上传者:" class="easyui-textbox" id="username_update" name="username_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>

			<div style="margin-bottom: 20px">
				<input label="公告名称:" class="easyui-textbox" id="name_update" name="name_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			
			
			
			<div style="margin-bottom: 20px">
				<input label="公告标题:" class="easyui-textbox" id="title_update" name="title_update"
					data-options="required:true"
					style="width: 50%; height: 34px; padding: 10px;">
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" label="备注:" id="remark_update" name="remark_update" 
					multiline="true" style="width: 50%; height: 120px; padding: 10px;">
			</div>
			<label>内容:</label>
			<script  name="content" id="content" type="text/plain" style="margin:0 auto;width: 1024px; height: 500px;"></script>
			<div style="margin-top: 20px; text-align: center;">
				<a id="edit" href="javascript:void(0)" class="easyui-linkbutton c1" style="visibility:hidden;width: 120px" onclick="modify()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton c1" style="wsidth: 120px" onclick="closeedit()">关闭</a>
					
			</div>
		</div>
	</form>
	

</body>
<script type="text/javascript">
	var notice_id;
	$(function() {
		 var ue = UE.getEditor('content');
		 
		getData("${pageContext.request.contextPath}/findNotices");
		$('#dg').datagrid('reload');
	})
	function openedit() {
		
		//alert($("#name_update").val());
		$("input").removeAttr("readonly");
		$("#remark_update").textbox('textbox').attr('readonly', false);
		//alert($("#username_update").val());
		$("#username_update").textbox('textbox').attr('readonly',true);
		UE.getEditor('content').setEnabled('fullscreen');
		document.getElementById("edit").style.visibility = "visible";
	}
	function closeedit() {
		$('#dlg').dialog('close');
		
	}
	
	function submitForm() {
		var name = $("#name").val();
		var title = $("#title").val();
		var username = $("#username").val();
		
		getData("${pageContext.request.contextPath}/findNoticeLike", name, title, username);
		$('#dg').datagrid('reload');
	}

	function getData(url, name, title, username) {
		
		$('#dg').datagrid(
						{
							url : url,
							title : '公告列表',
							border : false,
							rownumbers : true,
							toolbar : '#tb',
							pagination : true,
							pageSize : "10",
							queryParams : {
								name : name,
								username : username,
								title : title
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
										field : 'username',
										title : '上传者',
										sortable : true,
										width : 80
									},
									{
										field : 'name',
										title : '公告名称',
										sortable : true,
										width : 380
									},
									{
										field : 'title',
										title : '公告标题',
										sortable : true,
										width : 380
									},
									{
										field : 'remark',
										title : '备注',
										sortable : true,
										width : 180
									},
									{
										field : 'Btn',
										title : '查看',
										width : 50,
										formatter : function(value, row, index) {
											var str = '<a name="check"  href="javascript:void(0)" class="easyui-linkbutton" onclick="replace('+row.id+')"></a>';

											return str;
										}

									} ] ],

									onLoadSuccess:function(data){  
									        $("a[name='check']").linkbutton({plain:true,iconCls:'icon-search'});  
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
								id.push(row[i].id);
							}

							if (id == 0) {
								$.messager.alert('错误提示', '请选择一个公告', 'error');
								return;
							}
							$.messager.confirm(
											'确定',
											'您确定要删除吗',
											function(t) {
												if (t) {
													$.ajaxSetup({async: false});
													$.ajax({
																url : "${pageContext.request.contextPath}/deleteNotice",
																traditional : true,
																type : "post",
																dataType : "json",
																data : {
																	'id' : id
																},
																success : function(
																		callback) {
																	if (callback == "1")
																		{$.messager.alert(
																						'恭喜你',
																						'删除成功',
																						'info');
																		}
																	
																	else
																		{
																		$.messager
																				.alert(
																						'错误提示',
																						'未删除成功',
																						'error');
																		
																		}
																	$('#dg').datagrid('reload');
																}
																
															})

													
												}
												
											})
											
						}
					} ]
				});

		
		
		replace=function(id){
			notice_id=id;
			 var ue = UE.getEditor('content');
			//$.ajaxSetup({async: false});
			var json = {
					"id" : id
				};
			$.post("findNotice", json, function(row) {
				$("#name_update").textbox('setValue',row.name);
				$("#username_update").textbox('setValue',row.username);	
				$("#title_update").textbox('setValue',row.title);						
			
				$("#remark_update").textbox('setValue',row.remark);
				ue.setContent(row.content);
				
				ue.ready(function() {
					//不可编辑

					ue.setDisabled();
					});
				$("input").attr('readonly',true);
				$("#remark_update").textbox('textbox').attr('readonly', true);
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
	
	
	
	
	function modify() {
		var ue = UE.getEditor('content');
		var name_update = $("#name_update").val();
		
		var username_update = $("#username_update").val();
		var title_update = $("#title_update").val();
		var remark_update = $("#remark_update").val();
		var content=ue.getContentTxt();
		alert(document.getElementById("remark_update").value);
		var json = {
				"id" :notice_id,
				"name" : name_update,
				"username" : username_update,
				"title" : title_update,
				"remark" : remark_update,
				"content":content
			};
		
		$.post("updateNotice", json, function(data) {
			if (data == "0") {
				$.messager.alert('错误提示', '修改失败', 'error');
			}
			if (data == "1") {
				$.messager.alert('恭喜你', '修改成功', 'info');
				$('#dg').datagrid('reload');
				$('#dlg').dialog('close');
			}	
		});

	}
</script>

</html>
