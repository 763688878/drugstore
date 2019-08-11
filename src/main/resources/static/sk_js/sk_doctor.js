$("#ss").click(function(){
    var hospital =  $("#s1").val();
    var post =  $("#s2").val();
    var subject =  $("#s3").val();
    $.ajax({
        url : "dc_cx",
        type : "POST",
        data : { "hospital":hospital,"post":post,"subject":subject
        },
        dataType:"text",
        success:function(data) {
        },
    })

})

