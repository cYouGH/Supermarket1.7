<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/supersized.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/indexstylesheet.css">
</head>
<body>
	<header id="header">
		<span id="span">
			<div>R a i n</div>
		</span>
		<nav id="hd_nav">
			<ul>
				<li><a href="#">小型超市进销存管理信息系统</a></li>
			</ul>
		</nav>
	</header>

	<div class="page-container">
		<h1>登 陆</h1>
		<form action="user_login" method="post">
			<input type="text" name="username" class="username" placeholder="用户名">
			<input type="password" name="password" class="password"
				placeholder="密码">
			<button type="submit">登 陆</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>

		<div class="tip">
			<br>
			<s:actionmessage />
			<br>
			<a href="${pageContext.request.contextPath}/registPage.action">没有账户？点我注册。</a>
		</div>

		<div class="connect">
		<p>其它登陆:</p>
		<p>
			<a class="qq" href=""></a> <a class="weixin" href=""></a>
		</p>
	</div>
	<div></div>
	</div>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-1.8.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>

</body>
</html>