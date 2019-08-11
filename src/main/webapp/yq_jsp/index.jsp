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
<title>新起点科技</title>
<link rel="stylesheet" type="text/css" href="yq_css/index.css" />
<link rel="stylesheet" href="chy_img/font_1223587_f1muoxo3bmo/iconfont.css" />
</head>
<body>
<%--		<%
			String employeeid = ((Employee)request.getSession().getAttribute("employee")).geteEmployeeid();
			int powerid = ((Employee)request.getSession().getAttribute("employee")).getePowid();
			application.setAttribute("employeeid", employeeid);
		%>--%>
		<div id="wrap">
			<div id="header">
				<div id="header1">药必达后台管理系统</div>
				<div id="header2">
<%--				<c:choose>--%>
<%--					<c:when test="${!empty employee.getePhotourl() }">--%>
<%--					 <img src="yq_img/${employee.getePhotourl() } "/>--%>
<%--					</c:when>--%>
<%--					<c:otherwise>--%>
<%--					<img src="chy_img/img/user.jpg"/>--%>
<%--					</c:otherwise>--%>
<%--				</c:choose>--%>
				</div>
				<div id="header3">
					<c:if test="${!empty admin}">
						管理员,您好。
					</c:if>
					<c:if test="${!empty doctor}">
						医生,您好。
					</c:if>
					<c:if test="${!empty drugstore}">
						药店,您好。
					</c:if>
				</div>
			</div>
			<div id="main">
				<div id="main_left">
					<ul>
						<c:if test="${!empty admin}">
							<li id="L1" ><span class="iconfont iconshouye1"></span>&nbsp;&nbsp;<a href="yp_index" target="content">药品管理</a><i class="iconfont iconiconfontjiantou2"></i></li>
							<li id="L2"><span class="iconfont iconrenwu"></span>&nbsp;&nbsp;<a href="cs_index" target="content">顾客管理</a><i class="iconfont iconiconfontjiantou2"></i></li>
							<li id="L3"><span class="iconfont iconiconset0336"></span>&nbsp;&nbsp;<a href="dc_index" target="content">医生管理</a><i class="iconfont iconiconfontjiantou2"></i></li>
							<li id="L4"><span class="iconfont iconliucheng"></span>&nbsp;&nbsp;<a href="yd_index" target="content">药店管理</a><i class="iconfont iconiconfontjiantou2"></i></li>
							<li id="L5"><span class="iconfont iconbaobiao"></span>&nbsp;&nbsp;<a href="zz_findOrder" target="content">订单管理</a><i class="iconfont iconiconfontjiantou2"></i></li>
							<li id="L6"><span class="iconfont iconHRrenshirenshiguanli"></span>&nbsp;&nbsp;<a href="interrogation" target="content">问诊记录管理</a><i class="iconfont iconiconfontjiantou2"></i></li>
						<%--	<li id="L7"><span class="iconfont iconshezhi"></span>&nbsp;&nbsp;<a href="#" target="content">权限管理</a><i class="iconfont iconiconfontjiantou2"></i></li>--%>
							<li id="L8"><span class="iconfont iconshezhi"></span>&nbsp;&nbsp;<a href="chy_carousel_show" target="content">首页轮播</a><i class="iconfont iconiconfontjiantou2"></i></li>
							<li id="L9"><span class="iconfont iconshezhi"></span>&nbsp;&nbsp;<a href="logout">退出登录</a><i class="iconfont iconiconfontjiantou2"></i></li>

						</c:if>
						<c:if test="${!empty doctor}">
							<li id="L1"><span class="iconfont iconshezhi"></span>&nbsp;&nbsp;<a href="doctors?name=${doctor.name}" target="content">在线问诊</a><i class="iconfont iconiconfontjiantou2"></i></li>
							<li id="L2"><span class="iconfont iconshezhi"></span>&nbsp;&nbsp;<a href="logout">退出登录</a><i class="iconfont iconiconfontjiantou2"></i></li>
						</c:if>
						<c:if test="${!empty drugstore}">
							<li id="L1" ><span class="iconfont iconshouye1"></span>&nbsp;&nbsp;<a href="yp_index" target="content">药品管理</a><i class="iconfont iconiconfontjiantou2"></i></li>
							<li id="L2" ><span class="iconfont iconshouye1"></span>&nbsp;&nbsp;<a href="logout">退出登录</a><i class="iconfont iconiconfontjiantou2"></i></li>

						</c:if>
					</ul>
				</div>
				<div id="main_right">
					<c:if test="${!empty admin}">
						<iframe frameborder="no" width="1670px" height="889px" scrolling="no" src="yp_index" name="content" id="i"></iframe>
					</c:if>
					<c:if test="${!empty doctor}">
						<iframe frameborder="no" width="1670px" height="889px" scrolling="no" src="doctors?name=${doctor.name}" name="content" id="i"></iframe>
					</c:if>
					<c:if test="${!empty drugstore}">
						<iframe frameborder="no" width="1670px" height="889px" scrolling="no" src="yd_index" name="content" id="i"></iframe>
					</c:if>
			</div>
		</div>
		</div>
		<script type="text/javascript" src="yq_js/jquery.js" ></script>
	</body>
</html>