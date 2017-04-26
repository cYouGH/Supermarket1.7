<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/adminStatic/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/adminStatic/css/admin.css">
<script
	src="${pageContext.request.contextPath}/adminStatic/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/adminStatic/js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span> 添加用户</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="user_add">

				<div class="form-group">
					<div class="label">
						<label for="sitename">用户名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w30" id="username" name="username"
							size="50" placeholder="请输入用户名" data-validate="required:请输入用户名" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label for="sitename">密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w30" name="newpass" size="50"
							placeholder="请输密码"
							data-validate="required:请输入密码,length#>=5:密码不能小于5位" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label for="sitename">确认密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w30" name="password" size="50"
							placeholder="请再次输入密码"
							data-validate="required:请再次输入密码,repeat#newpass:两次输入的密码不一致" />
					</div>
				</div>
				<input name="email" value="请联系管理员" type="hidden">
				<input name="isActivated" value="1" type="hidden">
				<input name="userPermission.upid" value="1" type="hidden">

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>