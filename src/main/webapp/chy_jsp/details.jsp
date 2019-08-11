<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>医生详情</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
</head>
<body style="padding-top:150px ">
<div class="container">
    <img src="chy_img/${doctor.photo}" width="300px" height="200px"/>
    <ul class="list-group" style=" width: 300px;">
        <li class="list-group-item">医师姓名:${doctor.name}</li>
        <li class="list-group-item">电话:${doctor.tel}</li>
        <li class="list-group-item">医生编号:${doctor.serial}</li>
        <li class="list-group-item">所属医院:${doctor.hospital}</li>
        <li class="list-group-item">职位:${doctor.post}</li>
        <li class="list-group-item">科别:${doctor.subject}</li>
        <li class="list-group-item">从业年龄:${doctor.employage}年</li>
        <li class="list-group-item">单笔问诊金额:${doctor.medicalexpen}元</li>
    </ul>
    <a href="customers?name=${sessionScope.customer.name}" class="btn btn-primary">进入聊天</a>
</div>
</body>
</html>