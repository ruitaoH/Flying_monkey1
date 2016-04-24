<%--
  Created by IntelliJ IDEA.
  User: haoruitao
  Date: 16-4-13
  Time: 下午11:34
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
    <title>试试--个人中心</title>
    <link rel="stylesheet" type="text/css" href="css/styleCommon.css"><!--路径-->
    <link rel="stylesheet" type="text/css" href="css/stylePersonCenter.css"><!--路径-->
    <script src="js/personCenter.js"></script>
</head>
<body>
<header>
    <h1 class="heading">账户</h1>
</header>
<div class="container">
</div>
<nav>
    <ul>
        <li><span class="try-icon"></span><a class="button" href="index.jsp">试试</a></li><!--路径-->
        <li><span class="issue-icon"></span><a class="button" href="checklogin/checkPublish">发布</a></li><!--路径-->
        <li><span class="center-icon-on"></span><a class="button">个人中心</a></li>
    </ul>
</nav>
</body>
</html>
