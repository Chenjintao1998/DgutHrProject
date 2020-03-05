<!DOCTYPE HTML>
<html>
<head>
<meta charset="gb2312" />
<title></title>
<style>
</style>
</head>
<body>
	<form id="abc" name="abc" action="" method="post">
		<input id="t1" name="t1" type="text" /> <input id="t2" name="t2"
			type="text" /> <select id="s1" name="s1">
			<option value="option1">option1</option>
			<option value="option2">option2</option>
		</select> <input id="Submit1" type="submit" value="submit" />
	</form>
	<script type="text/javascript">
		$(function($) {
			$("#abc").setform({
				t1 : "3456",
				t2 : "4444",
				s1 : "option2"
			});
		});
		(function ($) {
			$.fn.setform = function (jsonValue) {
			var obj=this;
			$.each(jsonValue, function (id, ival) {obj.find("#" + id).val(ival); })
			}
			})(jQuery)
	</script>
	</body>
	</html>