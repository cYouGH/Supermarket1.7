<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<script type="text/javascript">
	function redirect(){
		alert("恭喜您，密码修改成功！");
		parent.window.location.href="${pageContext.request.contextPath}/login.action";
	}
	window.onload=redirect
</script>
  </head>
</html>
