<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="eleme.utils.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>下单页面</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/Orderbasic.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/orderInfo/orderInfo.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/orderInfo/orderInfo.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/order.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">

</head>
<body>
	<!--顶部导航条-->
	<header>
	<div class="header_nav container">
		<span class="header_nav_path"> 当前位置: <a href="index.html">南沙创新中心</a>
			<i class="fa fa-angle-right"></i> <a href="seller.html">蒸品店</a> <i
			class="fa fa-angle-right"></i> 订单消息
		</span>
		<!-- 登录用户信息-->
		<span class="top_bar_rigth"> <span id="username">罗先生 </span> 
		<span class="fa fa-angle-down fa_size"></span>
			<div class="dropbox topbar-profilebox-dropbox" id="dropbox">
				<a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserPersonCenterInfo"><i class="fa fa-user"></i>个人中心</a> <a
					href="${pageContext.request.contextPath }/consigneeCtroller?method=collectedBusinessInfo"><i class="fa fa-star"></i>我的收藏</a> <a
					href="${pageContext.request.contextPath }/consigneeCtroller?method=queryConsigneeInfo"><i class="fa fa-map-marker"></i>我的地址</a>
				<!--<a href="javascript:"><i class="fa fa-gear "></i>安全设置</a>-->
				<a href="login.html"><i class="fa fa-power-off"></i>退出登录</a>
			</div>
		</span>
		<div style="clear: both"></div>
		
	</div>
	</header>
	<!--内容区-->
	<div class="container_outer_box">
		<!--头部标题-->
		<div class="logo">
			<div class="logo_container">
				<a href="index.html"> <img src="${pageContext.request.contextPath }/image/orderInfo/ele.png">
				</a> <span class="title">订单信息</span>
				<!--进度条-->
				<div class="step_content">
					<img src="${pageContext.request.contextPath }/image/orderInfo/number.png">
				</div>
				<div style="clear: both"></div>
			</div>
		</div>

		<!-- 内容文本区-->

		<div class="container text_area">
			<!--订单详情-->
			<div class="checkout_car">
				<div class="order_info">
					<div class="order_info_title">
						<h2>订单详情</h2>
						<a href="seller.html">< 返回商家修改</a>
					</div>
					<!--购物车标题-->
					<div class="order_table_row">
						<div class="cell itemname">商品</div>
						<div class="cell itemquantity">份数</div>
						<div class="cell itemtotal">小计 (元)</div>
					</div>
					<!-- 购物车内容-->
					<dl class="order_car">
						<dt class="oder_car_title">购物车</dt>
						<dd class="oder_car_box">
							<!--商品信息-->
							<div class="order_car_good">
								<div class="cell itemname ng-binding">巨无霸汉堡</div>
								<!--选择数量-->
								<div class="cell itemquantity">
									<button id="sub_goodCount">-</button>
									<input class="oder_car_goodCount" value="1">
									<button id="add_goodCount">+</button>
								</div>
								<div class="cell itemtotal">
									￥<span class="good_money">12.50</span>
								</div>
							</div>
						</dd>
					</dl>
					<!--配送金额-->
					<ul>
						<li class="order_table_row extra">
							<div class="cell itemname">
								<span>配送费</span> <span class="fa fa-question-circle-o"></span>
							</div>
							<div class="cell itemquantity"></div>
							<div class="cell itemtotal">
								￥<span id="deliverfee">5.00</span>
							</div>
						</li>
						<li class="order_table_row extra">
							<div class="cell itemname"></div>
							<div class="cell itemquantity"></div>
							<div class="cell itemtotal">￥</div>
						</li>
					</ul>
					<!-- 总金额-->
					<div class="checkoutcart_total color_stress">
						￥ <span class="num ng-binding"></span>
					</div>
					<!-- 商品总数量-->
					<div class="checkoutcart_totalextra">
						共<span class="ng-binding">1</span>份商品
					</div>
				</div>
			</div>

			<!--右侧核实信息-->
			<div class="checkout_content">
				<!--收货栏-->
				<div class="checkout_select">
					<h2>
						收货地址 <a class="checkout_addaddress" href="javascript:">添加新地址</a>
					</h2>
					<!--收货地址列表-->
					<ul class="checkout_address_list showmore">
					
					<!-- 	<!--第一个收货地址默认选中激活-->
					 	<c:forEach items="${ConsigneeAddressInfo }" var="c" varStatus="vs">
					 		<c:choose>
					 			<c:when test="${vs.first }">
									<li class="checkout_address address1 active">
										<i class="checkout_address_icon fa fa-map-marker"></i>
										<div class="checkout_address_info">
											<p class="ng-binding"><span>${c.name}</span>&nbsp;&nbsp;&nbsp;<span>${c.telphone}</span></p>
											<p class="color_weak">${c.address}</p>
										</div>
									</li>
								</c:when>
					 			<c:otherwise>
						 			<li class="checkout_address ng-scope">
										<i class="checkout_address_icon fa fa-map-marker"></i>
										<div class="checkout_address_info">
											<p class="ng-binding"><span>${c.name}</span>&nbsp;&nbsp;&nbsp;<span>${c.telphone}</span></p>
											<p class="color_weak">${c.address}</p>
										</div>
									</li>
					 			</c:otherwise>
					 		</c:choose>
						</c:forEach> 

						<!-- 点击显示更多地址或者收起-->
						<a class="checkout_showmoreaddress" href="javascript:">收起<i
							class="fa fa-angle-up"></i></a>
					</ul>
				</div>
				<div style="clear: both"></div>
				<!-- 付款方式-->
				<div class="checkout_select">
					<h2 class="checkout_title">
						付款方式 <span class="checkout_pay_tip">推荐使用在线支付，不用找零，优惠更多</span>
					</h2>
					<ul class="">
						<li class="checkout_pay active ng_scope">
							<p>在线支付</p>
							<p class="color_mute">仅支持支付宝</p>
						</li>
						<div style="clear: both"></div>
					</ul>
				</div>
				<div style="clear: both"></div>
				<!--其他信息-->
				<div class="checkout_select">
					<h2>其他信息</h2>
					<div class="checkout_info">
						<span class="checkout-infolabel">配送方式</span> <span>本订单由<a
							href="javascript:">[饿了么]</a>提供配送
						</span>
					</div>
					<!-- 选择配送时间-->
					<div class="checkout_info">
						<span class="checkout-infolabel">送达时间</span>
						<div class="formselect">
							<span class="formselect-value firstVal">立即送达</span>
							<!--不同时间的选择-->
							<div class="formselect_data">
								<span class="formselect-value">立即送达</span> <span
									class="formselect-value">12:00</span> <span
									class="formselect-value">12:30</span> <span
									class="formselect-value">13:00</span> <span
									class="formselect-value">13:30</span> <span
									class="formselect-value">14:00</span> <span
									class="formselect-value">14:30</span> <span
									class="formselect-value">15:00</span>
							</div>
							<i class="fa fa-angle-down"></i>
						</div>

					</div>
					<!-- 备注-->
					<div class="checkout_info">
						<span class="checkout-infolabel">订单备注</span> <span> <input
							class="checkout_input">
						</span>
					</div>
					<!-- 确认下单-->
					<div>
						<button class="btn_order">确认下单</button>
					</div>
				</div>
			</div>
			<!-- 清除浮动-->
			<div style="clear: both"></div>
		</div>
		<!-- 清除浮动-->
		<div style="clear: both"></div>
	</div>


	<!--添加地址-->
	<div class="addressdialog"
		style="left: 373px; top: 131.5px; z-index: 1001;">
		<div class="addressdialog_close"></div>
		<div class="addressdialog_header">添加新地址</div>
		<div class="addressdialog_content">
			<div class="addressform">
				<div>
					<div class="addressformfield">
						<label>姓名</label><input placeholder="请输入您的姓名" id="name">
						<div class="addressformfield-hint"></div>
					</div>
					<!-- 性别栏-->
					<div class="addressformfield sexfield">
						<label>性别</label>
						<div>
							<input id="sexfield-1-male" name="sex" value="0" type="radio" class="sex">
							<label for="sexfield-1-male">先生</label> 
							<input id="sexfield-1-female" name="sex" value="1" type="radio" class="sex">
							<label for="sexfield-1-female">女士</label>
						</div>
						<div class="addressformfield-hint">
							<span></span>
						</div>
					</div>
					<!-- 位置-->
					<div class="addressformfield addressfield">
						<label>位置</label>
						<!--<img src="../image/orderInfo/local.png">-->
						<input placeholder="请输入小区、大厦或学校" id="city">
						<div class="address-suggestlist">
							<ul></ul>
						</div>
						<div class="addressformfield-hint">
							<span></span>
						</div>
						<div class="addressform-tip" style="display: none;">
							<p>
								<span>没找到你的地址？</span> <a style="display: none;">去地图看看吧！</a>
							</p>
							<p>请尝试只输入小区、大厦或学校看看。</p>
							<div class="arrow"></div>
						</div>
					</div>

					<!-- 详细地址-->
					<div class="addressformfield">
						<label>详细地址</label>
						<!--<img src="../image/orderInfo/local.png">-->
						<input placeholder="单元、门牌号" id="adress">
						<div class="address-suggestlist">
							<ul></ul>
						</div>
						<div class="addressformfield-hint">
							<span></span>
						</div>
					</div>

					<!-- 手机号-->
					<div class="addressformfield phonefield">
						<label>手机号</label>
						<!--<img src="../image/orderInfo/local.png">-->
						<input placeholder="请输入你的手机号码" id="telphone">
						<div class="address-suggestlist">
							<ul></ul>
						</div>
						<div class="addressformfield-hint">
							<span></span>
						</div>
					</div>

					<div class="addressform_buttons">
						<button id="saveAddress">保存</button>
						<button id="exit">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<!-- 底部确认订单-->
	<div class="checkout_quicksubmit" id="sroll_show">
		<div class="container">
			<span class="quick-text"> 应付金额 <span class="yen">¥</span> 
			<span class="num ng-binding"></span>
			</span>
			<button class="btn-stress btn-lg">确认下单</button>
		</div>
	</div>

</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#saveAddress").click(function(){
		var name = $("#name").val();
		var sex = $("input[name='sex']:checked").val();
		var city = $("#city").val();
		var adress = $("#adress").val();
		var telphone = $("#telphone").val();
		//请求的路径
		var url = "${pageContext.request.contextPath }/ordersServlet?method=insertConsignee";
		var param = {"name":name,"sex":sex,"location":city,"adress":adress,"telphone":telphone};
		$.post(
			url,
			param,
			function(){
				alert("回调成功");
				$(".addressdialog").hide();
				window.location.reload(true);
			});
		
	});
})
</script>
</html>