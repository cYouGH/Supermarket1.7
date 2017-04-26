<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 	<HEAD>
		<meta http-equiv='refresh' content='10;url=login.action'>
		<script type='text/javascript'>
			var i = 10;
			function getTime() {
				document.getElementById('num').innerHTML = "<font color='red'>" + i
				+ "</font>";
				i -= 1;
				var x = setTimeout('getTime()', 1000)
				if (i <= 0) {
					clearTimeout(x);
				}
			}
			window.onload = getTime;
		</script>
		<TITLE>跳转</TITLE>
	</HEAD>
	<BODY>
		<div align="center">
		<img src="${pageContext.request.contextPath}/adminStatic/images/smile.png" width="250px" height="250px">

			<h2>
				恭喜您，注册成功，将在<span id='num'></span>秒<br>后跳转至登录页面。<br>请及时去您的注册邮箱点击验证码进行激活。
			</h2>
		</div>
	</BODY>
</html>
