<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>个人资料页面</title>
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
                <span id="span1">当前位置:</span><span id="span2"><a href="javascript:void(0)">广州市南沙区人民政府</a></span><span id="span3"><a href="javascript:void(0)">[切换地址]</a></span><span id="span4"><i class="iconfont icon-xiangyou"></i><span>个人资料</span></span>
            </div>

            <div class="center-content">
                <!-- 左侧边导航栏-->
                <ul class="slideBar">
                    <li class="slideBarLi_one">
                        <h2>
                            <i class="fa fa-home" id="slideBarLi_one_myhome"></i><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=orderpersonpage" class="slideBarOption">个人中心</a>
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
                		<div class="myMessage-center">
        					<h3 class="myMessage-center-h3">个人资料</h3>
       						 <div class="myMessage-center-div">
            					<p>
	                				<span class="myMessage-center-div-p-span">头像</span>
	               					<img src="${pageContext.request.contextPath }/image/personal-info-headPhoto.png">
           						</p>
					            <span class="myMessage-center-div-span1">用户名：</span>
					            <span class="myMessage-center-div-span2">${UserInfo.username }</span><br/>
					            
					            <span class="myMessage-center-div-span1">用户ID:</span>
					            <span class="myMessage-center-div-span2">${UserInfo.userId }</span><br/>
					            
					            <span class="myMessage-center-div-span1">我的红包:</span>
					            <span class="myMessage-center-div-span2">${UserInfo.myRedPaper }</span><br/>
					            
					            <span class="myMessage-center-div-span1">我的金币:</span>
					            <span class="myMessage-center-div-span2">${UserInfo.myGold }</span><br/>
					            
					            <span class="myMessage-center-div-span1">账户余额:</span>
					            <span class="myMessage-center-div-span2">${UserInfo.myCount }</span><br/>
            
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
<script>
	
		
		
		
		

	
	
</script>
</html>