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
<link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="logincss/css/login.css">
<link rel="stylesheet" href="logincss/css/supersized.css">

<script src="logincss/js/supersized.3.2.7.min.js"></script>
<script src="logincss/js/supersized-init.js"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login" method="post"
		onsubmit="return check(this)">
		<div style="margin: 20px 0;"></div>
		<div
			style="width: 400px; padding: 50px 60px; background-image: url('logincss/img/bg1.png'); margin: 0 auto; margin-top: 100px">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="username" prompt="賬號"
					iconWidth="28" style="width: 100%; height: 34px; padding: 10px;">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-passwordbox" name="password" prompt="密碼"
					iconWidth="28" style="width: 100%; height: 34px; padding: 10px">
			</div>


			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="checkcode" name="checkcode"
					prompt="驗證碼" iconWidth="28"
					style="width: 100%; height: 34px; padding: 10px">
			</div>

			<div style="margin-bottom: 20px">
				<img alt="图片飞了" src="kaptcha" title="看不清,换一张" onclick="changeCode()"
					id="codeimg">
			</div>
			<button type="submit" class="easyui-linkbutton c1"
				style="width: 120px">登錄</button>
			<a id="btn" href="#" class="easyui-linkbutton" onClick="register()"style="width: 120px">注册</a> 
			<div id="dd"></div>
		</div>
	</form>
</body>

<script type="text/javascript">
	function register() {
		
		$('#dd').dialog({
			title : '注册',
			width : 800,
			height : 500,
			closed : false,
			href : './register.jsp',
			cache : false
		});

	}

	function check() {
		var checkcode = $("#checkcode").val();
		$.ajaxSetup({
			async : false
		});
		var json = {
			"checkcode" : checkcode
		};
		var result = false;
		$.post("check", json, function(data) {
			if (data == "1") {
				result = true;
			} else {
				result = false;
			}
		});
		if (result) {
		} else {
			$.messager.alert('登录失败', "验证码错误", 'error');
			changeCode();
		}

		return result;
	}

	$(function() {

		/* //用post方法完成ajax提交数据:rul,json，data:返回值
			var checkcode = $("#checkcode").val();
			var json = {
				"checkcode" : checkcode
			};
			$.post("check", json, function(data) {
				if (data == "1") {
					return true;
				} else {
					$.messager.alert('登录失败',"验证码错误",'error');
					event.preventDefault();
					return false;
				}
			}); */

		var loginInfo = "${loginInfo}";

		if (loginInfo != null && loginInfo != "") {

			$.messager.alert('登录失败', loginInfo, 'error');
		}

	})

	//封装一个获取验证码的方法
	function changeCode() {
		var time = new Date().getTime();//得到当前时间
		document.getElementById("codeimg").src = "kaptcha?time=" + time;

	}
</script>
</html>