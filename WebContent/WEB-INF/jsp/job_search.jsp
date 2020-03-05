<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<!--表单查询  -->
     <div>
     <form id="ff" method="post" action="">
           <label for="number">职位号</label><input class="easyui-numberbox" style="width:200px" 
           name="id" id="id" value=""/>
           
             <label for="name">职位名</label><input class="easyui-textbox" style="width:200px" 
           name="name" id="name"/>
           
	    			
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">查询</a>
     </form>
    </div>

   
<!-- 显示的tabel,注意是动态获取的数据 -->
<table id="dg" style="width:100%;height:420px" data-options="remoteSort:false"></table>



<!-- 修改对话框 -->
<div id="dlg" class="easyui-dialog" title="full text of reformed text" 
style="width: 400px; height: 250px; padding: 10px"
data-options="closed:true,
              iconCls:'icon-edit',
              toolbar:'#dlg-toolbar',
              buttons:'#dlg-buttons'" >
              <div>
              <form id="ff" class="easyui-form" method="post">
                   <table cellpadding="0">
                           <tr>
                             <td>ID</td>
                               <td><input class="easyui-textbox" disabled="disabled"
                               type="text" name="number_update" id="number_update" data-options="required:true"></td>
                           </tr> 
                            <tr>
                             <td>职位</td>
                               <td><input class="easyui-textbox" 
                               type="text" name="name_update" id="name_update" data-options="required:true"></td>
                           </tr>                             
                           <td>备注</td>
                               <td><input class="easyui-textbox"
                               type="text" name="remark_update" id="remark_update" data-options="required:true"></td>
                           </tr>
                   </table>
              
              </form>
      </div>

</div>

<!-- 修改对话框按钮 -->
<div id="dlg-buttons">
          <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">保存</a>
         <a href="javascript:void(0)"class="easyui-linkbutton"onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
   
</body>

<script>
var role = ${param.role};
$(function(){
	   getData("${pageContext.request.contextPath}/getjob");   
	     
	   
})


 function submitForm(){
    	   
    	   var id=$("#id").val();
    	   var name=$("#name").val();   	 
    	  
    	   getData("${pageContext.request.contextPath}/findJobLike",id,name); 
    	   
    	   
       }
       
//查询
function getData(url,id,name,remark){
	   $('#dg').datagrid({
		   url:url,
		   title:'职位列表',
		   border:false,
		   rownumbers:true,    		
		   toolbar:'#tb',
		   pagination:true,
		   pageSize:"10",
		   //easyui默认提交数据，提交其他数据 queryParam
		   queryParams:{
			  name:name, 			
			  remark:remark,
			  id:id	   			   
		   },
		   pageList :[10,15,20,999],
		   singleSelect:true,
		   columns:[[{
			   field:'id1',
			   value:'id',
			   checkbox:true,
			   title:'选择',
			   width:50    			   
		   },{
			   field:'id',
			   title:'编号',			 
			   width:220
		   } ,{
			   field:'name',
			   title:'职位',			 
			   width:220
		   } 
		   ,{
			   field:'remark',
			   title:'备注',			 
			   width:220
		   } ]]
		   
	   });
	   
	   
	   var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
		pager.pagination({
			buttons:[
			{
				iconCls:'icon-edit',
				text:'修改',
				handler:function(){
					if(role == 1){
						$.messager.alert('错误提示', '你无权限修改职位', 'error');
						return;
					}
					var row=$('#dg').datagrid('getSelected');
					if(row!=null){
						$("#number_update").textbox('setValue',row.id);
						$("#name_update").textbox('setValue',row.name);		
						$("#remark_update").textbox('setValue',row.remark);
						$('#dlg').dialog('open');							
					}
					else{
						$.messager.alert('温馨提示','请先选择一列内容','info');
					}	
					
				}
			}]
		});			
}




//修改
function save(){
    
   
    var id = $("#number_update").val(); 
    var name = $("#name_update").val();   
    var remark = $("#remark_update").val();
   
    var json ={
    "id": id,
    "name": name,    
    "remark": remark
    };      
  
    $.post("updatejob",json,function(data){
 	     
            var info = "对不起，修改失败！";
            var pic = "error";
            if (data == "1") {
                info = "恭喜，修改成功！！"; 
                pic = "info"
            }
              $.messager.alert("结果", info, pic, function () {
               window.location.reload ();
               });
    });
   }
 




</script>

</html>