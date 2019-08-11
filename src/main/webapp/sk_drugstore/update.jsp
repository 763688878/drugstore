<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>修改页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="sk_css/index.css"/>
</head>
<body>
<div class="container" style="padding-top: 100px">
<form action="yd_xg" method="post">
    ID:<input type="text" name="id" value=${d.id} readonly  /></br>
    电话:<input type="text" name="tel" value=${d.tel} /></br>
    药店编号:<input type="text" name="serial" value=${d.serial} /></br>
    店名:<input type="text" name="name"  value=${d.name} /></br>
    地址:<input type="text" name="site" value=${d.site} /></br>
    <input type="submit" value="修改"  class="btn btn-success"/></br>
</form>
</div>
</body>
</html>