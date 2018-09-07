<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>个人中心页面</title>
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
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/order-personal.css">
    
    
    <!-- order页面样式库-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/order-iconfont.css"/>
    <!-- JQuery库-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
    <!--导入js文件-->

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
                <span id="span1">当前位置:</span><span id="span2"><a href="javascript:void(0)">广州市南沙区人民政府</a></span><span id="span3"><a href="javascript:void(0)">[切换地址]</a></span><span id="span4"><i class="iconfont icon-xiangyou"></i><span>个人中心</span></span>
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
                		<div class="person-center">

        <!-- 个人信息-->
        <div class="person-center-info">
            <div class="person-center-info-div1">
                <div class="edit">
                    <img src="${pageContext.request.contextPath }/image/personal-info-headPhoto.png">
                    <div id="edit-message" ><span><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo">编辑资料</a></span></div>
                </div>
                <h3>早上好,&nbsp;&nbsp;<strong>${sessionScope.user.username }</strong></h3>
                <p>订餐了吗？提前订餐送得快！</p>
            </div>
            <div class="person-center-info-div2">
                <p class="person-center-info-div2-p1"><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo">我的红包</a></p>
                <p class="person-center-info-div2-p2 PerCenIoD2P2"><span><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo">${sessionScope.user.myRedPaper }</a></span>个</p>
            </div>
            <div class="person-center-info-div3">
                <p class="person-center-info-div2-p1"><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo">我的金币</a></p>
                <p class="person-center-info-div2-p2 PerCenIoD3P2"><span><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo">${sessionScope.user.myGold }</a></span>个</p>
            </div>
            <div class="person-center-info-div4">
                <p class="person-center-info-div2-p1"><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo">账户余额</a></p>
                <p class="person-center-info-div2-p2 PerCenIoD4P2"><span><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo">${sessionScope.user.myCount }</a></span>元</p>
            </div>
        </div>

        <!-- 最近订单-->
        <div class="recently-order">
            <div class="recently-order-title">
                <a href="javascript:void(0)" class="recently-order-title-a1">最近订单</a>
                <a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=recentlyorderpage" class="recently-order-title-a2">查看全部订单></a>
            </div>

            <!-- 最近订单详情-->
           <!-- 第一行-->
           <c:forEach items="${OrderDetailInfo }" var="ordresInfo" end="2">  
            <div class="recently-order-content">
                <div class="recently-order-content-div1">
                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath }/image/order_img.jpg"></a>
                    <h3>${ordresInfo.bname }</h3>
                   
                    <p><a href="javascript:void(0)">
                    	<c:forEach items="${ordresInfo.orderDetails }" var="ordre_Details" varStatus="status">
			                <span class="td-three-food"><a href="javascript:void(0) ">${ordre_Details.gname }&nbsp;*</a></span>			                                        
			                <span class="td-three-num"><a href="javascript:void(0) ">${ordre_Details.count }</a></span>			                
			                <c:out value="${status.last == true ? ' ':'+' }"></c:out>		                			                        	
			            </c:forEach>  
                    </a></p>
                    <a href="javascript:void(0)" class="recently-order-content-div1-a2">共<i>${ordresInfo.good_count }</i>个菜品</a>
                </div>
                <div class="recently-order-content-div2">
                        <fmt:formatDate value="${ ordresInfo.create_time }"  type="date" dateStyle="default"/><br/><br/>
                        <fmt:formatDate value="${ordresInfo.create_time}" pattern="HH:mm:ss"/>
                </div>
                <div class="recently-order-content-div3">
                    <p>¥${ordresInfo.total_price }</p>
                </div>
                <div class="recently-order-content-div4">
                    <p>
						<c:choose>
			                <c:when test="${ordresInfo.order_status==0 }">未付款</c:when>
			                <c:when test="${ordresInfo.order_status==1 }">订单失效</c:when>
			                <c:when test="${ordresInfo.order_status==2 }">已付款</c:when>
			                <c:when test="${ordresInfo.order_status==3 }">未送达 </c:when>
			                <c:when test="${ordresInfo.order_status==4 }">已送达</c:when>			                
			                </c:choose>
					</p>
                    <a href="${pageContext.request.contextPath }/reception/order-details.jsp?oid=${ordresInfo.oid}">订单详情</a>
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
<script>
	
		$.post(
		    	//把索引值传过去给indexServlet层的index方法
		    	"${pageContext.request.contextPath }/ConsigneeCtroller?method=queryRecentlyOrderInfo", 
		    	"indexT="+(indexT-1), 
		    	function(json) {
					//创建标签存放商家数据
					//找到a标签的父节点
					var $parent = $(".ordMes-main-in");
					for(var i=0; i<json.length; i++){
				    	var $a = $("<a></ a>").addClass("sellers");
				    	var $div1 = $("<div></div>").addClass("seller-logo");
				    	
						var $img = $("<img/>").attr({"src":"../"+json[i].logo+"", "alt":json[i].bname});
				  		var $span11 = $("<span></span>").html(json[i].distribution_time+"分钟");
				  		
				  		var $div2 = $("<div></div>").addClass("seller-mes");
				  		var $div21 = $("<div></div>").addClass("seller-title").html(json[i].bname);
				  		var $div22 = $("<div></div>").addClass("star");
				  		var $span21 = $("<span></span>").addClass("fa fa-star");
				  		var $span22 = $("<span></span>").addClass("fa fa-star");
				  		var $span23 = $("<span></span>").addClass("fa fa-star");
				  		var $span24 = $("<span></span>").addClass("fa fa-star");
				  		var $span25 = $("<span></span>").addClass("fa fa-star-half-full");
				  		var $div23 = $("<div></div>").addClass("seller-cost").html("配送费￥"+ json[i].distribution_fee);
				  		var $div24 = $("<div></div>").addClass("seller-activity");
				  		
				  		var $div3 = $("<div></div>").addClass("seller-mes-hide-out").addClass("hide");
				  		var $div31 = $("<div></div>").addClass("seller-mes-hide-in");
				  		var $div311 = $("<div></div>").addClass("seller-mes-hide-name").html(json[i].bname);
				  		var $div312 = $("<div></div>").addClass("seller-mes-hide-type").html(json[i].category);
				  		var $ul = $("<ul></ul>").addClass("seller-mes-hide-other");
				  		var $li1 = div23 = $("<li></li>").html("配送费￥"+ json[i].distribution_fee);
				  		var $li2 = $("<li></li>").html("平均");
				  		var $span31 = $("<span></span>").addClass("service-time").html(json[i].distribution_time +"分钟");
		    
				  		$parent.append($a);
				        $a.append($div1);
				    	$a.append($div2);
				    	$a.append($div3);
				    	$div1.append($img);
				    	$div1.append($span11);
				    	$div2.append($div21);
				  		$div2.append($div22);
				  		$div2.append($div23);
				  		$div2.append($div24);
				  		$div22.append($span21);
				  		$div22.append($span22);
				  		$div22.append($span23);
				  		$div22.append($span24);
				  		$div22.append($span25);
				  		$div3.append($div31);
				  		$div31.append($div311);
				  		$div31.append($div312);
				  		$div31.append($ul);
				  		$ul.append($li1);
				  		$ul.append($li2);
				  		$li2.append($span31);
					}
				}, "json"
		    );
	
</script>
</html>

