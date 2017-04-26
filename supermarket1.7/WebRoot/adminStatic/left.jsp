<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left</title>
<link
	href="${pageContext.request.contextPath}/adminStatic/css/style.css"
	rel="stylesheet" type="text/css" />
<script language="JavaScript"
	src="${pageContext.request.contextPath}/adminStatic/js/jquery.js"></script>

<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson li").click(function() {
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
	})
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop">
		<span></span>菜单
	</div>

	<dl class="leftmenu">

		<dd>
			<div class="title">
				<span><img
					src="${pageContext.request.contextPath}/adminStatic/images/leftico01.png" /></span>您的开始
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="welcome.html" target="rightFrame">欢迎登入</a><i></i></li>
				<li><cite></cite><a href="aboutMe.html" target="rightFrame">关于毕设</a><i></i></li>
				<li><cite></cite><a href="thanks.html" target="rightFrame">鸣谢</a><i></i></li>
			</ul>
		</dd>


		<dd>
			<div class="title">
				<span><img
					src="${pageContext.request.contextPath}/adminStatic/images/leftico02.png" /></span>用户管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a
					href="${pageContext.request.contextPath}/user_findAllByPage.action"
					target="rightFrame">显示用户</a><i></i></li>
				<li><cite></cite><a
					href="${pageContext.request.contextPath}/user_addPage.action"
					target="rightFrame">添加用户</a><i></i></li>
				<li><cite></cite><a
					href="${pageContext.request.contextPath}/user_changePswPage.action"
					target="rightFrame">修改密码</a><i></i></li>
			</ul>
		</dd>


		<dd>
			<div class="title">
				<span><img
					src="${pageContext.request.contextPath}/adminStatic/images/leftico03.png" /></span>货物管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a
					href="${pageContext.request.contextPath}/product_addPage.action"
					target="rightFrame">进货</a><i></i></li>
				<li><cite></cite><a
					href="${pageContext.request.contextPath}/product_sellIndex.action"
					target="rightFrame">出货</a><i></i></li>
				<li><cite></cite><a
					href="${pageContext.request.contextPath}/product_findAllByPage.action"
					target="rightFrame">显示所有</a><i></i></li>
			</ul>
		</dd>

		<dd>
			<div class="title">
				<span><img
					src="${pageContext.request.contextPath}/adminStatic/images/leftico04.png" /></span>出货统计
			</div>
			<ul class="menuson">
				<li><cite></cite><a
					href="${pageContext.request.contextPath}/sellRecord/sellRecord_findAll.action"
					target="rightFrame">出货记录</a><i></i></li>
				<li><cite></cite><a href="#" target="rightFrame">出货统计</a><i></i></li>
			</ul>
		</dd>


		<dd>
			<div class="title">
				<span><img
					src="${pageContext.request.contextPath}/adminStatic/images/leftico05.png" /></span>等待扩展
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="#">敬请期待</a><i></i></li>
			</ul>

		</dd>

	</dl>


</body>
</html>
