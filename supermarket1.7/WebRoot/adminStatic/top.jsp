<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>top</title>
<link href="${pageContext.request.contextPath}/adminStatic/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/adminStatic/js/jquery.js"></script>



</head>

<body style="background:url(${pageContext.request.contextPath}/adminStatic/images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a><img src="${pageContext.request.contextPath}/adminStatic/images/logo.png" title="系统首页" /></a>
    </div>
            
    <div class="topright">    
    <ul>
    <li><span><img src="${pageContext.request.contextPath}/adminStatic/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="${pageContext.request.contextPath}/user_exit.action" target="_parent" onclick="return confirm('确定退出?');">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${session.loginUser.username}</span>
    <i>消息</i>
    <b>0</b>
    </div>    
    
    </div>


</body>
</html>
