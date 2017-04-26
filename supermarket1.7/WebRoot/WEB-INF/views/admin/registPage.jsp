<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="keywords">
<meta name="description">
<link rel="shortcut icon" href="resources/images/favicon.ico" />
<link
	href="${pageContext.request.contextPath}/adminStatic/css/registStyle.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/adminStatic/js/jquery2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/adminStatic/js/ajax-framework-hands.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/adminStatic/js/jquery.validate.js"></script>
<%-- <script type="text/javascript">
	function checkUsername(uname) {
		ajaxHandsUtils.getAjaxRequest("registCheck.action", function(xhr) {
			document.getElementById("msg").innerHTML = xhr.responseText;
		}, "post", "username=" + uname, true)
	}
</script> --%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#signupForm").validate({
			rules : {
				username : {
					required : true,
					remote : "registCheck.action",
					minlength : 2
				},
				password : {
					required : true,
					minlength : 5
				},
				confirm_password : {
					required : true,
					minlength : 5,
					equalTo : "#password"
				},
				email : {
					required : true,
					email : true
				},
				agree : "required"
			},
			messages : {
				username : {
					remote : "用户名重复",
					required : "请输入用户名",
					minlength : "用户名最少为2个字符"
				},
				password : {
					required : "请输入密码",
					minlength : "密码必须为5个字符"
				},
				confirm_password : {
					required : "密码不可为空",
					minlength : "密码最少为5个字符",
					equalTo : "两次输入的密码不同"
				},
				email : "请输入合格的邮箱",
				agree : "这是霸王条款。[微笑]"
			},
		});
	});
</script>
</head>
<body class="loginbody">
	<div class="dataEye">
		<div class="loginbox registbox">

			<div class="login-content reg-content">
				<div class="loginbox-title">
					<h3>注册</h3>
				</div>
				<form id="signupForm" method="post"
					action="${pageContext.request.contextPath}/regist.action">
					<div class="login-error"></div>
					<div class="row">

						<input placeholder="用户名" type="text" value=""
							class="input-text-user noPic input-click" name="username"
							id="username"><span id="msg"></span>
					</div>
					<div class="row">

						<input placeholder="密码" type="password" value=""
							class="input-text-password noPic input-click" name="password"
							id="password">
					</div>
					<div class="row">

						<input placeholder="确认密码" type="password" value=""
							class="input-text-password noPic input-click"
							name="confirm_password" id="confirm_password">
					</div>
					<div class="row">

						<input placeholder="邮箱" type="text" value=""
							class="input-text-user noPic input-click" name="email" id="email">
					</div>

					<div class="row tips">
						<br> <input type="checkbox" name="agree"> <label>
							我已阅读并同意 <a>隐私政策、服务条款</a>
						</label>
					</div>
					<input name="userPermission.upid" value="2" type="hidden">
					<div class="row btnArea">
						<button type="submit" class="login-btn" id="submit">注册</button>
					</div>
				</form>
			</div>
			<div class="go-regist">
				已有帐号,请<a href="login.action" class="link">登录</a>
			</div>
		</div>

		<div id="footer">
			<div class="dblock">
				<div class="inline-block copyright">
					<p>江汉大学文理学院13计算机科学与技术本科毕设</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
