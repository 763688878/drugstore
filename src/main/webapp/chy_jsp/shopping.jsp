<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>注册</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
</head>
<body style="padding-top: 100px">
<%--结算模态框--%>
<div class="modal fade bs-example-modal-sm" id="jsModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <h3 style="text-align: center">结算</h3>
            <div id="ordermd">
                <%--结算信息填充--%>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" id="qrjs">确认结算</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">稍作考虑...</button>
        </div>
    </div>
</div>
<div class="container">
    <h1>购物车</h1>
    <table class="table table-striped ">
        <tr>
            <td>
                <input type="checkbox" id="b1"/>
                <button type="button" class="btn btn-primary btn-sm" id="b2">反选</button>
            </td>
            <th>商品</th>
            <th>商品名称</th>
            <th>商品数量</th>
            <th>商品价格</th>
            <td>
                <button type="button" class="btn btn-danger btn-sm" id="b3">批量删除</button>
            </td>
        </tr>
        <c:forEach items="${pageInfo.getList()}" var="shopping">
            <tr>
                <c:if test="${shopping.status == 1}"><%--为1时选中,为0时取消选中--%>
                    <td><input type="checkbox" value="${shopping.id}" class="updIds" updId="${shopping.id}"
                               updName="${shopping.customerSerial}" updStatus="${shopping.status}" checked="checked"/></td>
                </c:if>
                <c:if test="${shopping.status == 0}">
                    <td><input type="checkbox" value="${shopping.id}" class="updIds" updId="${shopping.id}"
                               updName="${shopping.customerSerial}" updStatus="${shopping.status}"/></td>
                </c:if>
                <td><img src="chy_img/${shopping.photo}" width="50px" height="30px"/></td>
                <td class="change5">${shopping.name}</td>
                <td><input type="number" min="1" max="99" value="${shopping.count}" class="change1"/></td>
                <td class="change2">${shopping.price}</td>
                <td class="change3" style="display: none">${shopping.price}</td>
                <td class="change4" style="display: none">${shopping.photo}</td>
                <td class="botton1">
                    <botton class="btn btn-danger btn-sm">删除</botton>
                </td>
            </tr>
        </c:forEach>
    </table>
    <!-- 显示分页信息 -->
    <div class="row">
        <div class="col-md-6">${pageInfo.pageNum} / ${pageInfo.pages}</div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li id="toFirst"><a href="chy_shopping_findOneSelf?customerSerial=${shopping.customerSerial}&pn=1">首页</a>
                    </li>
                    <!-- 判断是否有上一页 -->
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li id="toBefore">
                            <a href="chy_shopping_findOneSelf?customerSerial=${shopping.customerSerial}&pn=${pageInfo.pageNum-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <!-- 获取当前需要连续显示的页码 -->
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
                        <c:if test="${page_num == pageInfo.pageNum}">
                            <li class="active"><a>${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num != pageInfo.pageNum}">
                            <li class="toPage"><a
                                    href="chy_shopping_findOneSelf?customerSerial=${shopping.customerSerial}&pn=${page_num}">${page_num}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <!-- 判断是否有下一页 -->
                    <c:if test="${pageInfo.hasNextPage }">
                        <li id="toNext">
                            <a href="chy_shopping_findOneSelf?customerSerial=${shopping.customerSerial}&pn=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li id="toLast"><a
                            href="chy_shopping_findOneSelf?customerSerial=${shopping.customerSerial}&pn=${pageInfo.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <button type="button" class="btn btn-success" style="float: right" id="toJs">去结算</button>
</div>
<script src="chy_js/jquery.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="chy_js/shopping.js"></script>
</body>
</html>