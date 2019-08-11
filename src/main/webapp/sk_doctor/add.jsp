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
    <title>添加页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
</head>
<body>
<div class="container" style="padding-top: 100px">
<form action="dc_zj" method="post" enctype="multipart/form-data">
    电话:<input type="text" name="tel"  /></br>
    医师姓名:<input type="text" name="name" /></br>
    医生编号:<input type="text" name="serial"  /></br>
    医师资格证:<input type="text" name="certificate" /></br>
    职位:<input type="text" name="post"   /></br>
    科别:<input type="text" name="subject" /></br>
    所属医院:<input type="text" name="hospital"/></br>
    从业年龄:<input type="text" name="employage"/></br>
    单笔问诊金额:<input type="text" name="medicalexpen"  /></br>
    审核状态:<input type="text" name="status" /></br>
    身份证号:<input type="text" name="idcard"  /></br>
    头像:<input type="file" name="pho" /></br>
    是否在线:<input type="text" name="online"   /></br>
    <input type="submit" value="添加"  class="btn btn-success" /></br>
</form>
</div>
</body>
</html>