<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/order.js"></script>
<title>Insert title here</title>
<!--导入jQuery文件-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <!--外部引入公共css样式-->
    <!-- <link rel="stylesheet" type="text/css" href="../css/basic.css"> -->
    <!--外部引入小图标css样式-->
    <!-- <link rel="stylesheet" type="text/css" href="../css/font-awesome/css/font-awesome.css"> -->
    <!--外部引入头部私有样式-->
    <!-- <link rel="stylesheet" type="text/css"  href="../css/header.css"> -->
</head>
<body>
<header id="header">
    <div id="top">
        <div id="top-left">
            <a href="index.jsp" class="top-logo">
                <img src="${pageContext.request.contextPath }/image/header-2.png">
            </a>
            <a href="${pageContext.request.contextPath }/index.jsp" class="top-item top-first">首页</a>
            <a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=recentlyorderpage" class="top-item">我的订单</a>
            <a href="javascript:void(0)" class="top-item">加盟合作</a>
            <a href="javascript:void(0)" class="top-item">我的客服</a>
        </div>
        <div id="top-right">
            <a href="javascript:void(0)" class="top-itemR top-itemR-first">规则中心</a>
            <div class="top-itemR top-itemR-second">
                <i class="fa fa-mobile-phone"></i>
                手机应用
                <div class="top-itemR-mobile-drop">
                    <span>扫一扫，手机定餐更方便</span>
                    <img src="${pageContext.request.contextPath }/image/header-1.png">
                </div>
            </div> 
            <c:if test="${user != null}">
	            <div class="top-itemR top-itemR-last">
	                <span id="userName">${sessionScope.user.username}</span>
	                <span class="fa fa-angle-down"></span>
	                <div class="top-itemR-profile-drop showUser" id="top-itemR-profile-drop">
	                    <a class="profile-drop-a" href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=orderpersonpage" >个人中心</a>
	                    <a class="profile-drop-b" href="${pageContext.request.contextPath }/consigneeCtroller?method=collectedBusinessInfo">我的收藏</a>
	                    <a class="profile-drop-c" href="${pageContext.request.contextPath }/consigneeCtroller?method=queryConsigneeInfo">我的地址</a>
	                    <a class="profile-drop-d">安全设置</a>
	                    <a class="profile-drop-e" id="profile-drop-e" href="${pageContext.request.contextPath}/userController?method=quitSys">退出登录</a>
	                </div>
	            </div>
            </c:if>
            <c:if test="${user == null}">
                <div class="top-itemR top-itemR-last">
	                <a id="userName" class="quitSys" style="color:white;text-decoration: none;" href="${pageContext.request.contextPath}/reception/login.jsp">登录/注册</a>
	            </div>
            </c:if>
            
            <div class="top-item2"></div>
        </div>
    </div>
</header>

<script type="text/javascript">
	$(function(){
		//判断当前有无用户登录
		$(".top-itemR-last").mouseenter(function(){
			$("#top-itemR-profile-drop").removeClass("showUser");
		}).mouseleave(function(){
			$("#top-itemR-profile-drop").addClass("showUser");
		});	
	});


</script>
</body>
</html>