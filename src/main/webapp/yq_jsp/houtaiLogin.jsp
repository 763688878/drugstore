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
    <meta charset="utf-8">


    <title>药必达</title>
    <link href="yq_css/bootstrap.min.css" rel="stylesheet">
    <link href="yq_css/font-awesome.css" rel="stylesheet">
    <link href="yq_css/animate.css" rel="stylesheet">
    <link href="yq_css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div style="width:100px; height: 200px;">

            </div>
            <h3>欢迎使用药必达后台管理系统</h3>

            <form class="m-t" role="form" action="houtaiLogin" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="密码" required="">
                </div>
                <span style="color: red;font-size: 14px;">${msg}</span>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>

            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script src="yq_js/jquery.min.js"></script>
    <script src="yq_js/bootstrap.min.js"></script>

</body>

</html>
