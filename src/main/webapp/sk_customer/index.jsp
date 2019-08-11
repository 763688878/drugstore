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
    <title>顾客首页</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="sk_css/index.css"/>
 </head>
<div>
<div class="container" style="padding-top: 100px">
<a href="sk_customer/add.jsp" class="btn btn-info glyphicon glyphicon-plus">增加</a>

<%--条件查询--%>
请选择地址：<select name="site" id="s1" >
    <option value= ""  selected="selected">请选择</option>
    <option value="武汉">武汉</option>
    <option value="上海">上海</option>
</select>
请选择病症：<select name="medicalrecord" id="s2" >
    <option value= ""  selected="selected">请选择</option>
    <option value="有不学习就会死的病">有不学习就会死的病</option>
    <option value="无病史">无病史</option>
    <option value="感冒">感冒</option>
</select>

<%--下拉框的值赋给input框--%>
<form action="cs_cx" method="post" >
    <input id="i1" type="hidden" name="site" value="">
    <input id="i2" type="hidden" name="medicalrecord" value="" >
    <input type="submit" value="查询" id="ss" class="btn btn-success glyphicon glyphicon-search">
</form>

<form action="cs_cx" method="post">
    <input type="text" name="serial">
    <input type="submit" value="查询编号" class="btn btn-success glyphicon glyphicon-search" >
</form>

<%--查询所有信息--%>
<button type="button" class="btn btn-danger btn-sm" id="pl">批量删除</button>
<table  class="table table-bordered">
       <tr>
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
           <tr>
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
                <li><a href="cs_index?pn=1">首页</a></li>
                <!-- 判断是否有上一页 -->
                <c:if test="${pageInfo.hasPreviousPage }">
                    <li>
                        <a href="cs_index?pn=${pageInfo.pageNum-1}"aria-label="Previous">
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
                        <li><a href="cs_index?pn=${page_num}">${page_num}</a></li>
                    </c:if>
                </c:forEach>
                <!-- 判断是否有下一页 -->
                <c:if test="${pageInfo.hasNextPage }">
                    <li>
                        <a href="cs_index?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="cs_index?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>
</div>
</div>


<script src="chy_js/jquery.js"></script>


<script>
    // 条件查询
    // 下拉框的值赋给input框
    $("#ss").click(function(){
        var site =  $("#s1").val();
        var medicalrecord =  $("#s2").val();
        $("#i1").val(site);
        $("#i2").val(medicalrecord);
    })
</script>
<script src="sk_js/jquery.js"></script>
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