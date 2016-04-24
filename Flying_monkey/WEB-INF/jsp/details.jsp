<%@ page import="com.hrt.domain.User" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <title>试试--物品详情</title>
    <link rel="stylesheet" type="text/css" href="css/styleCommon.css">
    <link rel="stylesheet" type="text/css" href="css/styleDetails.css">
    <script type="text/javascript" src="js/checkForm.js"></script>
</head>
<body>
<header>
    <h1 class="heading">试试</h1>
    <a id="back" href="index.jsp">返回</a>
</header>
<div class="container">
    <div class="user">
        <span class="user-logo"><img src="images/user-logo.png"></span>
        <p class="user-name"><s:property value="user.nickname" /><small><s:property value="user.major" /></small></p>
        <span class="time"><s:property value="commodity.time" /></span>
    </div>
    <div class="image">
        <img src="<s:property value="commodity.image" />">
        <div class="img-mask">
            <span><s:property value="commodity.value" /></span>
            <span><s:property value="commodity.buy_place" /></span>

            <%--这三个是什么鬼???--%>
        </div>
    </div>
    <div class="info">
        <div class="something">
            <span class="type"><s:property value="commodity.type" /></span>
            <h1 class="name"><s:property value="commodity.name" /></h1>
            <p class="main-info"><s:property value="commodity.tip" /></p>
            <span class="price"><span></span><s:property value="commodity.price" />元/次</span>
        </div>
        <div class="try try_content">
            <h4>试用内容<span class="want-num"><s:property value="try_count" />人想试</span></h4>
            <p><s:property value="commodity.content" /></p>
        </div>
        <div class="try try_place">
            <h4>试用地点</h4>
            <p><s:property value="commodity.try_place" /></p>
        </div>
        <%
            if(session.getAttribute("user") != null){
                ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");
                User owner = (User)vs.findValue("user");

                User tryer = (User) session.getAttribute("user");
                if(tryer.getEmail().equals(owner.getEmail())){
        %>
        <a class="button" id="reserver-button" onclick="warn('不能申请试用自己的物品');">预约试用</a>
        <%
                }else{
        %>
        <a class="button" id="reserver-button" onclick="openForm('<s:property value="commodity.image" />');">预约试用</a>
        <%
                }
        %>
        <%
            }else{
        %>
        <a class="button" id="reserver-button" onclick="window.location.href='log/login'">预约试用</a>
        <%
            }
        %>
    </div>
</div>
<script type="text/javascript">
    function checkReserver(image){

        var info = reserver.info;

        if (checkIsEmpty(info,'申请说明不能为空!')){
            return false;
        }
        var xmlHttp = getXmlHttp();
        xmlHttp.open('GET','try/try?info='+info.value+"&image="+image,true);
        xmlHttp.send();
        xmlHttp.onreadystatechange = function(){
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                var json = JSON.parse(xmlHttp.responseText);

                if(json == 'success'){
                    warn('预约提交成功');

                    closeForm();
                }else if(json == 'error'){
                    warn('预约提交失败');

                    closeForm();
                }
            }
        }
    }
    function openForm(image){
        var form = document.createElement('div');
        form.id = 'reserverForm';
        form.innerHTML = '<form name="reserver">\
        <span id="close" onclick="closeForm();"><span></span><span></span></span>\
                <label>预约说明</label>\
                <label><p>申请说明</p ><textarea name="info" placeholder="限制70字以内"></textarea><span>注:本次试用为有偿试用</span></label>\
        <label><a class="button" id="reserver-btn" onclick="checkReserver(\'' + image + '\');">试试</a ></label>\
                </form>';
        document.body.appendChild(form);

    }
    function closeForm(){
        document.body.removeChild(document.getElementById('reserverForm'));
    }
</script>
</body>
</html>