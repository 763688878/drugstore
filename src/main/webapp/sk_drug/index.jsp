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
    <title>药品首页</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="sk_css/index.css"/>
 </head>
<body>
<div class="container" style="padding-top: 100px">
<a href="sk_drug/add.jsp" class="btn btn-info glyphicon glyphicon-plus">增加</a>

<form action="yp_cx" method="post">
    <input type="text" name="name">
    <input type="submit" value="查询药名" class="btn btn-success glyphicon glyphicon-search" >
</form>
<button type="button" class="btn btn-danger btn-sm" id="pl">批量删除</button>
<table  class="table table-bordered">
       <tr>
           <td> <button type="button" class="btn btn-primary btn-sm" id="quanxuan">全选</button></td>
           <button type="button" class="btn btn-primary btn-sm" id="fx">反选</button>
           <td class="info">药品名称</td>
           <td class="info">单价</td>
           <td class="info">库存</td>
           <td >操作</td>
       </tr>
       <c:forEach items="${pageInfo.getList()}" var="y">
           <tr>
               <td> <input type="checkbox"  value="${y.id }" ></td>
               <td class="info">${y.name}</td>
               <td class="info">${y.price}</td>
               <td class="info">${y.inventory}</td>
               <td ><a href="yp_delete?id=${y.id}" type="button" class="btn btn-danger">删除</a> <a href="yp_findOne?id=${y.id}" type="button" class="btn btn-warning" >修改</a></td>
           </tr>
       </c:forEach>
   </table>
<!-- 显示分页信息 -->
<div class="row">
    <div class="col-md-6">${pageInfo.pageNum} / ${pageInfo.pages}</div>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="yp_index?pn=1">首页</a></li>
                <!-- 判断是否有上一页 -->
                <c:if test="${pageInfo.hasPreviousPage }">
                    <li>
                        <a href="yp_index?pn=${pageInfo.pageNum-1}"aria-label="Previous">
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
                        <li><a href="yp_index?pn=${page_num}">${page_num}</a></li>
                    </c:if>
                </c:forEach>
                <!-- 判断是否有下一页 -->
                <c:if test="${pageInfo.hasNextPage }">
                    <li>
                        <a href="yp_index?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="yp_index?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>
</div>
</div>

<script src="chy_js/jquery.js"></script>
<script>
    $(function(){
        // 全选
        $("#quanxuan").click(function(){
            var nums = $("input[type='checkbox']");
            for(var i = 0;i < nums.length; i++){
                nums[i].checked=true;
            }
        })

        // 反选
        $("#fx").click(function(){
            var nums = $("input[type='checkbox']");
            for(var i = 0;i < nums.length; i++){
                if(nums[i].checked==true){
                    nums[i].checked=false;
                }else{
                    nums[i].checked=true;
                }
            }
        })

        // 批量删
        $("#pl").click(function(){
            var nums = $("input[type='checkbox']");
            var id = "";
            for(var i = 0;i < nums.length; i++){
                if(nums[i].checked==true){
                    id+=nums[i].value+",";
                }
            }
            $.ajax({
                url:"yp_batchDelete",
                data:{"id":id},
                type:"POST",
                dataType:"json",
                success:function(result){
                    if(result>0){
                        location.reload();
                    }else{
                        alert("删除失败");
                    }
                },
                error:function(){
                    alert("错误");
                }
            });
        })
    })
</script>

</body>
</html>