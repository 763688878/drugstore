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
<form action="yp_xg" method="post">
    ID:<input type="text" name="id" value=${y.id} readonly  /></br>
    药品名称:<input type="text" name="name" value=${y.name} /></br>
    单价:<input type="text" name="price" value=${y.price} /></br>
    库存:<input type="text" name="inventory"  value=${y.inventory} /></br>
    <input type="submit" value="修改"  class="btn btn-success"/></br>
</form>
</div>
</body>
</html>