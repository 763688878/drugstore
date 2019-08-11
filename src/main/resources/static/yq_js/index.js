$(function(){
	var L1 = $("#L1,#L2,#L3,#L4,#L5,#L6,#L7");
	var L2 = $(".L1,.L2,.L3,.L4,.L5,.L6,.L7");
	var L3 = $("#L1>i,#L2>i,#L3>i,#L4>i,#L5>i,#L6>i,#L7>i");
	var L4 = $(".L1>i,.L2>i,.L3>i,.L4>i,.L5>i,.L6>i,.L7>i");
	var h = $("#header3").text();
	var index1;
	var index2;
	if(h.indexOf("管理员")!=-1){
		$("#L6").css("display","block");
	}else{
		$("#L6").css("display","none");
	}
	L4.css({"display":"none"});
	L2.click(function(){
		index2 = L2.index(this);
		L2.css({"background-color":""});
		$(this).css({"background-color":"rgb(237, 81, 80)"});
		L4.css({"display":"none"});
		L4.eq(index2).css({"display":"inline-block"});
	})
	L1.click(function(){
		index1 = L1.index(this);
		L3.not(L3.eq(index1)).css({"transform":"rotate(0deg)"});
		switch(index1){
			case 0:
				if($(".L1").css("display")=="none"){
					L3.eq(index1).css({"transform":"rotate(90deg)","transition":"0.3s"});
				}else{
					L3.css({"transform":"rotate(0deg)"});
				}
				$(".L1").slideToggle();
				L2.not(".L1").slideUp();
			break;
			case 1:
				if($(".L2").css("display")=="none"){
					L3.eq(index1).css({"transform":"rotate(90deg)","transition":"0.3s"});
				}else{
					L3.css({"transform":"rotate(0deg)"});
				}
				$(".L2").slideToggle();
				L2.not(".L2").slideUp();
			break;
			case 2:
				if($(".L3").css("display")=="none"){
					L3.eq(index1).css({"transform":"rotate(90deg)","transition":"0.3s"});
				}else{
					L3.css({"transform":"rotate(0deg)"});
				}
				$(".L3").slideToggle();
				L2.not(".L3").slideUp();
			break;
			case 3:
				if($(".L4").css("display")=="none"){
					L3.eq(index1).css({"transform":"rotate(90deg)","transition":"0.3s"});
				}else{
					L3.css({"transform":"rotate(0deg)"});
				}
				$(".L4").slideToggle();
				L2.not(".L4").slideUp();
			break;
			case 4:
				if($(".L5").css("display")=="none"){
					L3.eq(index1).css({"transform":"rotate(90deg)","transition":"0.3s"});
				}else{
					L3.css({"transform":"rotate(0deg)"});
				}
				$(".L5").slideToggle();
				L2.not(".L5").slideUp();
			break;
			case 5:
				if($(".L6").css("display")=="none"){
					L3.eq(index1).css({"transform":"rotate(90deg)","transition":"0.3s"});
				}else{
					L3.css({"transform":"rotate(0deg)"});
				}
				$(".L6").slideToggle();
				L2.not(".L6").slideUp();
			break;
			case 6:
				if($(".L7").css("display")=="none"){
					L3.eq(index1).css({"transform":"rotate(90deg)","transition":"0.3s"});
				}else{
					L3.css({"transform":"rotate(0deg)"});
				}
				$(".L7").slideToggle();
				L2.not(".L7").slideUp();
			break;
		}
	})
})