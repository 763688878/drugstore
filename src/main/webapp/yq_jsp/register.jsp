<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="yq_css/register.css" />
    <style type="text/css">
        .container{padding: 1.5em 0;}
        .custom-input {
            position: relative;
            padding-top: 20px;
            margin-bottom: 10px;
        }

        .custom-input input {
            padding-left: 15px;
        }

        .custom-input label {
            cursor: text;
            margin: 0;
            padding: 0;
            left: 15px;
            top: 27px;
            position: absolute;
            font-size: 14px;
            color: #ccc;
            font-weight: normal;
            transition: all .3s ease;
        }

        .custom-input label.active {
            top: 0;
            left: 0;
            font-size: 14px;
        }

        .custom-input label.active.focusIn {
            color: rgb(20,40,160);
        }
    </style>
    <title>药必达</title>
</head>
<body>
<div id="main">

    <div class="iam-main-inner">
            <div class="account-details">
                <%--顾客--%>
                <div id="customer-box">
                    <form action="/register" method="post">
                        <!-- 账号 -->
                        <div class="custom-input" id="userId" style="margin-top:200px;">
                            <label for="firstname">手机号</label>
                            <input type="text" class="form-control" name="number" id="firstname" value="" onblur="testTel(value)">
                            <span id="telPrompt" style="display: none; color:red;font-size: 12px; ">请输入正确的手机号</span>
                            <span id="telPrompt1" style="display: none; color:red;font-size: 12px; ">该账号已经注册,请勿重复注册</span>
                        </div>

                        <!-- 密码 -->
                        <div class="custom-input" id="passWord0" style="margin-top:200px;">
                            <label for="passWord">密码</label>
                            <input type="text" class="form-control" name="upassword" id="passWord" value="">
                        </div>

                        <!-- 姓名 -->
                        <div class="custom-input" id="name0" style="margin-top:200px;">
                            <label for="name">姓名</label>
                            <input type="text" class="form-control" name="name" id="name" value="">
                        </div>

                        <%--年龄--%>
                        <div class="custom-input" id="age0" style="margin-top:200px;">
                            <label for="age">年龄</label>
                            <input type="text" class="form-control" name="age" id="age" value="">
                        </div>

                        <%--性别--%>
                        <div class="custom-input" id="sex0" style="margin-top:200px;">
                            <span style="font-size: 1.242em; margin-left: 10px;">性别:</span>
                            <select id="sex" style="" name="sex">
                                <option value="男" style="font-size: 1em;">男</option>
                                <option value="女" style="font-size: 1em;">女</option>
                            </select>
                        </div>

                        <%--地址--%>
                        <div class="custom-input" id="site0" style="margin-top:200px;">
                            <label for="site">地址</label>
                            <input type="text" class="form-control" name="site" id="site" value="">
                        </div>

                        <%--验证码--%>
                        <div class="custom-input" id="verifyCode0" style="margin-top:200px;">
                            <label for="verifyCode">验证码</label>
                            <input type="text" class="form-control" name="verifyCode" id="verifyCode" value="" onkeyup="testCode(value)">
                            <span id="telPrompt2" style="display: none; color:red;font-size: 12px; position: relative; left: -304px; top: 35px;">请输入正确的验证码</span>
                        </div>

                        <!-- 获取验证码 -->
                        <div class="verifyCode-button-box">
                            <input type="button" value="获取验证码" id="getVerifyCode-button" class="sendVerifyCode" disabled="disabled">
                        </div>

                        <!-- 注册按钮 -->
                        <div class="register-button-box">
                            <input type="submit" value="注册" id="register-button" disabled="disabled">
                        </div>
                    </form>
                </div>
            </div>

    </div>
</div>
<script type="text/javascript" src="yq_js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="yq_js/yq_login.js"></script>
<script type="text/javascript" src="yq_js/phanimate.jquery.js"></script>
<script type="text/javascript" src="yq_js/countdown.js"></script>
<script type="text/javascript" src="yq_js/regist.js"></script>
<script type="text/javascript">
    //验证帐户是否存在
    function testTel(Tel){
        var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
        var flag = false;
        if (!myreg.test(Tel)) {
            $("#telPrompt").css('display','inline-block');
            $('#register-button').attr("disabled","disabled");
            $('#getVerifyCode-button').attr("disabled","disabled");
            flag = false;
        } else {
            $("#telPrompt").css('display','none');
            flag = true;
        }

        var number = $("input[name=number]").val();
        console.log(number);
        if(number!=""){
            $.ajax({
                url:"/checkingCount",
                async : true,
                data:{"number":number},
                type:"post",
                dataType:"json",
                success:function(result){
                    /*手机号合法并且没有注册过*/
                    if(result=='0'&&flag==true){
                        console.log("this is success");
                        $('#getVerifyCode-button').removeAttr("disabled");
                        if(result=='1'){
                            $("#telPrompt1").css('display','inline-block');
                        }else{
                            $("#telPrompt1").css('display','none');
                        }

                    }else{
                        /*手机号不合法或者已经注册过*/
                        console.log("this is error");
                        $('#register-button').attr("disabled","disabled");

                        if(result=='1'){
                            $("#telPrompt1").css('display','inline-block');
                        }else{
                            $("#telPrompt1").css('display','none');
                        }
                    }
                },
                error:function(){
                }
            })
        }

    }
    /*checking验证码*/
    function testCode(verifyCode) {
        if(verifyCode.length!=6){
            $('#register-button').attr("disabled","disabled");
            $("#telPrompt2").css('display','inline-block')
        }else {

            $.ajax({
                url:"/checkingCode",
                async : true,
                data:{"verifyCode":verifyCode},
                type:"post",
                dataType:"json",
                success:function(result){
                    if(result=="true"){
                        $('#register-button').removeAttr("disabled");
                        $("#telPrompt2").css('display','none')
                    }else{
                        $('#register-button').attr("disabled","disabled");
                        $("#telPrompt2").css('display','inline-block')
                    }
                },
                error:function(){
                }
            })
        }
    }




</script>
</body>
</html>