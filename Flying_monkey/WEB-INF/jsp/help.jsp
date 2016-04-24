<%--
  Created by IntelliJ IDEA.
  User: haoruitao
  Date: 16-4-24
  Time: 下午1:37
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
    <title>试试--帮助</title>
    <link rel="stylesheet" type="text/css" href="css/styleCommon.css">
    <style type="text/css">
        header .heading {
            color: rgb(203, 22, 3);
            font-size: 1.4rem;
        }

        #back {
            display: block;
            color: rgb(203, 22, 3);
            position: absolute;
            height: 100%;
            left: 3%;
            top: 0;
            line-height: 40px;
        }

        .container {
            margin-top: 40px;
            padding: 20% 10%;
        }

        h2 {
            font-size: 1rem;
            color: rgb(203, 22, 3);
            margin-bottom: 12px;
        }

        p {
            font-size: 0.85rem;
            color: rgb(170, 170, 170);
            line-height: 16px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<header>
    <h1 class="heading">帮助</h1>
    <a id="back" href="checklogin/checkPersonal">返回</a>
</header>
<div class="container">
    <h2>什么是试试？</h2>
    <p>试试”是一个校园个人数码产品的使用心得分享与付费体验的平台</p>
    <h2>如何试用？</h2>
    <p>想试用的用户提交预约申请，等待物主同意。若物主拒绝则申请无效，可以重新再申请说明询问详情；</p>
    <p>若物主同意申请，则在物主约定的地点体验产品。试用前先支付费用，然后物主在旁引导，完成试用内容后可询问物主相关问题或听其使用的心得，完成试用内容后可询问物主相关问题或听其使用的心得，完成此过程则代表试用完成</p>
</div>
</body>
</html>
