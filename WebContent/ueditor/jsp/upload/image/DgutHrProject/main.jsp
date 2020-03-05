<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>


<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none
}
</style>
</head>
<body class="easyui-layout" onload="startTime()">

	<div data-options="region:'north'" style="height: 80px; background: url('image/topbg.gif'); overflow: hidden">
		<table cellspacing="0" cellpadding="0">
			<tr>
			<!-- 应该是子绝对路径，父相对路径 -->
				<td style="padding-right: 120px"><img src="image/top_logo.png"></td>
				<td><img style="padding-top: 40px;" src="image/StatBarBg.png">
					<span style="position: absolute; top: 50px; left: 500px;"> <img
						src="image/StatBar_admin.gif"
						style="position: relative; top: 5px; left: -20px;"> <span
						style="position: relative; top: 3px; left: -10px;">当前用户:${user.username }</span> <img
						src="image/StatBar_time.gif"
						style="position: relative; top: 2px; left: 700px;"> <span
						style="position: relative; top: 2px; left: 710px;"> <span
							id="Date"></span>
					</span> <img src="image/top_home.gif"
						style="position: fixed; top: 22px; right: 305px;"> <a href="main.jsp" style="position: fixed; top: 18px; right: 265px; color: white;">首页</a>

						<img src="image/top_exit.gif" style="position: fixed; top: 22px; right: 150px;"> 
						<a href="quit" style="position: fixed; top: 18px; right: 80px; color: white;">退出登陸</a>

				</span></td>

			</tr>

		</table>
	</div>

	<div data-options="region:'south'" style="height: 25px;"></div>

	<div data-options="region:'east',split:true,title:'系统说明' "style="width: 100px;"></div>

	<div data-options="region:'west',split:true,title:'公司人事信息管理'  " style="width: 200px;">

		<div id="aa" class="easyui-accordion" style="width: 100%; height: 70%;text-align: center;">
			<div title="用户管理" data-options="iconCls:'icon-save',selected:true" style="overflow: auto; padding: 10px;">
				 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px;margin-bottom: 20px;" onclick="add('用户查询','user_search.jsp')">用户查询</a>
				 <a href="#"  class="easyui-linkbutton" data-options="iconCls:'icon-user_add'" style="width:100px" onclick="add('添加用户','user_add.jsp')">添加用户</a>
			</div>

			<div title="部门管理" data-options="iconCls:'icon-edit',selected:true"
				style="padding: 10px;">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px;margin-bottom: 20px;" onclick="add('部门查询','dept_search.jsp')">部门查询</a>
				 <a href="#"  class="easyui-linkbutton" data-options="iconCls:'icon-user_add'" style="width:100px" onclick="add('添加部门','dept_add.jsp')">添加部门</a>
				
				</div>

			<div title="职位管理" data-options="iconCls:'icon-remove',selected:true"
				style="padding: 10px;">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px;margin-bottom: 20px;" onclick="add('职位查询','job_search.jsp')">职位查询</a>
				 <a href="#"  class="easyui-linkbutton" data-options="iconCls:'icon-user_add'" style="width:100px" onclick="add('添加职位','job_add.jsp')">添加职位</a>
				
				</div>

			<div title="员工管理" data-options="iconCls:'icon-reload',selected:true"
				style="padding: 10px;">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px;margin-bottom: 20px;" onclick="add('员工查询','employees_search.jsp')">员工查询</a>
				 <a href="#"  class="easyui-linkbutton" data-options="iconCls:'icon-user_add'" style="width:100px" onclick="add('添加员工','employees_add.jsp')">添加员工</a>
				
				</div>

			<div title="公告管理" data-options="iconCls:'icon-ok',selected:true"
				style="padding: 10px;">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-print'" style="width:100px;margin-bottom: 10px;" onclick="add('公告查询','notice_search.jsp')">公告查询</a>
				 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:100px" onclick="add('添加公告','notice_add.jsp')">添加公告</a>
				
			</div>

			<div title="下载中心" data-options="iconCls:'icon-print',selected:true"
				style="padding: 10px;">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-up'" style="width:100px;margin-bottom: 10px;" onclick="add('文件上传','file_upload.jsp')">文件上传</a>
				 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-down'" style="width:100px" onclick="add('文件下载','file_down.jsp')">文件下载</a>
				
				
				</div>
		</div>

	</div>
	<div  data-options="region:'center',split:true"  style="background: #eee;width: 100%;">
		<div id="tt" class="easyui-tabs" style="width: 100%;height: 100%"></div>
	</div>
	<div id="tab_rightmenu" class="easyui-menu" style="width:135px; display:none">
        <div name="tab_menu-tabcloseall" id="closeAll" data-options="iconCls:'icon-cancel'">关闭全部标签</div>
        <div name="tab_menu-tabcloseother" id="closeOthor" data-options="iconCls:'icon-clear'">关闭其他标签</div>
        <div class="menu-sep"></div>
        <div name="tab_menu-tabcloseright" id="closeRight" data-options="iconCls:'icon-redo'">关闭右侧标签</div>
        <div name="tab_menu-tabcloseleft" id="closeLeft" data-options="iconCls:'icon-undo'">关闭左侧标签</div>
    </div>


</body>

<script type="text/javascript">

	function startTime() {
		var today = new Date()
		var year = today.getFullYear();
		var mon = today.getMonth() + 1; //获取当前月份 
		var da = today.getDate(); //获取当前日 
		var day = today.getDay(); //获取当前星期几
		var h = today.getHours()
		var m = today.getMinutes()
		var s = today.getSeconds()
		// add a zero in front of numbers<10
		m = checkTime(m)
		s = checkTime(s)
		document.getElementById('Date').innerHTML = year + '年' + mon + '月' + da
				+ '日' + ' ' + h + ":" + m + ":" + s + ' ' + '星期' + day
		t = setTimeout('startTime()', 500)
	}

	function checkTime(i) {
		if (i < 10) {
			i = "0" + i
		}
		return i
	}
</script>


<script type="text/javascript">
	function add(name,url) {
		if (!$('#tt').tabs('exists', name)) {
			
			$('#tt').tabs('add', {
				title : name,
				content : '<iframe scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;height:100%;"></iframe>',
				closable : true
				/*tools : [ {
					iconCls : 'icon-mini-refresh',
					 handler : function() {
						alert('refresh');
					} 
				} ]*/
			});
			
		} else {
			$('#tt').tabs('select', name);
			return false;
		}
       
	}
	
	
	$(function(){	
	 $("#tt").tabs({
         onContextMenu:function(e, title) {
        	 
             //在每个菜单选项中添加title值
             var $divMenu = $("#tab_rightmenu div[id]");
             $divMenu.each(function() {
            	 
                 $(this).attr("id", title);
                 
             });
             //显示menu菜单
             $('#tab_rightmenu').menu('show', {
                 left: e.pageX,
                 top: e.pageY
             });
             
             e.preventDefault();
         }
     });
	 
     //实例化menu点击触发事件
     $('#tab_rightmenu').menu({
         "onClick":function(item) {
        	
             closeTab($("#tab_rightmenu div[id]").attr("id"),item.text);
             
         }
     });
 })

 //关闭选项卡功能    注意：还需要上面的 .tabs和.menu右击触发事件显示菜单功能哦
 function closeTab(title, text) {
     if(text == '关闭全部标签') {
         $(".tabs li").each(function(index, obj) {
             //获取所有可关闭的选项卡
             var tabTitle = $(".tabs-closable", this).text();
             $("#tt").tabs("close", tabTitle);
         });
     }
     if(text == '关闭其他标签') {
    	 
         $(".tabs li").each(function(index, obj) {
             //获取所有可关闭的选项卡
             var tabTitle = $(".tabs-closable", this).text();
             if(tabTitle != title) {
            	 
                 $("#tt").tabs("close", tabTitle);
             }
         });
     }
     if(text == '关闭右侧标签') {
         var $tabs = $(".tabs li");
         for(var i = $tabs.length - 1; i >= 0; i--) {
             //获取所有可关闭的选项卡
             var tabTitle = $(".tabs-closable", $tabs[i]).text();
             if(tabTitle != title) {
                 $("#tt").tabs("close", tabTitle);
             } else {
                 break;
             }
         }
     }
     if(text == '关闭左侧标签') {
         var $tabs = $(".tabs li");
         for(var i = 0; i < $tabs.length; i++) {
             //获取所有可关闭的选项卡
             var tabTitle = $(".tabs-closable", $tabs[i]).text();
             if(tabTitle != title) {
                 $("#tt").tabs("close", tabTitle);
             } else {
                 break;
             }
         }
     }
 }


	
</script>
</html>