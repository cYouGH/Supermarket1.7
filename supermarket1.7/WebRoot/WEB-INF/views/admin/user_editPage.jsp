<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/adminStatic/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/adminStatic/css/admin.css">
<script src="${pageContext.request.contextPath}/adminStatic/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/adminStatic/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 编辑用户信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="user_edit.action">

      
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户id：</label>
        </div>
        <div class="field">
              <input type="text" value="${model.uid}" name="uid" class="input w30"  readOnly>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w30" value="${model.username}" name="username" size="50"  data-validate="required:请输入新的用户名" />         
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label for="sitename">密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w30" value="${model.password}" name="password" size="50"  data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />         
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>   
        </div>
      </div>      
    </form>
  </div>
</div>
</body></html>