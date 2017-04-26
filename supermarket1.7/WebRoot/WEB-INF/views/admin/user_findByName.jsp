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
					href="user_addPage.action"> 添加用户</a></li>

				<li>搜索：</li>

				<li><input type="text" placeholder="请输入用户名" id="username"
					name="username" class="input"
					style="width:250px; line-height:17px;display:inline-block" /> <a
					href="javascript:void(0)" class="button border-main icon-search"
					onclick="changesearch()"> 搜索</a></li>
			</ul>
		</div>

		<form method="post" action="user_deleteChecked.action" id="listform">
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align:left; padding-left:20px;">ID</th>
					<!-- <th width="10%">排序</th> -->
					<th>用户名</th>
					<th>密码</th>
					<th>权限</th>
					<th>描述</th>

				</tr>
				<tr>
					<td style="text-align:left; padding-left:20px;">${model.uid}</td>
					<td>${model.username}</td>
					<!-- <td><input type="text" name="sort[1]" value="1" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" /></td> -->
					<td>${model.password}</td>
					<td>超级管理员</td>
					<td>niubility</td>
					<td><div class="button-group">
							<a class="button border-main" href="add.html"><span
								class="icon-edit"></span> 修改</a> <a class="button border-red"
								href="javascript:void(0)" onclick="del(${model.uid});"><span
								class="icon-trash-o"></span> 删除</a>
						</div></td>
				</tr>

				</table>
		</form>
	</div>
	<s:debug></s:debug>
	<script type="text/javascript">
	
		//搜索
		function changesearch() {
			var username = document.getElementById("username").value;
			window.location.href = "${pageContext.request.contextPath}/user_findByName.action?username=" + username;
		}
	
		//单个删除
		function del(id) {
			if (confirm("您确定要删除id为" + id + "的用户吗?")) {
				window.location.href = "${pageContext.request.contextPath}/user_delete.action?uid=" + id;
			}
		}
	
		//全选
		var checkArr = new Array();
		$("#checkall").click(function() {
			var i = 0;
			if (checkall.checked) {
				$("input[name='idArr']").each(function() {
					checkArr[i++] = this.checked;
					this.checked = true;
				});
			} else {
				$("input[name='idArr']").each(function() {
					this.checked = checkArr[i++];
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