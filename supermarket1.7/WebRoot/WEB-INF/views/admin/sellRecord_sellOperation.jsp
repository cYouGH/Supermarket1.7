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

<script type="text/javascript">
	function computeMoney(){
		var dis = document.getElementById("discount").value;
		var sCount = document.getElementById("sellCount").value;
		var price = document.getElementById("priceOut").value;
		var totalMoney = document.getElementById("totalMoney");
		var profit = document.getElementById("profit");
	if(${model.sellProduct.stockNum} >= sCount){
		totalMoney.value=0.1*dis*sCount*price;
		profit.value=totalMoney.value-${model.sellProduct.priceIn}*sCount;
		$("#opForm").submit();
	}else{
		alert("请输入正确的销售数量！");
		document.getElementById("sellCount").value="";
	}
	}
	function showMoney(){
		computeMoney();
	}
</script>

</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>操作内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="${pageContext.request.contextPath}/sellRecord/sellRecord_addRecord.action"
				name="opForm">
				<table border="0px" width="75%" height="100%" align="center">
					<tr>
						<td width="50%">
							<div class="form-group">
								<div class="label">
									<label>编号:</label>
								</div>
								<div class="field">
									<input type="text" class="input w50" value="${model.sellProduct.pid}" readonly />
									<div class="tips"></div>
								</div>
							</div>
						</td>
						<td>
							<div class="form-group">
								<div class="label">
									<label>总价:</label>
								</div>
								<div class="field">
									<input type="text" id="totalMoney" class="input w50" value="0"
										name="totalMoney" readonly />
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<div class="label">
									<label>售价:</label>
								</div>
								<div class="field">
									<input type="text" id="priceOut" class="input w50"
										value="${model.sellProduct.priceOut}" readonly />
								</div>
							</div>
						</td>
						<td><div class="form-group">
								<div class="label">
									<label>售量:</label>
								</div>
								<div class="field">
									<input type="text" id="sellCount" class="input w50"
										name="sellCount" data-validate="required:请输入数量" />
									<div class="tips"></div>
								</div>
							</div></td>
					</tr>
					<tr>
						<td><div class="form-group">
								<div class="label">
									<label>折扣:</label>
								</div>
								<div class="field">
									<input type="text" id="discount" class="input w50"
										name="discount" placeholder="输入10折为原价出售" data-validate="required:请输入折扣" onchange="computeMoney()" />
									<div class="tips"></div>
								</div>
							</div></td>
						<td>
							<div class="form-group">
								<div class="label">
									<label>利润:</label>
								</div>
								<div class="field">
									<input type="text" id="profit" class="input w50" value="0" name="profit"
										readonly />
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="field">
								<button class="button bg-main icon-check-square-o" onclick="showMoney()">
									提交</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
<s:debug></s:debug>
</body>
</html>