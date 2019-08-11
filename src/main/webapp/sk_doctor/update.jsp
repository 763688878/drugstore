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
<form action="dc_xg" method="post">
    ID:<input type="text" name="id" value=${d.id} readonly  /></br>
    电话:<input type="text" name="tel" value=${d.tel} /></br>
    医师姓名:<input type="text" name="name" value=${d.name} /></br>
    医生编号:<input type="text" name="serial"  value=${d.serial} /></br>
    医师资格证:<input type="text" name="certificate" value=${d.certificate} /></br>
    职位:<input type="text" name="post" value=${d.post} /></br>
    科别:<input type="text" name="subject" value=${d.subject} /></br>
    所属医院:<input type="text" name="hospital" value=${d.hospital} /></br>
    从业年龄:<input type="text" name="employage" value=${d.employage} /></br>
    单笔问诊金额:<input type="text" name="medicalexpen" value=${d.medicalexpen}  /></br>
    审核状态:<input type="text" name="status" value=${d.status} /></br>
    身份证号:<input type="text" name="idcard" value=${d.idcard}  /></br>
    头像:<input type="text" name="photo" value=${d.photo} /></br>
    是否在线:<input type="text" name="online" value=${d.online} /></br>
    <input type="submit" value="修改"  class="btn btn-success"/></br>
</form>
</div>
</body>
</html>