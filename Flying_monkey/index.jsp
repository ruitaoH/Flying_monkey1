<%--
  Created by IntelliJ IDEA.
  User: haoruitao
  Date: 16-4-16
  Time: 下午4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath %>" />
</head>
<body>
    <jsp:forward page="WEB-INF/jsp/index.jsp" />
</body>
</html>
