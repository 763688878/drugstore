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
    <title>轮播图</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
</head>
<body style="padding-top: 100px">
<div class="container">
    <h1>首页轮播</h1>
    <table class="table table-striped ">
        <tr>
            <td>
                <button type="button" class="btn btn-primary btn-sm" id="b1">全选</button>
                <button type="button" class="btn btn-primary btn-sm" id="b2">反选</button>
                <button type="button" class="btn btn-success btn-sm" id="b4">添加</button>
            </td>
            <th>显示图片</th>
            <td>
                <button type="button" class="btn btn-danger btn-sm" id="b3">批量删除</button>
            </td>
        </tr>
        <c:forEach items="${pageInfo.getList()}" var="carousel">
            <tr>
                <td><input type="checkbox" value="${carousel.id}"/></td>
                <td><img src="chy_img/${carousel.name}" width="50px" height="30px"/></td>
                <td class="botton1"><botton class="btn btn-danger btn-sm">删除</botton></td>
            </tr>
        </c:forEach>
    </table>
    <!-- 显示分页信息 -->
    <div class="row">
        <div class="col-md-6">${pageInfo.pageNum} / ${pageInfo.pages}</div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${!pageInfo.hasPreviousPage }">
                        <li class="disabled"><a href="chy_carousel_show?pn=1">首页</a></li>
                    </c:if>
                    <!-- 判断是否有上一页 -->
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a href="chy_carousel_show?pn=1">首页</a></li>
                        <li>
                            <a href="chy_carousel_show?pn=${pageInfo.pageNum-1}" aria-label="Previous">
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
                            <li><a href="chy_carousel_show?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
                    <!-- 判断是否有下一页 -->
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="chy_carousel_show?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li><a href="chy_carousel_show?pn=${pageInfo.pages}">末页</a></li>
                    </c:if>
                    <c:if test="${!pageInfo.hasNextPage }">
                        <li class="disabled"><a href="chy_carousel_show?pn=${pageInfo.pages}">末页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
    <%--模态框--%>
    <div class="modal fade bs-example-modal-sm" id="insert" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content" style="width: 300px; height: 150px; padding: 30px 50px">
                <form action="chy_carousel_add" method="post" enctype="multipart/form-data">
                    <input type="file" name="file" style="width: 200px"/><br/>
                    <input type="submit" value="添加" class="btn btn-success"/>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="chy_js/jquery.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="chy_js/carousel.js"></script>
</body>
</html>