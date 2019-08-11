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
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <script src="js/bootstrap.js"></script>
    <title>个人订单</title>
</head>
<body>
<div class="container">
<table class="table table-striped table-hover">
    <tr class="success">
        <td>订单编号</td>
        <td>姓名</td>
        <td>电话</td>
        <td>地址</td>
        <td>价格</td>
        <td>药店</td>
        <td>订单状态</td>
        <td>下单时间</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${list }" var="list">
        <tr class="info">
            <td>${list.orderserial }</td>
            <td>${list.name }</td>
            <td>${list.telphone }</td>
            <td>${list.address }</td>
            <td>${list.price }</td>
            <td>${list.store }</td>
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
            <td><a href="deleteOrder?PageNum=${pageInfo.pageNum}" class="btn btn-danger
glyphicon glyphicon-remove">删除</a></td>
        </tr>
    </c:forEach>

</table>

<%--<c:choose>

    <c:when test="${pageInfo.size > 0 }">

        <div class="feny">

            <div class="manu">

                <span>显示${pageInfo.startRow }到${pageInfo.endRow}共${pageInfo.total}条</span>

                <a href="zz_findOrder?PageNum=1">首页 </a>

                <c:choose>

                    <c:when test="${pageInfo.hasPreviousPage }">

                        <a href="zz_findOrder?PageNum=${pageInfo.pageNum-1}" >上一页
                        </a>

                    </c:when>


                    <c:otherwise>

                        <span>上一页</span>

                    </c:otherwise>

                </c:choose>

                <c:forEach var="item" items="${pageInfo.navigatepageNums}">

                    <c:choose>

                        <c:when test="${pageInfo.pageNum == item }">

                            <span class="current">${pageInfo.pageNum }</span>

                        </c:when>

                        <c:otherwise>

                            <a href="zz_findOrder?PageNum=${item}">${item}</a>

                        </c:otherwise>

                    </c:choose>

                </c:forEach>

                <c:choose>

                    <c:when test="${!pageInfo.isLastPage }">

                        <a href="zz_findOrder?PageNum=${pageInfo.pageNum+1}">下一页</a>

                        <a href="zz_findOrder?PageNum=${pageInfo.lastPage}">尾页</a>

                    </c:when>

                    <c:otherwise>

                        <span>下一页</span>

                        <span>尾页</span>

                    </c:otherwise>

                </c:choose>

            </div>

        </div>

    </c:when>
</c:choose>--%>

    <!-- 显示分页信息 -->
    <div class="row">
        <div class="col-md-6">${pageInfo.pageNum} / ${pageInfo.pages}</div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="zz_findOrderBy?PageNum=1">首页</a></li>
                    <!-- 判断是否有上一页 -->
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="zz_findOrderBy?PageNum=${pageInfo.pageNum-1}" aria-label="Previous">
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
                            <li><a href="zz_findOrderBy?PageNum=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
                    <!-- 判断是否有下一页 -->
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="zz_findOrderBy?PageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="zz_findOrderBy?PageNum=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>