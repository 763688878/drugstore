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
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <script src="bootstrap-3.3.7-dist/js/jquery.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <title>个人订单</title>
</head>
<body>
<div class="container">
<table class="table table-striped table-hover">
    <h1 style="padding-top: 100px">个人订单</h1><a href="backToIndex" class="btn btn-info" style="margin-left: 970px; margin-bottom: 20px">返回首页</a>
    <tr class="success">
        <td>
            <button type="button" class="btn btn-primary btn-sm" id="quanXuan">全选</button>
            <button type="button" class="btn btn-primary btn-sm" id="quXiao">全部取消</button>
        </td>
        <td>订单编号</td>
        <td>姓名</td>
        <td>电话</td>
        <td>地址</td>
        <td>价格</td>
        <td>订单状态</td>
        <td>下单时间</td>
        <td>
                <button type="button" class="btn btn-danger glyphicon glyphicon-remove" id="delAll">
                批量删除</button>
        </td>
    </tr>
    <c:forEach items="${list }" var="list">
        <tr class="info">
            <td><input type="checkbox" value="${list.id}"></td>
            <td>${list.orderserial }</td>
            <td>${list.name }</td>
            <td>${list.telphone }</td>
            <td>${list.address }</td>
            <td>${list.price }</td>
            <c:choose>
                <c:when test="${list.state ==0 }">
                     <td>未支付</td>
                </c:when>
                <c:when test="${list.state ==1 }">
                     <td>已支付</td>
                </c:when>
                <c:when test="${list.state ==2 }">
                     <td>已完成</td>
                </c:when>
            </c:choose>
            <td>${list.time }</td>
            <td><a href="deleteOrder?customerId=${list.customerId}&id=${list.id}&PageNum=${pageInfo.pageNum}" class="btn btn-danger
glyphicon glyphicon-remove">删除</a></td>
        </tr>
    </c:forEach>

</table>

    <div class="row">
        <div class="col-md-6">${pageInfo.pageNum} / ${pageInfo.pages}</div>
        <input type="hidden" value="${pageInfo.pageNum}" id="pa">
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${list.size() > 0 }">
                    <li><a href="zz_findOrderByid?customerId=${list.get(0).customerId}&PageNum=1">首页</a></li>

                    <!-- 判断是否有上一页 -->
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="zz_findOrderByid?customerId=${list.get(0).customerId}&PageNum=${pageInfo.pageNum-1}" aria-label="Previous">
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
                            <li><a href="zz_findOrderByid?customerId=${list.get(0).customerId}&PageNum=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
                    <!-- 判断是否有下一页 -->
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="zz_findOrderByid?customerId=${list.get(0).customerId}&PageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="zz_findOrderByid?customerId=${list.get(0).customerId}&PageNum=${pageInfo.pages}">末页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>

    </div>
<script>

    $(function () {
        $("#quanXuan").click(function () {
            var nums = $("input[type='checkbox']");
            for (var i = 0; i < nums.length; i++) {
                nums[i].checked = true;
            }
        })


        $("#quXiao").click(function () {
            var nums = $("input[type='checkbox']");
            for (var i = 0; i < nums.length; i++) {
                nums[i].checked = false
            }
        })


        $("#delAll").click(function () {

            var nums = $("input[type='checkbox']");
            var id = "";
            for (var i = 0; i < nums.length; i++) {
                if (nums[i].checked == true) {
                    id += nums[i].value + ",";
                }
            }
            $.ajax({
                url: "delSomeOrders",
                data: {"id": id},
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result > 0) {
                        location.reload();
                    } else {
                        alert("删除失败！！！")
                    }
                },
                error: function () {
                    alert("错误");
                }
            });
        })
    })
</script>
</body>
</html>