$(function () {
    interrogation(1);
});
var pageNum;
var pages;
var total;
var size;
var navigatepageNums;

function interrogation(pn) {
    //清楚全选样式
    $("#allChoice").prop("checked", false);
    $.ajax({
        url: '/ints',
        data: 'pn=' + pn,
        type: 'get',
        success: function (result) {
            pageNum = result.map.page.pageNum;
            pages = result.map.page.pages;
            total = result.map.page.total;
            size = result.map.page.size;
            navigatepageNums = result.map.page.navigatepageNums;
            //填充表格内容
            tabody(result.map.page.list);
            //填充分页信息
            infoPage();
            //填充分页条
            pagePilot(result.map.page);
        }
    });
}

//表格信息
function tabody(list) {
    //先清空表格
    $("tbody").empty();
    $.each(list, function (index, ints) {
        var checks = $("<td></td>").append($("<input type='checkbox' name='ch'/>").addClass("check"));
        var itrgtId = $("<td></td>").append(ints.itrgtId);
        var itrgtTeacherId = $("<td></td>").append(ints.itrgtTeacherId);
        var itrgtUserId = $("<td></td>").append(ints.itrgtUserId);
        var itrgtStartTime = $("<td></td>").append(ints.itrgtStartTime);
        var itrgtEndTime = $("<td></td>").append(ints.itrgtEndTime);
        var itrgtTotalPrice = $("<td></td>").append(ints.itrgtTotalPrice);
        //编辑,删除按钮
        var upd = $("<button class='btn-info upd'><span class='glyphicon glyphicon-pencil'></span>编辑</button>").attr("upd_id", ints.itrgtId);
        var del = $("<button class='btn-danger del'><span class='glyphicon glyphicon-trash'></span>删除</button>").attr("del_id", ints.itrgtId);
        var cz = $("<td></td>").append(upd).append(" ").append(del);

        var tr = $("<tr></tr>").append(checks).append(itrgtId).append(itrgtTeacherId).append(itrgtUserId).append(itrgtStartTime)
            .append(itrgtEndTime).append(itrgtTotalPrice).append(cz).appendTo($("#showAll tbody"));
    })
}

//分页信息
function infoPage() {
    $("#infoPage").empty();//清空之前信息
    $("#infoPage").append("当前页:").append(pageNum).append("总页数")
        .append(pages).append("总记录:").append(total).append("条");
}

//分页条信息
function pagePilot(page) {
    $("#pagePilot ul").empty();//清空之前信息
    var first = $("<li></li>").append($("<a></a>").append("首页"));
    first.click(function () {//跳首页 及时绑定方法,不用on
        interrogation(1);
    });
    var before = $("<li></li>").append($("<a></a>").append("&laquo;"));
    before.click(function () {//跳上一页
        interrogation(pageNum - 1);
    });
    if (!page.hasPreviousPage) {//如果没有上一页了,就失效
        first.addClass("disabled");
        before.addClass("disabled");
    }
    $("#pagePilot ul").append(first).append(before);

    $.each(navigatepageNums, function (index, num) {
        var li = $("<li></li>").append($("<a></a>").append(num));
        if (num == pageNum) {//若为当前页,则高亮
            li.addClass("active");
        }
        li.click(function () {//点击指定页跳转
            interrogation(num);
        });
        $("#pagePilot ul").append(li);
    });

    var next = $("<li></li>").append($("<a></a>").append("&raquo;"));
    var last = $("<li></li>").append($("<a></a>").append("尾页"));
    if (!page.hasNextPage) {//如果没有下一页了,就失效
        next.addClass("disabled");
        last.addClass("disabled");
    }
    next.click(function () {//跳下一页
        interrogation(pageNum + 1);
    });
    last.click(function () {//跳尾页
        interrogation(pages);
    });
    $("#pagePilot ul").append(next).append(last);
}

//删除单条
$(document).on("click", ".del", function () {
    $.ajax({
        url: '/interrogation/' + $(this).attr("del_id"),
        type: 'delete',
        success: function (result) {
            if (result.code == 100) {
                interrogation(pageNum);
            } else {
                alert("出现异常,删除失败!")
            }
        }
    });
});

//全选按钮
$("#allChoice").click(function () {
    var status = ($(this).prop("checked"));
    $(".check").prop("checked", status);
});
//单选按钮
$(document).on("click", ".check", function () {
    if ($(".check:checked").length == size) {//如果选中当前页所有记录,则自动勾选全选
        $("#allChoice").prop("checked", true);
    } else {//否则取消全选
        $("#allChoice").prop("checked", false);
    }
});

//点击添加
$("#insert").click(function () {
    //弹出框之前先清除之前的选择
    $("#teacherId").empty();
    $("#userId").empty();
    $("#insertStartTime").val("");
    $("#insertEndTime").val("");
    $("#insertTotalPrice").val("");
    //动态填充select
    customer_doctor($("#teacherId"), $("#userId"));
    $('#insertModal').modal({
        backdrop: true
    })
});

//点击添加提交按钮
$("#insertForm").click(function () {
    //获取表单中用户填写的数据
    var insert = $("#insertModal form").serialize();
    insert = decodeURIComponent(insert);
    $.ajax({
        url: '/insertOne',
        type: 'post',
        data: insert,
        success: function (result) {
            if (result.code == 100) {
                interrogation(total);
                $("#insertModal").modal("hide");
            } else {
                alert("出现异常,添加失败!")
            }
        }
    });
});

//批量删除
$("#dels").click(function () {
    //首先获取用户点击的多选框的id
    var td = $(".check:checked").parent().next();
    var dels = '';
    $.each(td, function () {
        dels += "_" + $(this).text();
    });
    dels = dels.substring(1, dels.length);
    $.ajax({
        url: '/dels',
        type: 'delete',
        data: 'dels=' + dels,
        success: function (result) {
            if (result.code == 100) {
                interrogation(pageNum);
                alert("删除成功!")
                $("#insertModal").modal("hide");
            } else {
                alert("出现异常,删除失败!")
            }
        }
    });
});

//点击编辑按钮
$(document).on("click", ".upd", function () {
    //清除之前的
    $("#upd_teacherId").empty();
    $("#upd_userId").empty();
    $("#upd_itrgtId").text("");//主键
    $("#upd_Price").val("");
    var upd_id = $(this).attr("upd_id");
    upd_msg(upd_id);
    //表单信息回显
    customer_doctor($("#upd_teacherId"), $("#upd_userId"));
    //弹出编辑模态框
    $('#updateModal').modal({
        backdrop: true
    })
});

//查询指定id信息
function upd_msg(upd_id) {
    $.ajax({
        url: '/findOne/' + upd_id,
        type: 'get',
        success: function (result) {
            var int = result.map.interrogation;
            $("#upd_itrgtId").text(int.itrgtId);//主键
            $("#upd_teacherId").val([int.itrgtTeacherId]);
            $("#upd_userId").val([int.itrgtUserId]);
            $("#upd_startTime").val(int.itrgtStartTime);
            $("#upd_endTime").val(int.itrgtEndTime);
            $("#upd_Price").val(int.itrgtTotalPrice);
        }
    });
}

//点击确认编辑
$("#updateForm").click(function () {
    var udp = $("#updateModal form").serialize();
    udp = decodeURIComponent(udp);
    udp += '&itrgtId=' + $("#upd_itrgtId").text();
    $.ajax({
        url: '/updOne',
        type: 'put',
        data: udp,
        success: function (result) {
            if (result.code == 100) {
                interrogation(pageNum);
                alert("修改成功!");
                $("#updateModal").modal("hide");
            } else {
                alert("出现异常,修改失败!");
            }
        }
    });
});

function customer_doctor(teacherId, userId) {
    //查询所有医师id,用户id
    $.ajax({
            url: '/findInsertIds',
            type: 'get',
            data: '',
            success: function (result) {
                var customerIds = result.map.cus_doc.customerIds;
                var doctorIds = result.map.cus_doc.doctorIds;
                //循环存值
                $.each(doctorIds, function (index, doctor) {
                    var option = $("<option>" + doctor.id + "</option>").val(doctor.id);
                    teacherId.append(option);
                })
                $.each(customerIds, function (index, customer) {
                    var option = $("<option>" + customer.id + "</option>").val(customer.id);
                    userId.append(option);
                })
            }
        }
    )
    ;
}

//批量修改框
$("#upds").click(function () {
    //先清空
    $("#updsTable tbody").empty();
    //获取用户选择的框的id,查询
    var td = $(".check:checked").parent().next();
    var upds = '';
    $.each(td, function () {
        upds += "_" + $(this).text();
    });
    upds = upds.substring(1, dels.length);
    upds_hx(upds);

    //弹出框
    $("#updsModal").modal({
        backdrop: true
    });
});

//查出信息回显到表格当中
function upds_hx(upds) {
    $.ajax({
        url: '/findMany/' + upds,
        type: 'get',
        success: function (result) {
            var ints = result.map.interrogations;
            $.each(ints, function (index, int) {
                console.log(int);
                var itrgtId = $("<td></td>").append(int.itrgtId);
                var sel1 = $("<select name='itrgtTeacherId'></select>").val(int.itrgtTeacherId);
                var sel2 = $("<select name='itrgtUserId'></select>").val(int.itrgtUserId);
                customer_doctor(sel1, sel2);
                var itrgtTeacherId = $("<td></td>").append(sel1);
                var itrgtUserId = $("<td></td>").append(sel2);
                var itrgtStartTime = $("<td></td>").append($("<input type='datetime-local' name='itrgtStartTime'/>").val(int.itrgtStartTime));
                var itrgtEndTime = $("<td></td>").append($("<input type='datetime-local' name='itrgtEndTime'/>").val(int.itrgtEndTime));
                var itrgtTotalPrice = $("<td></td>").append($("<input type='text' name='itrgtTotalPrice' style='width: 50px'/>").val(int.itrgtTotalPrice));
                var tr = $("<tr></tr>").append(itrgtId).append(itrgtTeacherId).append(itrgtUserId).append(itrgtStartTime).append(itrgtEndTime).append(itrgtTotalPrice);
                $("#updsTable tbody").append(tr);
            })
        }
    });
}

//点击确定批量修改
$("#qrxg").click(function () {
    //获取表格中的值
    var tr = $("#updsTable tbody tr");
    var ints = '';
    $.each(tr, function () {
        var int = '';
        //获取td中的itrgtId值
        var itrgtId = $(this).children().eq(0).text();
        //获取td中的itrgtTeacherId值
        var itrgtTeacherId = $(this).children().eq(1).children().eq(0).val();
        //获取td中的itrgtUserId值
        var itrgtUserId = $(this).children().eq(2).children().eq(0).val();
        //获取td中的itrgtStartTime值
        var itrgtStartTime = $(this).children().eq(3).children().eq(0).val();
        //获取td中的itrgtEndTime值
        var itrgtEndTime = $(this).children().eq(4).children().eq(0).val();
        //获取td中的itrgtTotalPrice值
        var itrgtTotalPrice = $(this).children().eq(5).children().eq(0).val();
        int += itrgtId +"_"+ itrgtTeacherId +"_"+ itrgtUserId +"_"+ itrgtStartTime +"_"+ itrgtEndTime +"_"+ itrgtTotalPrice;
        ints += ";" + int;
    })
    ints = ints.substring(1);
    $.ajax({
        url: '/updsInt',
        type: 'put',
        data: 'ints='+ints,
        success: function (result) {
            if(result.code == 100){
                $("#updsModal").modal("hide");
                interrogation(pageNum);
            }else{
               alert("错误");
            }
        }
    })
});



