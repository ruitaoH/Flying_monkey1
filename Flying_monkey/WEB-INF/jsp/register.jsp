<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: haoruitao
  Date: 16-4-13
  Time: 下午11:35
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
    <title>试试--注册</title>
    <link rel="stylesheet" type="text/css" href="css/styleCommon.css">
    <link rel="stylesheet" type="text/css" href="css/styleRegister.css">
    <script type="text/javascript" src="js/md5.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
    <script type="text/javascript" src="js/checkForm.js"></script>
</head>
<body>
<header><!--改动过-->
    <h1 class="heading">注册</h1>
    <a id="back" href="index.jsp">返回</a>
</header>
<div class="container"><!--表单顺序调整过-->
    <form id="form" name="register" action="register/register" method="POST"><!--改动过-->
        <label class="heading"></label>
        <label><p>昵称:</p><input name="nickname" type="text" placeholder="如:布鲁斯"></label>
        <label><p>性别</p>
            <input name="sex" type="radio" value="male" checked>
            <p>男生</p>
            <input name="sex" type="radio" value="female">
            <p>女生</p>
        </label>
        <label><p>邮箱:</p><input name="email" type="email" placeholder="作为登录账号"></label>
        <label><p>密码:</p><input id="pwd-input" type="password" placeholder="请输入密码"></label>
        <label style="display: none;"><input name="password" id="pwd-md5" type="password"></label>
        <label><p>专业:</p><input name="major" type="text" placeholder="如XX院系XX专业"></label>
        <label><p>手机:</p><input name="phone" type="text" placeholder="重要, 方便他人联系你"></label>
        <label><p>QQ/微信:</p><select id="contactMethod" style="width:50%;">
            <option value="qq">QQ</option>
            <option value="weixin">微信</option>
        </select></label><!--改动过-->
        <a class="button" id="register-btn" onclick="registerCheck();">注册</a>
    </form>
</div>
<!--改动过-->
<script type="text/javascript">
    (function () {
        var select = document.getElementById('contactMethod');
        var form = document.getElementById('form');
        var label = document.createElement('label');
        var name_cn;
        select.onchange = function () {
            if (select.value == 'qq') {
                name_cn = 'QQ:';
            } else {
                name_cn = '微信:';
            }
            label.innerHTML = '<p>' + name_cn + '</p><input id="' + select.value + '" name="' + select.value + '" type="text" placeholder="请输入' + name_cn + '">';
            form.insertBefore(label, document.getElementById('register-btn'));
        }
        select.onchange();
    })();
</script>
</body>
</html>