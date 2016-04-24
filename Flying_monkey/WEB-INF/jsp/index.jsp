<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: haoruitao
  Date: 16-4-16
  Time: 下午4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>试试</title>
    <link rel="stylesheet" type="text/css" href="css/styleCommon.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="js/main.js"></script>
</head>
<body>
<header>
    <span class="shishi-logo"></span>

    <%--这里的路径是干什么的???--%>
    <%
        if(session.getAttribute("user") == null){
    %>
    <a class="button" id="denglu" href="log/login">注册/登陆</a>
    <%
        }else{
    %>
    <div id="user">
        <span id="user-logo"><img src="images/user-logo.png" /></span>
        <p id="user-name"><s:property value="#session.user.nickname" /></p>
    </div>
    <%
        }
    %>
</header>
<div class="container">
    <div class="cols" id="col-1"></div>
    <div class="cols" id="col-2"></div>
</div>
<nav>
    <ul>
        <li><span class="try-icon"></span><a class="button">试试</a></li>
        <li><span class="issue-icon"  onclick="window.location.href='checklogin/checkPublish'"></span><a class="button" onclick="window.location.href='checklogin/checkPublish'">发布</a></li>
        <li><span class="center-icon"></span><a class="button" onclick="window.location.href='checklogin/checkPersonal'">个人中心</a></li>
    </ul>
</nav>
</body>
</html>