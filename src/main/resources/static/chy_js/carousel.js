$(function(){
    var checkbox = $("input[type='checkbox']");
    var botton1 = $(".botton1>botton");
    var index2 = 0;

    // 添加
    $("#b4").click(function(){
        $("#insert").modal();
    });

    // 全选
    $("#b1").click(function(){
        var nums = $("input[type='checkbox']");
        for(var i = 0;i < nums.length; i++){
            nums[i].checked=true;
        }
    });

    // 反选
    $("#b2").click(function(){
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
    $("#b3").click(function(){
        var nums = $("input[type='checkbox']");
        var id = "";
        for(var i = 0;i < nums.length; i++){
            if(nums[i].checked==true){
                id+=nums[i].value+",";
            }
        }
        $.ajax({
            url:"chy_carousel_batchDelete",
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
            url:"chy_carousel_delete",
            data:{"id":id2},
            type:"POST",
            dataType:"json",
            success:function(result){
                console.log(result);
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