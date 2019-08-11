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
    <title>购买</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
</head>
<body style="padding-top: 150px">
<div class="container">
    <img src="chy_img/${drug.photo}" width="250px" height="150px"/>
    <ul class="list-group" style="width: 250px;">
        <li class="list-group-item">药品名:${drug.name}</li>
        <li class="list-group-item">价格:${drug.price}元</li>
        <li class="list-group-item">库存:${drug.inventory}</li>
        <li class="list-group-item">数量:<input type="number" min="1" max="99" value="1" id="A3"/></li>
    </ul>
    <botton class="btn btn-success">加入购物车</botton>
    <div style="display: none;" id="A1">${drug.name}</div>
    <div style="display: none;" id="A2">${drug.price}</div>
    <div style="display: none;" id="A4">${drug.photo}</div>
    <div style="display: none;" id="A5">${sessionScope.customer.serial}</div>
    <%--模态框--%>
    <div class="modal fade bs-example-modal-sm" id="insert" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                    <h1>&nbsp;&nbsp;&nbsp;&nbsp;添加成功!</h1>
            </div>
        </div>
    </div>
</div>
    <script src="chy_js/jquery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="chy_js/buy.js"></script>
</body>
</html>