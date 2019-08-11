'use strict';

(function($) {
  $.fn.phAnim = function( options ) {

    var settings = $.extend({}, options),
    		label,
  			ph;

    function getLabel(input) {
      return $(input).parent().find('label');
    }

    function makeid() {
      var text = "";
      var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for( var i=0; i < 5; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));
      return text;
    }

    return this.each( function() {

      if( $(this).attr('id') == undefined ) {
        $(this).attr('id', makeid());
      }

      if( getLabel($(this)).length == 0 ) {
        if( $(this).attr('placeholder') != undefined ) {
          ph = $(this).attr('placeholder');
          $(this).attr('placeholder', '');
          $(this).parent().prepend('<label for='+ $(this).attr('id') +'>'+ ph +'</label>');
        }
      } else {
        $(this).attr('placeholder', '');
        if(getLabel($(this)).attr('for') == undefined ) {
          getLabel($(this)).attr('for', $(this).attr('id'));
        }
      }
      $(this).on('focus', function() {
        label = getLabel($(this));
        label.addClass('active focusIn');
      }).on('focusout', function() {
        if( $(this).val() == '' ) {
          label.removeClass('active');
        }
        label.removeClass('focusIn');
      });
    });
  };
}(jQuery));

$(document).ready(function() {
	$('input').phAnim();
});


// 密码显示
$(function(){
	$("#passWordHide").click(function(){
		$("#passWordHide").css({"display":"none"});
		$("#passWordShow").css({"display":"inline-block"});
		document.getElementById("passWord").setAttribute("type","text")
	})
})

//密码隐藏
$(function(){
	$("#passWordShow").click(function(){
		$("#passWordHide").css({"display":"inline-block"});
		$("#passWordShow").css({"display":"none"});
		document.getElementById("passWord").setAttribute("type","password")
	})
})

//表单验证帐户
var sub = true;//定义一个状态，根据状态来判断是否正确，是否提交
function validata1(v, id) {//传入俩个参数一个是当前input的value，另一个是当前input的id，这个函数最终返回的是一个布尔值
  if (v == "") {//判断value是否为空
    $("#" + id).next().css('display', 'block');
    sub = false;//为空的话
  } else {
    sub = true;
    if (id == 'firstname') {//如果传入的id是密码的id 判断手机号码的格式是否正确
      var myreg = /^[0-9]{5}$/;
      if (!myreg.exec(v)) {
        sub = false;
      } else {
        sub = true;
      }
    }
  }
  if (sub) {//如果sub为true那么让警告的小图标隐藏
    $("#" + id).next().css('display','none');
  } else {
    $("#" + id).next().css('display','block');
  }
  return sub //将最终的sub的状态return出来，以便提交的时候判断是否提交
}

//表单验证密码
function validata2(v, id) {//传入俩个参数一个是当前input的value，另一个是当前input的id，这个函数最终返回的是一个布尔值
  if (v == "") {//判断value是否为空
    $("#" + id).next().css('display', 'block');
    sub = false;//为空的话
  } else {
    sub = true;
    if (id == 'passWord') {//如果传入的id是密码的id 判断手机号码的格式是否正确
      var myreg = /^[A-Za-z0-9_]{6-18}$/;
      if (!myreg.exec(v)) {
        sub = false;
      } else {
        sub = true;
      }
    }
  }
  if (sub) {//如果sub为true那么让警告的小图标隐藏
    $("#" + id).next().css('display','none');
  } else {
    $("#" + id).next().css('display','block');
  }
  return sub //将最终的sub的状态return出来，以便提交的时候判断是否提交
}