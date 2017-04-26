<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
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
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>更新内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="product_update.action"
				name="form2" enctype="multipart/form-data">
				<table border="0px" width="85%" height="100%" align="center">
					<tr>
						<td>
							<div class="form-group">
								<div class="label">
									<label>编号:</label>
								</div>
								<div class="field">
									<input type="text" class="input w50" value="${model.pid}"
										name="pid" readonly />
									<div class="tips"></div>
								</div>
							</div>
						</td>
						<td>
							<div class="form-group">
								<div class="label">
									<label>名称:</label>
								</div>
								<div class="field">
									<input type="text" class="input w50"
										value="${model.productName}" name="productName"
										data-validate="required:请输入名称" />
									<div class="tips"></div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<div class="label">
									<label>分类:</label>
								</div>
								<div class="field">
									<select name="productCategory.cid" style="padding:5px 15px; border:1px solid #ddd;">
									<option value="${model.productCategory.cid}" selected="selected">${model.productCategory.categoryName}</option>
										<s:iterator var="pl" value="pcList">
 										<option value='<s:property value="#pl.cid"/>'><s:property value="#pl.categoryName"/></option>
 										</s:iterator>
										</select>
										<div class="tips"></div>
								</div>
							</div>
						</td>
						<td><div class="form-group">
								<div class="label">
									<label>数量:</label>
								</div>
								<div class="field">
									<input type="text" class="input w50" value="${model.stockNum}"
										name="stockNum" data-validate="required:请输入数量" />
									<div class="tips"></div>
								</div>
							</div></td>
					</tr>
					<tr>
						<td><div class="form-group">
								<div class="label">
									<label>进价:</label>
								</div>
								<div class="field">
									<input type="text" class="input w50" value="${model.priceIn}"
										name="priceIn" data-validate="required:请输入进价" />
									<div class="tips"></div>
								</div>
							</div></td>
						<td><div class="form-group">
								<div class="label">
									<label>售价:</label>
								</div>
								<div class="field">
									<input type="text" class="input w50" value="${model.priceOut}"
										name="priceOut" data-validate="required:请输入售价" />
									<div class="tips"></div>
								</div>
							</div></td>
					</tr>
					<tr>
						<td width="55%">
							<div class="form-group">
								<div class="label">
									<label>图片:</label>
								</div>
								<div class="field">
									<input type="text" id="url1" name="uploadFilePath"
										class="input tips" style="width:25%; float:left;"
										value="${model.imgPath}" data-toggle="hover"
										data-place="right" data-image="${model.imgPath}" /> <input
										type="file" name="upload"><br>
									<div class="tipss">名称:英文，尺寸：70*50</div>
								</div>
							</div>

						</td>
						<td>
							<div class="form-group">
								<div class="label">
									<label>描述:</label>
								</div>
								<div class="field">
									<textarea class="input" name="disc" style=" height:90px;">${model.disc}</textarea>
									<div class="tips"></div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="hidden" value="${model.inTime}"
							name="inTime"></td>
						<td><input type="hidden" value="${model.outTime}"
							name="outTime"></td>
					<tr>
						<td colspan="2" align="center">
							<div class="field">
								<button class="button bg-main icon-check-square-o" type="submit">
									提交</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>