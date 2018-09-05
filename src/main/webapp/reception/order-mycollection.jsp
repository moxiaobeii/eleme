<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的收藏页面</title>
    <!-- 基础样式CSS-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/basic.css">
    <!-- order页面样式-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/order.css"/>
    <!-- header页面样式-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css"/>
    <!--外部引入头部私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/sidebar.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/header.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/order-message.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/order-myCollect.css">
    
    
    <!-- order页面样式库-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/order-iconfont.css"/>
    <!-- JQuery库-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
    <!--导入js文件-->
    <script src="${pageContext.request.contextPath }/js/sidebar.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/order.js"></script>
</head>
<body>
    <jsp:include page="sidebar.jsp"></jsp:include>

    <!--头部部分-->
    <header class="header">
    	<jsp:include page="header.jsp"></jsp:include>
    </header>

    <!--内容区-->
    <div class="bodyer">
        <div class="center">
            
            <!-- 地址导航栏 -->
            <div class="location">
                <span id="span1">当前位置:</span><span id="span2"><a href="javascript:void(0)">广州市南沙区人民政府</a></span><span id="span3"><a href="javascript:void(0)">[切换地址]</a></span><span id="span4"><i class="iconfont icon-xiangyou"></i><span>我的收藏</span></span>
            </div>

            <div class="center-content">
                <!-- 左侧边导航栏-->
                <ul class="slideBar">
                    <li class="slideBarLi_one">
                        <h2>
                            <i class="fa fa-home" id="slideBarLi_one_myhome"></i><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=orderpersonpage"  class="slideBarOption">个人中心</a>
                        </h2>
                    </li>
                    <li class="slideBarLi_two">
                        <h2><i class="fa fa-file" id="slideBarLi_two_myhome"></i>我的订单</h2>
                        <ul>
                            <li ><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=recentlyorderpage" class="slideBarOption">近三个月订单</a></li>
                        </ul>
                    </li>
                    <li class="slideBarLi_three">
                        <h2 ><i class="fa fa-user-o" id="slideBarLi_three_myhome"></i>我的资料</h2>
                        <ul>
                            <li ><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo"  class="slideBarOption">个人资料</a></li>
                            <li ><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryConsigneeInfo"  class="slideBarOption">地址管理</a></li>
                        </ul>
                    </li>
                    <li class="slideBarLi_four ">
                        <h2>
                            <i class="fa fa-star"  id="slideBarLi_four_myhome"></i><a href="${pageContext.request.contextPath }/consigneeCtroller?method=collectedBusinessInfo"  class="slideBarOption">我的收藏</a>
                        </h2>
                    </li>
                </ul>

                <!-- 中间内容部分-->
                <div class="center-box">
                		 <div class="myCollect-center">
        <h3 class="myCollect-center-h3">我的收藏</h3>
        <div class="myCollect-center-div">
            <h4 class="myaddress-favorTitle">当前区域共有 <span>0</span> 家可配送商家</h4>
            <div class="myaddress-deliveryShop">
                <p>暂无可配送商家</p>
            </div>
            
            <h4 class="myaddress-favorTitle">当前区域不可配送商家</h4>
            
             <c:forEach items="${collectedBusiness }" var="myCollectBusiness">
	            <div class="myaddress-noDeliveryShop">
	                <div class="myaddress-noDeliveryShop-div">
	                    <div class="myaddress-noDeliveryShop-div-photo1">
	                        <img src="${pageContext.request.contextPath }/image/myaddress-noDeliveryShop-div-photo2.jpeg">
	                    </div>
	                    <img src="${pageContext.request.contextPath }/image/myaddress-noDeliveryShop-div-photo2.jpeg" class="myaddress-noDeliveryShop-div-photo2">
	                    <a href="javascript:void(0)" class="myaddress-noDeliveryShop-div-a">${myCollectBusiness.bname}</a>
	                    <p class="myaddress-noDeliveryShop-div-p1">起送价</p>
	                    <p class="myaddress-noDeliveryShop-div-p2">送餐时间</p>
	                    <p class="myaddress-noDeliveryShop-div-p3">¥${myCollectBusiness.offer_price }</p>
	                    <p class="myaddress-noDeliveryShop-div-p4">${myCollectBusiness.distribution_time }分</p>
	                </div>
	            </div>
         	</c:forEach>
            
        </div>
    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
    	<jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>

</html>