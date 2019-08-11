$(function(){
    $("botton").click(function(){
        var name = $("#A1").text();
        var price = $("#A2").text();
        var count = $("#A3").val();
        var photo = $("#A4").text();
        var serial = $("#A5").text();
        $.ajax({
            url:"chy_shopping_add",
            data:{"name":name,"count":count,"price":price,"photo":photo,"customerSerial":serial},
            type:"POST",
            dataType:"json",
            success:function(result){
                if(result==1){
                    // 模态框
                    $("#insert").modal();
                    setTimeout(function () {
                        $("#insert").modal('hide');
                    },1000)
                }else if(result==2){
                    alert("请登录");
                }else{
                    alert("失败");
                }
            },
            error:function(){
                alert("错误");
            }
        })

    })
})