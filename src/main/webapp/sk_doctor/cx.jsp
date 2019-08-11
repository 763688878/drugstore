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
    <title>添加页面</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
</head>
<div>
<div class="container" style="padding-top: 100px">
<button type="button" class="btn btn-danger btn-sm" id="pl">批量删除</button>
<a href="dc_index"><button type="button" class="btn btn-danger btn-sm" >返回首页</button></a>
<table  class="table table-bordered table-hover">
    <tr class="warning">
        <td> <button type="button" class="btn btn-primary btn-sm" id="qx">全选</button></td>
        <button type="button" class="btn btn-primary btn-sm" id="fx">反选</button>
        <td >电话</td>
        <td >医师姓名</td>
        <td >医生编号</td>
        <td >医师资格证</td>
        <td >职位</td>
        <td >科别</td>
        <td >所属医院</td>
        <td >从业年龄</td>
        <td >单笔问诊金额</td>
        <td >审核状态</td>
        <td >身份证号</td>
        <td >头像</td>
        <td >是否在线</td>
        <td >操作</td>
    </tr>
    <c:forEach items="${pageInfo.getList()}" var="d">
        <tr class="warning ">
            <td> <input type="checkbox"  value="${d.id }" ></td>
            <td >${d.tel}</td>
            <td >${d.name}</td>
            <td >${d.serial}</td>
            <td >${d.certificate}</td>
            <td >${d.post}</td>
            <td >${d.subject}</td>
            <td >${d.hospital}</td>
            <td >${d.employage}</td>
            <td >${d.medicalexpen}</td>
            <td >${d.status}</td>
            <td >${d.idcard}</td>
            <td ><img src="/sk_img/${d.photo}" style="width: 100px; height: 80px"> </td>
            <td >${d.online}</td>
            <td ><a href="dc_delete?id=${d.id}" type="button" class="btn btn-danger glyphicon glyphicon-remove">删除</a> <a href="dc_findOne?id=${d.id}" type="button" class="btn btn-warning glyphicon glyphicon-pencil" >修改</a></td>
        </tr>
    </c:forEach>
</table>

<!-- 显示分页信息 -->
<div class="row">
    <div class="col-md-6">${pageInfo.pageNum} / ${pageInfo.pages}</div>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="dc_cx?pn=1">首页</a></li>
                <!-- 判断是否有上一页 -->
                <c:if test="${pageInfo.hasPreviousPage }">
                    <li>
                        <a href="dc_cx?pn=${pageInfo.pageNum-1}"aria-label="Previous">
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
                        <li><a href="dc_cx?pn=${page_num}">${page_num}</a></li>
                    </c:if>
                </c:forEach>
                <!-- 判断是否有下一页 -->
                <c:if test="${pageInfo.hasNextPage }">
                    <li>
                        <a href="dc_cx?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="dc_cx?pn=${pageInfo.pages}">末页</a></li>
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
            url:"dc_batchDelete",
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