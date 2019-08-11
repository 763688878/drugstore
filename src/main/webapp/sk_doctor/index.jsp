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
    <title>医生首页</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
     <link rel="stylesheet" type="text/css" href="sk_css/doctor.css"/>
 </head>
<body>
<div class="container" style="padding-top: 100px">
<a href="sk_doctor/add.jsp?" class="btn btn-info glyphicon glyphicon-plus">增加</a>

    <%--条件查询--%>
    请选择医院：
    <select name="hospital" id="s1"  >
    <option value= ""  selected="selected"  >请选择</option>
    <option value="上海人民医院" >上海人民医院</option>
    <option value="武汉人民医院">武汉人民医院</option>
</select>
    请选择职位：<select name="post" id="s2" >
    <option value= ""  selected="selected">请选择</option>
    <option value="主任医师" >主任医师</option>
    <option value="主治医师">主治医师</option>
</select>
    请选择科别：<select name="subject" id="s3" >
    <option value= ""  selected="selected">请选择</option>
    <option value="口腔科">口腔科</option>
    <option value="皮肤科">皮肤科</option>
</select>

    <%--下拉框的值赋给input框--%>
<form action="dc_cx" method="post" >
    <input id="i1" type="hidden" name="post" value="">
    <input id="i2" type="hidden" name="subject" value="">
    <input id="i3" type="hidden" name="hospital" value="" >
    <input type="submit" value="查询" id="ss" class="btn btn-success glyphicon glyphicon-search">
</form>

    <form action="dc_cx" method="post">
     <input type="text" name="serial">
     <input type="submit" value="查询编号" class="btn btn-success glyphicon glyphicon-search" >
    </form>

    <%--查询所有信息--%>
    <button type="button" class="btn btn-danger btn-sm" id="pl">批量删除</button>
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
               <td ><img src="/chy_img/${d.photo}" style="width: 100px; height: 80px"> </td>
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
                    <li><a href="dc_index?pn=1">首页</a></li>
                    <!-- 判断是否有上一页 -->
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="dc_index?pn=${pageInfo.pageNum-1}"aria-label="Previous">
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
                            <li><a href="dc_index?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
                    <!-- 判断是否有下一页 -->
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="dc_index?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="dc_index?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>


<script src="chy_js/jquery.js"></script>


<script>
    // 条件查询
    // 下拉框的值赋给input框
    $("#ss").click(function(){
        var hospital =  $("#s1").val();
        console.log(hospital);
        var post =  $("#s2").val();
        var subject =  $("#s3").val();
        $("#i1").val(post);
        $("#i2").val(subject);
        $("#i3").val(hospital);
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