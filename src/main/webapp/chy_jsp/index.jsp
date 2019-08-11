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
    <title>主页</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="chy_css/index.css"/>
</head>
<body>
<div id="header">
    <div id="header1">
        <select style="height: 30px;">
            <option selected>--请选择药房--</option>
            <option value="1">春天大药房</option>
            <option value="2">同济大药房</option>
            <option value="3">修正大药房</option>
        </select>
    </div>
    <div id="header2">
        <ul class="list-inline">
            <li>您好!
                <c:if test="${empty customer}">
                    <a href="yq_jsp/login.jsp" style="color:red">请登录</a>
                </c:if>
                <c:if test="${!empty customer}">
                    <span style="color: green" id="span1">${sessionScope.customer.name}</span>
                    <span style="display: none;" id="span2">${sessionScope.customer.id}</span>
                    <a href="yq_jsp/login.jsp">退出登录</a>
                </c:if>
            </li>
            <li><a href="yq_jsp/register.jsp">注册</a></li>
            <c:if test="${!empty customer}">
                <li><a href="zz_findOrderByid?customerId=${customer.serial}">我的订单</a></li>
                <li><a href="chy_reset?customerSerial=${sessionScope.customer.serial}">购物车</a></li>
            </c:if>
        </ul>
    </div>
</div>
<div id="wrap">
    <div id="main">
        <img src="chy_img/index0.jpg"/>
        <div id="main1">
            <ul class="list-group" id="u1">
                <li class="list-group-item">中西药品</li>
                <li class="list-group-item">营养保健</li>
                <li class="list-group-item">维生素钙</li>
                <li class="list-group-item">隐形眼镜</li>
                <li class="list-group-item">医疗器械</li>
                <li class="list-group-item">美妆个护</li>
                <li class="list-group-item">成人用品</li>
                <li class="list-group-item">母婴专品</li>
                <li class="list-group-item">休闲零食</li>
                <li class="list-group-item">口腔诊疗</li>
            </ul>
            <div id="left">
                <img src="../chy_img/index01.jpg"/>
                <img src="../chy_img/index02.jpg"/>
                <img src="../chy_img/index03.jpg"/>
                <img src="../chy_img/index04.jpg"/>
                <img src="../chy_img/index05.jpg"/>
                <img src="../chy_img/index06.jpg"/>
                <img src="../chy_img/index07.jpg"/>
                <img src="../chy_img/index08.jpg"/>
                <img src="../chy_img/index09.jpg"/>
                <img src="../chy_img/index10.jpg"/>
            </div>
            <div id="right"></div>
        </div>
        <div id="main2">
            <img src="chy_img/index1_1.jpg"/>
        </div>
        <div id="main3">
            <h3>在线医师</h3>
        </div>
    </div>
</div>
<div id="bottom">
    <p>版权所有&copy;药必达</p>
</div>
<script src="chy_js/jquery.js"></script>
<script src="chy_js/index.js"></script>
</body>
</html>