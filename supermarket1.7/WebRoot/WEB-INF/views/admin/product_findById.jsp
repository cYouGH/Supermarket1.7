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
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float:right; display:none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-right:10px;">
					<li><a class="button border-main icon-plus-square-o"
						href="product_addPage.action"> 添加产品</a></li>

					<li>搜索：</li>

					<li><input type="text" placeholder="请输入产品ID"
						id="productId" class="input"
						style="width:250px; line-height:17px;display:inline-block" /> <a
						href="javascript:void(0)" class="button border-main icon-search"
						onclick="changesearch()"> 搜索</a></li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align:left; padding-left:20px;">ID</th>
					<!-- <th width="10%">排序</th> -->
					<th>名称</th>
					<th>图片</th>
					<th>进价</th>
					<th>售价</th>
					<th>库存</th>
					<th>所属</th>
					<th>备注</th>
					<th>入库时间</th>
					<th>出库时间</th>
					<th>操作</th>
				</tr>
					<tr>
						<td style="text-align:left; padding-left:20px;">${model.pid}</td>
						<td>${model.productName}</td>
						<td><img src="${model.imgPath}" alt="" width="70" height="50" /></td>
						<!-- <td><input type="text" name="sort[1]" value="1" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" /></td> -->
						<td>${model.priceIn}￥</td>
						<td>${model.priceOut}￥</td>
						<td>${model.stockNum}</td>
						<td>${model.productCategory.categoryName}</td>
						<td>${model.disc}</td>
						<td>${model.inTime}</td>
						<td>${model.outTime}</td>
						<td><div class="button-group">
								<a class="button border-main" href="product_updatePage.action?pid=${model.pid}"><span
									class="icon-edit"></span> 修改</a> <a class="button border-red"
									href="javascript:void(0)"
									onclick="del(${model.pid});"><span
									class="icon-trash-o"></span> 删除</a>
							</div></td>
					</tr>
			</table>
		</div>


	<script type="text/javascript">
	
		//搜索
		function changesearch() {
			var pid=document.getElementById("productId").value;

			window.location.href = "${pageContext.request.contextPath}/product_findById.action?pid="+pid;
		}
	
		//单个删除
		function del(id) {
			if (confirm("您确定要删除id为"+id+"的用户吗?")) {
				window.location.href = "${pageContext.request.contextPath}/product_delete.action?pid="+id;
			}
		}
	
	</script>
</body>
</html>