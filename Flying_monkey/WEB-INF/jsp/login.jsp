<%--
  Created by IntelliJ IDEA.
  User: haoruitao
  Date: 16-4-11
  Time: 上午8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv=Content-Type content="text/html;charset=utf-8">
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width">
    <meta name="author" content="Bingyan Studio">
    <title>试试--登陆</title>
    <link rel="stylesheet" type="text/css" href="css/styleCommon.css">
    <link rel="stylesheet" type="text/css" href="css/styleLogin.css">
    <script type="text/javascript" src="js/md5.js"></script>
    <script type="text/javascript" src="js/checkForm.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<header><!--改动过-->
    <h1 class="heading">登陆</h1>
    <a id="back" href="index.jsp">返回</a>
</header>
<div class="container">
    <form name="login" action="log/login" method="POST">
        <label class="heading"></label>
        <label><p>邮箱:</p><input type="email" name="email" placeholder="请输入登录帐号"></label><!--改动过-->
        <label><p>密码:</p><input id="pwd-input" type="password" placeholder="请输入密码"></label>
        <label style="display: none;"><input id="pwd-md5" name="password" type="password"></label>
        <a id="noAccount" href="forword/toRegister">没有账号?点击注册</a><!--改动过-->

        <%
            if(session.getAttribute("user") == null){
        %>
        <a class="button" id="login-btn" onclick="loginCheck();">登陆</a>
        <%
            }else{
        %>
        <a class="button" id="login-btn" onclick="warn('您已经登陆,请先注销');">登陆</a>
        <%
            }
        %>
    </form>
</div>
</body>
</html>



