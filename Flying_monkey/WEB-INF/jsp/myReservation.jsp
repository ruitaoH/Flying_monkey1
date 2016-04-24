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
    <title>试试--收到的预约</title>
    <link rel="stylesheet" type="text/css" href="css/styleCommon.css">
    <link rel="stylesheet" type="text/css" href="css/styleMyReservation.css">
    <script type="text/javascript" src="js/myReservation.js"></script>
</head>
<body>
<header>
    <h1 class="heading">试试</h1>
    <a id="back" href="checklogin/checkPersonal">返回</a>
</header>
<div class="container">
    <ul>
    </ul>
</div>
<nav>
    <ul>
        <li><span class="try-icon"></span><a class="button" href="index.jsp">试试</a></li><!--路径-->
        <li><span class="issue-icon"></span><a class="button" href="checklogin/checkPublish">发布</a></li><!--路径-->
        <li><span class="center-icon-on"></span><a class="button" href="checklogin/checkPersonal">个人中心</a></li>
    </ul>
</nav>
<script type="text/javascript">
    function displayInfo(e){
        var swi = e.parentNode;
        var applyInfo = swi.parentNode;
        if(/apply-info-on/.test(applyInfo.className)){
            applyInfo.className = 'apply-info';
        } else {
            applyInfo.className += ' apply-info-on';
        }
    }

    function contact(phone, qq, wechat) {
        var contactWrap = document.createElement('div');
        contactWrap.className = 'contact-wrap-mask';
        var html = '<div class="contact-host">\
        <ul>';
        if (phone != "") {
            html += '<li><a href=" ' + phone + '" style="color: rgb(203,22,3)">打电话: ' + phone + '</a ></li>';
        }
        if (qq != "") {
            html += '<li>QQ:' + qq + '</li>';
        }
        if (wechat != "") {
            html += '<li>微信:' + wechat + '</li>';
        }
        html += '</ul>\
    <ul>\
    <li onclick="closeContact();">取消</li>\
        </ul>\
        </div>';
        contactWrap.innerHTML = html;
        document.body.appendChild(contactWrap);
        setTimeout(function () {
            document.getElementsByClassName('contact-host')[0].id = 'contact-host-on';
        }, 0);
    }
    function closeContact() {
        document.getElementById('contact-host-on').id = '';
        setTimeout(function () {
            document.body.removeChild(document.getElementsByClassName('contact-wrap-mask')[0]);
        }, 600);

    }
</script>
</body>
</html>

