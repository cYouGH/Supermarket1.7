<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 倒计时跳转 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<HEAD>
		<meta http-equiv='refresh' content='5;url=login.jsp'>
		<script type='text/javascript'>
			var i = 5;
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
		<img src="${pageContext.request.contextPath}/uploadImages/smile.png" width="250px" height="250px">

			<h2>
				恭喜您，账户激活成功！页面将在<div id='num' style='display=inline;'>5</div>秒后跳转
			</h2>
		</div>
	</BODY>
</html>