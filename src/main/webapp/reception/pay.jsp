<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>支付页面</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/Orderbasic.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/pay/pay.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/pay/pay.js" charset="utf-8"></script>
</head>
<body>
    <!--头部-->
    <div class="header">
        <!--<i class="fa fa-credit-card-alt"></i>-->
        <img src="${pageContext.request.contextPath }/image/pay/ele.png">
        <h3 class="title">收银台</h3>
    </div>

    <!--body内容区-->
    <div class="main_container">
        <div class="container">
            <!-- 订单内容-->
            <div class="content order">
                <h3>订单详情</h3>
                <div class="oder_detail">
                    <div class="pull-left user_box">
                        <p class="text-muted order_seller">${current_cart.map.value.goods.bname }</p>
                        <p class="" id="look_order_info">
                            <span class="text-muted order_user"><span>${current_con.name }</span> <span>${current_con.telphone }</span> <span>${current_con.address }</span>-
<c:forEach items="${current_cart.map }" var="map"> <c:set var="gid" value="${map.key}"></c:set> <c:set var="cartDetails" value="${map.value}"></c:set>
<span>${cartDetails.goods.gname }</span> x<span>${cartDetails.subCount}</span>
</c:forEach></span>
                            <a class="a_css look_order" href="javascript:">
                                <span class="look_order">查看详情</span>
                                <span class="fa fa-angle-down"></span>
                            </a>
                        </p>
                        <!-- 隐藏部分-->
                        <div class="order_detail text-muted hidden" id="look_order_msg">
<p class="user_info"><span>${current_con.name }</span> <span>${current_con.telphone }</span>
<span>${current_con.address }</span>
-
<c:forEach items="${current_cart.map }" var="map"> <c:set var="gid" value="${map.key}"></c:set> <c:set var="cartDetails" value="${map.value}"></c:set>
${cartDetails.goods.gname } x${cartDetails.subCount}
</c:forEach>
</p>
                            <a class="a_css look_up" href="javascript:">
                                <span class="look_order">收起</span>
                                <span class="fa fa-angle-up"></span>
                            </a>
                        </div>
                    </div>


                    <p class="pull-right order_rigth">
                        <span>
                            <span>支付金额:</span>
                            <strong class="oder_money">
                                <span>￥</span>
                                <span>${current_cart.totalMoney }</span>
                            </strong>
                        </span>
                    </p>
                    <div style="clear: both"></div>
                </div>
                <div style="clear: both"></div>
            </div>
            <!-- 支付确认-->
            <div class="content pay_method">
                <header>
                    <h3>请选择支付方式</h3>
                    <p class="text-color">
                        <span>剩余支付时间</span>
                        <span id="pay_time1" class="pay_color">14</span>
                        <span class="pay_color">分</span>
                        <span id="pay_time2" class="pay_color">59</span>
                        <span class="pay_color">秒</span>
                        <span>，逾期订单将自动取消</span>
                    </p>
                </header>
                <!--选择支付-->
                <div class="pay_box">
                    <p class="pay_title text-muted">
                        <span>第三方支付</span>
                        <span class="text-money">￥${current_cart.totalMoney }</span>
                    </p>
                    <div class="alipay">
                        <div class="alipay_foot">
                            <h4>支付宝</h4>
                        </div>
                        <div class="after"></div>
                    </div>
                </div>
                <!-- 确认支付-->
                <div>
                    <button class="btn">确认支付</button>
                </div>
            </div>
        </div>
    </div>

	<span id="oid" style="display: none;">${oid }</span>


</body>
<script type="text/javascript">
$(document).ready(function(){
    //点击支付,跳转到二维码页面
    $(".btn").click(function(){
    	//获取当前订单id
    	var oid = $("#oid").text();
    	
        if(!($(".after").is(":hidden"))){
            //请求的路径
    		window.location.href="${pageContext.request.contextPath }/payServlet?method=pay&oid="+oid; 
        }else{
            alert("请选择支付的方式");
        }
    });
	
})
</script>
</html>