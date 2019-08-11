<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>用户注册</title>
</head>
<body>
	<span id="show"></span>
<script>
	var t=3;//设定跳转的时间
	setInterval("refer()",1000); //启动1秒定时
	function refer(){
		if(t==0){
			location="yq_jsp/login.jsp"; //#设定跳转的链接地址
		}
		document.getElementById('show').innerHTML="注册成功"+t+"秒后跳转到登录界面..."; // 显示倒计时
		t--; // 计数器递减
		//本文转自：
	}
</script>
</body>
</html>