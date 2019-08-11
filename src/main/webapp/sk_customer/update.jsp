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
<form action="cs_xg" method="post">
    ID:<input type="text" name="id" value=${s.id} readonly  /></br>
    电话:<input type="text" name="tel" value=${s.tel} /></br>
    密码:<input type="text" name="password" value=${s.password} /></br>
    客户编号:<input type="text" name="serial" value=${s.serial} /></br>
    姓名:<input type="text" name="name" value=${s.name}  /></br>
    年龄:<input type="text" name="age" value=${s.age} /></br>
    性别:<input type="text" name="sex" value=${s.sex}  /></br>
    地址:<input type="text" name="site" value=${s.site} /></br>
    病历:<input type="text" name="medicalrecord" value=${s.medicalrecord} /></br>
    <input type="submit" value="修改"  class="btn btn-success"/></br>
</form>
</div>
</body>
</html>