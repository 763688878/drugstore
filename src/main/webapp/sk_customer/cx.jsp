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
    <title>查询页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
</head>
<div>
<div class="container" style="padding-top: 100px">
<button type="button" class="btn btn-danger btn-sm" id="pl">批量删除</button>
<a href="cs_index"><button type="button" class="btn btn-danger btn-sm" >返回首页</button></a>
<table  class="table table-bordered table-hover">
    <tr class="warning">
        <td> <button type="button" class="btn btn-primary btn-sm" id="qx">全选</button></td>
        <button type="button" class="btn btn-primary btn-sm" id="fx">反选</button>
        <td class="info">电话</td>
        <td class="info">密码</td>
        <td class="info">客户编号</td>
        <td class="info">姓名</td>
        <td class="info">年龄</td>
        <td class="info">性别</td>
        <td class="info">地址</td>
        <td class="info">病历</td>
        <td >操作</td>
    </tr>
    <c:forEach items="${pageInfo.getList()}" var="s">
        <tr class="warning ">
            <td> <input type="checkbox"  value="${s.id }" ></td>
            <td class="info">${s.tel}</td>
            <td class="info">${s.password}</td>
            <td class="info">${s.serial}</td>
            <td class="info">${s.name}</td>
            <td class="info">${s.age}</td>
            <td class="info">${s.sex}</td>
            <td class="info">${s.site}</td>
            <td class="info">${s.medicalrecord}</td>
            <td ><a href="cs_delete?id=${s.id}" type="button" class="btn btn-danger">删除</a> <a href="cs_findOne?id=${s.id}" type="button" class="btn btn-warning" >修改</a></td>
        </tr>
    </c:forEach>
</table>

<!-- 显示分页信息 -->
<div class="row">
    <div class="col-md-6">${pageInfo.pageNum} / ${pageInfo.pages}</div>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="cs_cx?pn=1">首页</a></li>
                <!-- 判断是否有上一页 -->
                <c:if test="${pageInfo.hasPreviousPage }">
                    <li>
                        <a href="cs_cx?pn=${pageInfo.pageNum-1}"aria-label="Previous">
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
                        <li><a href="cs_cx?pn=${page_num}">${page_num}</a></li>
                    </c:if>
                </c:forEach>
                <!-- 判断是否有下一页 -->
                <c:if test="${pageInfo.hasNextPage }">
                    <li>
                        <a href="cs_cx?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="cs_cx?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>
</div>
</div>

<script src="chy_js/jquery.js"></script>
<script>
    // 全选
    $("#qx").click(function(){
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
            url:"cs_batchDelete",
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


</script>
</body>
</html>