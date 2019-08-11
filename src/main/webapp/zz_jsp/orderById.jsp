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

    <title>个人订单</title>
</head>
<body style="padding-top: 100px">
<div class="container">
    <h1>订单管理</h1>
        <input type="text" placeholder="订单编号" name="orderserial;" value="" id="findOneInput" />
        <button id="findOne" class="button btn-info">查询</button>
    <table class="table table-striped table-hover">
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
        <td>用户是否删除</td>
        <td>
            <button type="button" class="btn btn-danger" id="delAll">
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
            <td>
                <c:if test="${list.customerdelete ==0 }">
                    已删除
                </c:if>
                <c:if test="${list.customerdelete ==1 }">
                    未删除
                </c:if>
            </td>
            <td><a href="delOneOrder?id=${list.id}&PageNum=${pageInfo.pageNum}" class="btn btn-danger btn-sm">删除</a></td>
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
        <input type="hidden" value="${pageInfo.pageNum}" id="pa">
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="zz_findOrder?PageNum=1">首页</a></li>
                    <!-- 判断是否有上一页 -->
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="zz_findOrder?PageNum=${pageInfo.pageNum-1}" aria-label="Previous">
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
                            <li><a href="zz_findOrder?PageNum=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
                    <!-- 判断是否有下一页 -->
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="zz_findOrder?PageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="zz_findOrder?PageNum=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="modal fade bs-example-modal-lg" id="showOneOrder" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <form action="/updateOrder" method="post" id="updateOrder" style="padding-top: 20px;margin-left:150px" class="form-horizontal" >
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="yq_js/jquery.js" ></script>
<script src="js/bootstrap.js"></script>
<%--全选--%>
<script>
    $(function () {
        $("#quanXuan").click(function () {
            var nums = $("input[type='checkbox']");
            for (var i = 0; i < nums.length; i++){
                nums[i].checked = true;
            }
        })


        $("#quXiao").click(function () {
            var nums = $("input[type='checkbox']");
            for (var i = 0; i < nums.length; i++){
                nums[i].checked = false
            }
        })


        $("#delAll").click(function () {

            var nums = $("input[type='checkbox']");
            var id = "";
            for(var i = 0; i < nums.length; i++){
                if(nums[i].checked == true){
                    id+=nums[i].value+",";
                }
            }
            $.ajax({
                url:"delSomeOrder",
                data:{"id":id},
                type:"POST",
                dataType:"json",
                success:function (result) {
                    if (result>0){
                        location.reload();
                    } else {
                        alert("删除失败！！！")
                    }
                },
                error:function () {
                    alert("错误");
                }
            });
        })

        $("#findOne").click(function () {
            var orderserial = $("#findOneInput").val();
            var PageNum = $("#pa").val();
            $.ajax({
                url:"findOneOrder",
                data:{"orderserial":orderserial},
                type:"POST",
                dataType:"json",
                success:function (result) {

                    console.log(result);
                    if (result != null || result != ""){
                        $("#updateOrder").empty();

                        var id  = result.id;
                        var orderserial  = result.orderserial;
                        var name  = result.name;
                        var telphone  = result.telphone;
                        var address  = result.address;
                        var price  = result.price;
                        var time  = result.time;
                        var state  = result.state;
                        var customerdelete  = result.customerdelete;

                        if (state == 0){
                            state = "未支付";
                        }else if (state == 1){
                            state = "已支付";
                        } else {
                            state = "已完成";
                        }

                        if (customerdelete == 0){
                            customerdelete = "已删除"
                        }else {
                            customerdelete = "未删除"
                        }
                        $("#updateOrder").append("<input type='hidden' name='id' value='"+id+"' readonly/>");
                        $("#updateOrder").append("<input type='hidden' name='PageNum' value='"+PageNum+"' readonly/>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputText2\" class=\"col-sm-2 control-label\">订单编号</label><input type='text' name='orderserial' value='"+orderserial+"' id=\"inputText2\" readonly/></div>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputText3\" class=\"col-sm-2 control-label\">姓名</label><input type='text' name='name' value='"+name+"' id=\"inputText3\"/></div>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputText4\" class=\"col-sm-2 control-label\">电话</label><input type='text' name='telphone' value='"+telphone+"' id=\"inputText4\"/></div>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputText5\" class=\"col-sm-2 control-label\">地址</label><input type='text' name='address' value='"+address+"' id=\"inputText5\"/></div>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputText6\" class=\"col-sm-2 control-label\">价格</label><input type='text' name='price' value='"+price+"' id=\"inputText6\" readonly/></div>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputText7\" class=\"col-sm-2 control-label\">下单时间</label><input type='text' name='time' value='"+time+"' id=\"inputText7\" readonly/></div>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputText8\" class=\"col-sm-2 control-label\">订单状态</label><input type='text' name='sta' value='"+state+"' id=\"inputText8\" readonly/></div>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputText9\" class=\"col-sm-2 control-label\">用户是否删除</label><input type='text' name='cus' value='"+customerdelete+"' id=\"inputText9\" readonly/></div>");
                        $("#updateOrder").append("<div class=\"form-group\" > <label for=\"inputSubmit\" class=\"col-sm-2 control-label\"></label><input type='submit' value='修改' id=\"inputSubmit\" class='btn btn-danger btn-group-sm'/></div>");
                        $("#showOneOrder").modal({
                            backdrop: true
                        });
                    }else {
                        alert("错误！！")
                    }
                },
                error:function () {
                    alert("无此订单！！！")
                }
            })
        })

    })



</script>
</body>
</html>