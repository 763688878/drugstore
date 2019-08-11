$(function(){
    var checkbox = $("input[type='checkbox']");
    var botton1 = $(".botton1>botton");
    var change1 = $(".change1");
    var change2 = $(".change2");
    var change3 = $(".change3");
    var change4 = $(".change4");
    var change5 = $(".change5");
    var index = 0;
    var index2 = 0;
    var money = 0;
    //计算金额
    for(var i = 0;i<change1.length;i++){
        change2.eq(i).text(accMul(change1.eq(i).val(),change3.eq(i).text()));
    }
    //改变数量及金额
    change1.click(function(){
        index = change1.index(this);
        var count = change1.eq(index).val();
        var price = change3.eq(index).text();
        var photo = change4.eq(index).text();
        var name = change5.eq(index).text();
        var id = checkbox.eq(index).val();
        $.ajax({
            url:"chy_shopping_count",
            data:{"id":id,"price":price,"count":count,"photo":photo,"name":name},
            type:"POST",
            dataType:"json",
            success:function (result) {
                if(result>0){
                    //调用封装的乘法函数
                    change2.eq(index).text(accMul(count,price));
                }else{
                    alert("失败");
                }
            },
            error:function(){
                alert("错误");
            }
        });
    })

    // 全选
    $("#b1").click(function(){
        var check = $(this).prop("checked");
        $(".updIds").prop("checked", check);
    })
    // 反选
    $("#b2").click(function(){
        var nums = $(".updIds");
        for(var i = 0;i < nums.length; i++){
            if(nums[i].checked==true){
                var updId = $(nums[i]).attr("updId");
                updId = updId + "_";
                updStatus(updId, "0");
                nums[i].checked=false;
            }else{
                var updId = $(nums[i]).attr("updId");
                updId = updId + "_";
                updStatus(updId, "1");
                nums[i].checked=true;
            }
        }
    })
    // 批量删
    $("#b3").click(function(){
        var nums = $("input[type='checkbox']");
        var id = "";
        for(var i = 0;i < nums.length; i++){
            if(nums[i].checked==true){
                id+=nums[i].value+",";
            }
        }
        $.ajax({
            url:"chy_shopping_batchDelete",
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

    // 删除
    botton1.click(function(){
        index2 = botton1.index(this);
        var id2 = checkbox.eq(index2).val();
        console.log(id2);
        $.ajax({
            url:"chy_shopping_delete",
            data:{"id":id2},
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

    //加法函数，用来得到精确的加法结果
    //说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。
    //调用：accAdd(arg1,arg2)
    //返回值：arg1加上arg2的精确结果
    function accAdd(arg1,arg2){
        var r1,r2,m;
        try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
        try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
        m=Math.pow(10,Math.max(r1,r2))
        return (arg1*m+arg2*m)/m
    }
    //给Number类型增加一个add方法，调用起来更加方便。
    Number.prototype.add = function (arg){
        return accAdd(arg,this);
    }

    //乘法函数，用来得到精确的乘法结果
    //说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。
    //调用：accMul(arg1,arg2)
    //返回值：arg1乘以arg2的精确结果
    function accMul(arg1,arg2)
    {
        var m=0,s1=arg1.toString(),s2=arg2.toString();
        try{m+=s1.split(".")[1].length}catch(e){}
        try{m+=s2.split(".")[1].length}catch(e){}
        return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)
    }
    //给Number类型增加一个mul方法，调用起来更加方便。
    Number.prototype.mul = function (arg){
        return accMul(arg, this);
    }
});

//确认商品或取消商品
function updStatus(updId, status) {
    $.ajax({
        url: '/updStatus',
        type: 'post',
        data: {'updId':updId, 'status':status},
        success:function (result) {
            if(result.code == 100){
                console.log("成功");
            }else{
                console.log("失败");
            }
        }
    })
}
//用户点击勾选按钮
$(".updIds").click(function () {
    if($(".updIds:checked").length == $(".updIds").length){
        $("#b1").prop("checked", true);
    }else{
        $("#b1").prop("checked", false);
    }
    //将用户选中的框对应的id获取到
    var updId = $(this).attr("updId");
    updId = updId + "_";
    //用户点击选中,或取消选中
    var check = $(this).prop("checked");
    if(check == true){//选中时将数据库的状态值改为1
        updStatus(updId, 1);
    }else{
        updStatus(updId, 0);
    }
});

//用户点击全选按钮
$("#b1").click(function () {
    //将本界面所有的用户的id拼接起来传过去
    var checks = $(this).prop("checked");
    var status = '';
    if(checks == true){
        status = '1';
    }else{
        status = '0';
    }
    var check = $(".updIds");
    var ids = '';
    $.each(check, function () {
        var id = $(this).attr("updId");
        ids+= "_"+id;
    })
    ids = ids.substring(1);
    updStatus(ids, status);
})

//结算
$("#toJs").click(function () {
    $("#ordermd").empty();//清空再加
    //弹出之前先将信息填充到模态框内
    totalMoney();
    //弹出结算模态框
    $("#jsModal").modal({
        backdrop: true
    })
})
//计算总金额
function totalMoney() {
    var name = $(".updIds:checked").eq(0).attr("updName");
    $.ajax({
        url: '/totalMoney/'+name,
        type: 'get',
        success:function (result) {
            if(result.code == 100){
                money = result.map.money;
                var p1 = $("<p></p>").append("用户编号:").append(name);
                var p2 = $("<p></p>").append("总价格:").append(money);
                $("#ordermd").append(p1).append(p2);
            }else{
                alert("出现异常!")
            }
        }
    })
}

//确认结算
$("#qrjs").click(function () {
    var name = $(".updIds:checked").eq(0).attr("updName");
   $.ajax({
       url: '/addOrder',
       type: 'post',
       data: 'cus_id='+name,
       success:function (result) {
           if(result.code == 100){
               // alert("购买成功");
               window.location.href="money.jsp?money="+money;
           }else{
               alert("网络波动,请稍后再试!")
           }
       }
   })
})