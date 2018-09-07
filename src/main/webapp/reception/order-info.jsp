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
			<i class="fa fa-angle-right"></i> <a href="${pageContext.request.contextPath }/business?method=getBusinessInfo&bid=18">麦徳乐炸鸡汉堡</a> <i
			class="fa fa-angle-right"></i> 订单消息
		</span>
		<!-- 登录用户信息-->
		<span class="top_bar_rigth"> <span id="username">${user.username } </span> 
		<span class="fa fa-angle-down fa_size"></span>
			<div class="dropbox topbar-profilebox-dropbox" id="dropbox">
				<a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserPersonCenterInfo"><i class="fa fa-user"></i>个人中心</a> <a
					href="${pageContext.request.contextPath }/consigneeCtroller?method=collectedBusinessInfo"><i class="fa fa-star"></i>我的收藏</a> <a
					href="${pageContext.request.contextPath }/consigneeCtroller?method=queryConsigneeInfo"><i class="fa fa-map-marker"></i>我的地址</a>
				<!--<a href="javascript:"><i class="fa fa-gear "></i>安全设置</a>-->
				<a href="${pageContext.request.contextPath }/ordersServlet?method=exitUser"><i class="fa fa-power-off"></i>退出登录</a>
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
						
							<!-- 遍历商品明细 -->
							<c:forEach items="${current_cart.map }" var="map">
				                <c:set var="gid" value="${map.key}"></c:set>
				                <c:set var="cartDetails" value="${map.value}"></c:set>
									<dd class="oder_car_box">
									<!--商品信息-->
										<div class="order_car_good" id="${cartDetails.goods.gid }">
											<!-- 单个商品信息 -->
											<div class="cell itemname ng-binding goodName">${cartDetails.goods.gname }</div>
											<!--选择数量-->
											<div class="cell itemquantity">
												<button id="sub_goodCount">-</button>
												<input class="oder_car_goodCount" value="${cartDetails.subCount}">
												<button id="add_goodCount">+</button>
											</div>
											<div class="cell itemtotal">
												￥<span class="good_money">${cartDetails.subTotal }</span>
											</div>
										</div>
							</c:forEach>
						
					</dl>
					<!--配送金额-->
					<ul>
						<li class="order_table_row extra">
							<div class="cell itemname">
								<span>配送费</span> <span class="fa fa-question-circle-o"></span>
							</div>
							<div class="cell itemquantity"></div>
							<div class="cell itemtotal">
								￥<span id="deliverfee">0</span>
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
						￥ <span class="num ng-binding" id="totalMoney">${current_cart.totalMoney }</span>
					</div>
					<!-- 商品总数量-->
					<div class="checkoutcart_totalextra">
						共<span class="ng-binding">${current_cart.totalCount }</span>份商品
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
										<span class="addrfinId" style="display: none;">${c.con_id }</span>
										<i class="checkout_address_icon fa fa-map-marker"></i>
										<div class="checkout_address_info">
											<p class="ng-binding"><span>${c.name}</span>&nbsp;&nbsp;&nbsp;<span>${c.telphone}</span></p>
											<p class="color_weak">${c.address}</p>
										</div>
										<div class="modify_addr">
											<a href="javascript:" class="modifyAddr">修改</a>
											<a href="javascript:" class="deleteAddr">×</a>
										</div>
									</li>
								</c:when>
					 			<c:otherwise>
						 			<li class="checkout_address ng-scope">
						 				<span class="addrfinId" style="display: none;">${c.con_id }</span>
										<i class="checkout_address_icon fa fa-map-marker"></i>
										<div class="checkout_address_info">
											<p class="ng-binding"><span>${c.name}</span>&nbsp;&nbsp;&nbsp;<span>${c.telphone}</span></p>
											<p class="color_weak">${c.address}</p>
										</div>
										<div class="modify_addr">
											<a href="javascript:" class="modifyAddr">修改</a>
											<a href="javascript:" class="deleteAddr">×</a>
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
						<li class="checkout_pay activ ng_scope">
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
	<div class="addressdialog" style="left: 373px; top: 131.5px; z-index: 1001;">
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
	<div class="checkout_quicksubmit" id="sroll_show" style="display: block;">
		<div class="container">
			<span class="quick-text"> 应付金额 <span class="yen">¥</span> 
			<span class="num ng-binding">${current_cart.totalMoney }</span>
			</span>
			<button class="btn-stress btn-lg">确认下单</button>
		</div>
	</div>


<div id="bgcolor" style="position: fixed;display:none; left: 0px; top: 0px; width: 100%; height: 100%; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; z-index: 1002;"></div>
	
	<div class="msgbox" style="left: 535.5px; top: 96px; z-index: 1001;">
		<div class="msgbox-close icon-close">×</div>
		<div class="msgbox-content">
			<div class="msgbox-status icon-dot-warning"></div>
			<div class="msgbox-title">确定删除送货地址？</div>
			<div class="msgbox-message"></div>
		</div>
		<div class="msgbox-btns">
			<button class="btn-primary btn-lg msgbox-confirm">确定</button>
			<button class="msgbox-cancel">取消</button>
		</div>
	</div>



</body>
<script type="text/javascript">
$(document).ready(function(){
	
	
	
	//点击确认支付,将当前订单传入servlet,然后请求跳转到支付页面,显示出支付页面
	$(".btn_order,.btn-stress").click(function(){
		//获得当前 的收货人id
		var $curr_con = $(".active").find("span").html();
		//获取备注
		var mark = $(".checkout_input").val();
		//获取送达时间
		//获取当前的订单总价
		var totalMoney = $("#totalMoney").val();
 		//请求的路径
 		window.location.href="${pageContext.request.contextPath }/payServlet?method=orderConfirm&conId="+$curr_con+"&totalMoney="+totalMoney+"&mark="+mark; 
 	});


    //添加地址
    $(".checkout_addaddress").click(function(){		
    	$(".addressdialog").find(".addressdialog_header").html("添加新地址");
		$(".addressdialog").show(500);
		$(".addressdialog").css("z-index",9999);
		$("#bgcolor").css("display","block");
		
		//点击保存地址,将数据保存到数据库
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
					$(".addressdialog").hide();
					window.location.reload(true);
				}
			);
		});
	});
    
    //关闭添加地址栏
    $(".addressdialog_close,#exit").click(function(){
        $(".addressdialog").hide();
        $("#bgcolor").css("display","none");
    });
	
	
	//点击删除,删除此地址
	var con_id;
	$(".deleteAddr").click(function(){
		con_id = $(this).parent().siblings(".addrfinId").text();
		$(".msgbox").toggle(500);
		$(".msgbox").css("z-index",9999);
		$("#bgcolor").css("display","block");

	});
	
	//点击关闭,隐藏删除地址栏
	$(".msgbox-close").click(function(){
		$(".msgbox").hide();
		$("#bgcolor").css("display","none");
	});
	
	$(".msgbox-cancel").click(function(){
		$(".msgbox").hide();
		$("#bgcolor").css("display","none");
	});

	//修改地址
	$(".modifyAddr").click(function(){
		con_id = $(this).parent().siblings(".addrfinId").text();
		$(".addressdialog").find(".addressdialog_header").html("编辑地址");
		$(".addressdialog").show(500);
		$(".addressdialog").css("z-index",9999);
		$("#bgcolor").css("display","block");
		
		
		
		$("#saveAddress").click(function(){
			//获取修改的地址值
			var name = $("#name").val();
			var sex = $("input[name='sex']:checked").val();
			var city = $("#city").val();
			var adress = $("#adress").val();
			var telphone = $("#telphone").val();
			//请求的路径
			var url = "${pageContext.request.contextPath }/ordersServlet?method=modifyConsignee";
			var param = {"con_id":con_id,"name":name,"sex":sex,"location":city,"adress":adress,"telphone":telphone};
			$.post(
				url,
				param,
				function(){
					$(".addressdialog").hide();
					window.location.reload(true);
				}
			);
		});
	});
	
	//确认删除地址
	$(".btn-primary").click(function(){
		var url = "${pageContext.request.contextPath }/ordersServlet?method=deleteConsignee";
		var param = {"conId":con_id};
		$.post(
			url,
			param,
			function(){
				$(".msgbox").hide();
				window.location.reload(true);
			});	
	});
	
	//获取浏览器滚动条
 	$(window).scroll(function(){
		var h = $(this).scrollTop();
		var payH = $(".btn_order").height();
		if(h<(payH+100)){
			$("#sroll_show").show();
		}
		if(h>(payH+100)){
			$("#sroll_show").hide();
	    }
		
	});
	 
	
	
	
})
</script>
</html>