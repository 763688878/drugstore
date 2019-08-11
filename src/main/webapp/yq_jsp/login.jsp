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
<link rel="stylesheet" type="text/css" href="yq_css/yq_login.css" />
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
	<input type="hidden" id="loginMessage" value="${flag}">
		<div id="main">
		
			<div class="iam-main-inner">				
				<!-- forms -->
				<form action="customerLoginController" method="post">
					<div class="account-details">
						<!-- 账号 -->
						<div class="custom-input" id="userId" style="margin-top:200px;">
							<label for="firstname">手机号</label>
							<input type="text" class="form-control" name="uname" id="firstname" value="" onblur="validata1(value,id)">
						</div>
						
						<!-- 密码 -->
						<div class="custom-input" id="passWord0" style="margin-top:200px;">
							<label for="passWord">密码</label>
							<input type="password" class="form-control" name="upassword" id="passWord" value="" onblur="validata2(value,id)">
							<img id="passWordShow" src="yq_img/eyeOpen.png" width="30px" style="position: absolute;left: 470px; top: 30px; display: none;"/>
							<img id="passWordHide" src="yq_img/eyeClose.png" width="30px" style="position: absolute; left: 470px; top: 30px;"/>
						</div>


						<!-- 登录按钮 -->
						<div class="login-button-box">
							<input type="submit" value="登录" id="login-button" >
						</div>

						<!-- 注册按钮 -->
						<div class="register-button-box">
							<a href="yq_jsp/register.jsp"><input type="button" value="立即注册" id="register-button" ></a>
						</div>

						<!-- 错误提示 -->
						<div class="wrong-prompt" style="color: red; font-size: 12px; position: absolute; top: 400px; display: none;"></div>
					</div>
				</form>
				<!-- forms -->
				
			</div>
		</div>
		<script src="yq_js/jquery-3.3.1.js"></script>
		<script src="yq_js/yq_login.js"></script>
		<script src="yq_js/phanimate.jquery.js"></script>
		<script type="text/javascript">
			$(function () {
				var loginMessage = $("#loginMessage").val();
				if(loginMessage=="errorPassword"){
					$(".wrong-prompt").text("密码错误")
					$(".wrong-prompt").css('display','inline-block')
				}

				if(loginMessage=="noUsername"){
					$(".wrong-prompt").text("帐户不存在")
					$(".wrong-prompt").css('display','inline-block')
				}
			})
		</script>
	</body>
</html>