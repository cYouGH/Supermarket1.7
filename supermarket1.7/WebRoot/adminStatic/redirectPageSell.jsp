<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<script type="text/javascript">
	function redirect(){
		alert("恭喜您，出库成功！");
		parent.window.location.href="${pageContext.request.contextPath}/product_findAllByPage.action";
	}
	window.onload=redirect
</script>
  </head>
</html>
