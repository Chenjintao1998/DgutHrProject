<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>


<!-- 显示的tabel,注意是动态获取的数据 -->
<table id="dg" style="width:100%;height:420px" data-options="remoteSort:false"></table>


</body>
<script type="text/javascript">
       $(function(){
    	   getData("${pageContext.request.contextPath}/findFiles");   
    	   getpagebar();
    	    
    	   
       })
       
       function getpagebar(){
    	   
    	   var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				buttons:[{
					iconCls:'icon-down',
					text:'下载',
					handler:function(){

						var row = $('#dg').datagrid('getSelections');
						var id = [];
						for (i = 0; i < row.length; i++) {
							id.push(row[i].id);
						}
						if (id.length == 0) {
							$.messager.alert('错误提示', '请选择一个文件', 'error');
							return;
						}
						$.messager
								.confirm(
										'确定',
										'您确定要下载所选文件吗',
										function(t) {
											if (t) {
												for (i = 0; i < id.length; i++) {
													//alert(id.length);
													window.location.href="download?id="+id[i];
										         
										           }
												

											}
										})
						
											
					}
				}]
			});			
    	   
       }
     
      /*  function submitForm(){
    	   
    	   var number=$("#number").val();
    	   var name=$("#name").val();
    	   var phone=$("#phone").val();
    	   var role=$("#role").val();
    	 
    	   alert(role);
    	   getData("${pageContext.request.contextPath}/getFiles1",number,name,phone,role); 
    	   
    	   
       } */
       
       function getData(url,uploadname,filename,uploaddate){
    	   $('#dg').datagrid({
    		   url:url,
    		   title:'用户列表',
    		   border:false,
    		   rownumbers:true,    		
    		   toolbar:'#tb',
    		   pagination:true,
    		   pageSize:"10",
    		   //easyui默认提交数据，提交其他数据 queryParam
    		   queryParams:{
    			  uploadname:uploadname, 
    			  filename:filename,
    			  uploaddate:uploaddate,
    			 		   			   
    		   },
    		   pageList :[10,15,20,999],
    		   singleSelect:true,
    		   columns:[[{
    			   field:'id',
    			   value:'id',
    			   checkbox:true,
    			   title:'选择',
    			   width:50    			   
    		   },{
    			   field:'uploadname',
    			   title:'上传人',
    			   width:80
    		   },{
    			   field:'filename',
    			   title:'文件名',
    			   width:350
    		   },{
    			   field:'uploaddate',
    			   title:'上传时间',
    			   formatter : formatDatebox,
    			   width:220
    		   } ]]
    		   
    	   });
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
		
		const downloadFile = (url, fileName = '') => {
	  		  let eleLink = document.createElement('a');
	  		  eleLink.download = fileName;
	  		  eleLink.style.display = 'none';
	  		  eleLink.href = url;
	  		  // 受浏览器安全策略的因素，动态创建的元素必须添加到浏览器后才能实施点击
	  		  document.body.appendChild(eleLink);
	  		  // 触发点击  
	  		  eleLink.click();
	  		  // 然后移除
	  		  document.body.removeChild(eleLink);
	  		};
    
</script>
	
</html>