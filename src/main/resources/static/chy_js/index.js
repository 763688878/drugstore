$(function(){
    var L1 = $("#u1>li");
    var img1 = $("#left>img");
    var count1 = 0;
    var num1 = 0;
    var num2 = 0;
    var num3 = 0;
    L1.hover(function(){
        count1 = L1.index(this);
        img1.eq(count1).css("display","inline-block");
    },function(){
        img1.eq(count1).css("display","none");
    })

    //药品列表
    $.ajax({
        url:"chy_drug_list",
        type:"POST",
        dataType:"json",
        success:function(result){
            $.each(result,function(index,result1){
                $("#main2").append("<a href=\"chy_drug_buy?id="+result1.id+"\"><img src=\"chy_img/"+result1.photo+"\"/></a>");
            })
        },
        error:function(){
            alert("错误")
        }
    })

    //个人资料
    $("#span1").hover(function(){
        var id = $("#span2").text();
        $.ajax({
            url:"chy_customer_findOne",
            data:"id="+id,
            type:"POST",
            dataType:"json",
            success:function(result){
                $("#header2").append("<div id=\"header2_1\">\n" +
                    "            <ul class=\"list-group\">\n" +
                    "                <li class=\"list-group-item\">手机号:"+result.tel+"</li>\n" +
                    "                <li class=\"list-group-item\">年龄:"+result.age+"</li>\n" +
                    "                <li class=\"list-group-item\">性别:"+result.sex+"</li>\n" +
                    "                <li class=\"list-group-item\">地址:"+result.site+"</li>\n" +
                    "                <li class=\"list-group-item\">病例:"+result.medicalrecord+"</li>\n" +
                    "            </ul>\n" +
                    "        </div>");
            },
            error:function(){
                alert("错误")
            }
        })
    },function(){
        $("#header2_1").remove();
    })

    // 轮播图
    $.ajax({
        url:"chy_carousel_findAll",
        type:"POST",
        dataType:"json",
        success:function(result){
            $.each(result,function(index,result1){
                $("#right").append("<img src='../chy_img/"+result1.name+"'/>");
            })
            num1 = result.length;
            $("#right>img").eq(0).show();
        },
        error:function(){
            alert("错误")
        }
    })
    setInterval(function(){
        if(num2==100){
            $("#right>img").eq(num3).fadeIn(800).siblings().fadeOut(800);
            num3++;
            if(num3 == num1){
                num3=0;
            }
        }
        num2+=100;
        if(num2==6000){
            num2 = 0;
        }
    },100)

    //显示在线医生
    $.ajax({
        url:"chy_doctor_findAllOnline",
        type:"POST",
        dataType:"json",
        success:function(result){
            $.each(result,function(index,result1){
                $("#main3").append("<div>\n" +
                    "                <a href='chy_doctor_details?id="+result1.id+"'><img src=\"chy_img/"+result1.photo+"\"/></a><br/>\n" +
                    "                <h4>"+result1.hospital+result1.post+"&nbsp;&nbsp;"+result1.name+"</h4>\n" +
                    "            </div>");
            })
        },
        error:function(){
            alert("错误")
        }
    })
})