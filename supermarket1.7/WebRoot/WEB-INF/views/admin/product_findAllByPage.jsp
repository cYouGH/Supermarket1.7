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
		</div>
	<form method="post" action="product_deleteChecked.action" id="listform">
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
				<c:forEach items="${productPageBean.qpList}" var="pl">
					<tr>
						<td style="text-align:left; padding-left:20px;"><input
							type="checkbox" name="idArr"
							value="${pl.pid}" /> ${pl.pid} </td>
						<td>${pl.productName}</td>
						<td><img src="${pl.imgPath}" alt="" width="70" height="50" /></td>
						<!-- <td><input type="text" name="sort[1]" value="1" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" /></td> -->
						<td>${pl.priceIn}￥</td>
						<td>${pl.priceOut}￥</td>
						<td>${pl.stockNum}</td>
						<td>${pl.productCategory.categoryName}</td>
						<td>${pl.disc}</td>
						<td>${pl.inTime}</td>
						<td>${pl.outTime}</td>
						<td><div class="button-group">
								<a class="button border-main" href="product_updatePage.action?pid=${pl.pid}"><span
									class="icon-edit"></span> 修改</a> <a class="button border-red"
									href="javascript:void(0)"
									onclick="del(${pl.pid});"><span
									class="icon-trash-o"></span> 删除</a>
							</div></td>
					</tr>
				</c:forEach> 
					<tr>
						<td style="text-align:left; padding:19px 0;padding-left:20px;"><input
							type="checkbox" id="checkall" /> 全选</td>
						<td colspan="11" style="text-align:left;padding-left:20px;"><a
							href="javascript:void(0)" class="button border-red icon-trash-o"
							style="padding:5px 15px;" onclick="DelSelect()"> 删除</a>
							&nbsp;&nbsp;&nbsp; 权限选择： <select name="movecid"
							style="padding:5px 15px; border:1px solid #ddd;"
							onchange="changecate(this)">
								<option value="">请选择分类</option>
								<option value="">生活用品</option>
								<option value="">食品</option>
						</select></td>
					</tr>

					<tr>
						<td colspan="11"><div class="pagelist">
								<span class="current">第 ${productPageBean.currentPage} 页
								</span> <a href="product_findAllByPage.action?page=1">首页</a>

								<c:if test="${productPageBean.currentPage != 1}">
									<a
										href="product_findAllByPage.action?page="${productPageBean.currentPage-1}>上一页</a>
								</c:if>
								
								<c:forEach var="pIndex" begin="1" end="${productPageBean.totalPage}">
									<a
										href="product_findAllByPage.action?page=${pIndex}">${pIndex}</a>
								</c:forEach>

								<c:if
									test="${productPageBean.currentPage != productPageBean.totalPage}">
									<a
										href="product_findAllByPage.action?page=${productPageBean.currentPage+1}">下一页</a>
								</c:if>

								<a
									href="product_findAllByPage.action?page=${productPageBean.totalPage}">尾页</a>
								<span class="current">共 ${productPageBean.totalCount} 条
								</span>
							</div></td>
					</tr>
			</table>
			</form>
		

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
	
		//全选
		var checkArr = new Array();
		$("#checkall").click(function() {
			var i=0;
			if(checkall.checked){
				$("input[name='idArr']").each(function() {
					checkArr[i++]=this.checked;
					this.checked=true;
			});
			}else{
				$("input[name='idArr']").each(function() {
				this.checked=checkArr[i++];
				});
			} 
		})
	
		//批量删除
		function DelSelect() {
			var Checkbox = false;
			$("input[name='idArr']").each(function() {
				if (this.checked) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var t = confirm("您确认要删除选中的内容吗？");
				if (t == false) return false;
				$("#listform").submit(); 
				
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}
	
		//批量排序
		function sorts() {
			var Checkbox = false;
			$("input[name='idArr']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
	
				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");
				return false;
			}
		}
	
	
		//批量首页显示
		function changeishome(o) {
			var Checkbox = false;
			$("input[name='idArr']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
	
				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");
	
				return false;
			}
		}
	
		//批量推荐
		function changeisvouch(o) {
			var Checkbox = false;
			$("input[name='idArr']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
	
	
				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");
	
				return false;
			}
		}
	
		//批量置顶
		function changeistop(o) {
			var Checkbox = false;
			$("input[name='idArr']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
	
				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");
	
				return false;
			}
		}
	
	
		//批量移动
		function changecate(o) {
			var Checkbox = false;
			$("input[name='idArr']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
	
				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");
	
				return false;
			}
		}
	
		//批量复制
		function changecopy(o) {
			var Checkbox = false;
			$("input[name='idArr']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var i = 0;
				$("input[name='idArr']").each(function() {
					if (this.checked == true) {
						i++;
					}
				});
				if (i > 1) {
					alert("只能选择一条信息!");
					$(o).find("option:first").prop("selected", "selected");
				} else {
	
					$("#listform").submit();
				}
			} else {
				alert("请选择要复制的内容!");
				$(o).find("option:first").prop("selected", "selected");
				return false;
			}
		}
	</script>
</body>
</html>