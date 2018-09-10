<%@page import="eleme.entity.Business"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>店铺界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sell-icon/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/basic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/seller.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/sell-shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font_6nzu1y9fx3o/iconfont.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath }/css/seller-evaluation.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font_le04b8lo41o/iconfont.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<!--头部导航栏-->
<div class="header">
    <div class="header-nav">
        <div class="nav">
            <ul>
                <h3>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="icon-logo" >
                        <i class="icon iconfont icon-changyonglogo40"></i>
                        <span>饿了么</span>
                    </a>

                </h3>
                <li>
                    <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/consigneeCtroller?method=queryRecentlyOrderInfo&url=recentlyorderpage">我的订单</a>
                </li>
                <li>
                    <a href="order.html">加盟合作</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="header-shop">
        <div class="header_inner">
            <!--左侧商家logo-->
            <div class="header_left" id="header-left">
                <img src="${pageContext.request.contextPath}/image/seller/shop-logo.jpg" alt="加载中">
                <div class="shopinfo" id="shopinfo">
                    <div class="shop_name">${business.bname}</div>
                    <div class="shop_evaluate">
                        <div id="star">(${business.months_amount})</div>
                    </div>
                </div>
            </div>
            <!--商家logo悬浮显示-->
            <div class="hid-shop" id="hid-shop">
                <ul>
                    <li class="shopguide-compete1">
                        <div class="guide-left">
                            <h3>${business.evaluation_score}</h3>
                            <p>综合评价</p>
                            <p>高于周边商家 <span>58.3%</span></p>
                        </div>
                        <div class="guide-right">
                            <p>服务态度${business.service_evaluation}分</p>
                            <p>菜品评价${business.good_evaluation}分</p>
                        </div>
                    </li>
                    <li class="shopguide-compete2">
                        <p>商家地址：${business.address}</p>
                        <p>营业时间：${business.business_hour }</p>
                    </li>
                    <li class="shopguide-compete3">
                        由<span>${business.bname}</span>提供配送服务
                    </li>
                </ul>
            </div>
            <!--配送信息-->
            <div class="header_right">
                <span class="distribution">
                    <em>起送价</em>
                    <em class="info">${business.offer_price}元</em>
                </span>
                <span class="distribution">
                    <em>配送费</em>
                    <em class="info">配送费￥${business.distribution_fee}</em>
                </span>
                <span class="distribution">
                    <em>平均送达时间</em>
                    <em class="info">${business.distribution_time}分钟</em>
                </span>
            </div>
            <c:if test="${business.collection == 1}" >
                <a class="favorite favorite-active">
                    <i class="icon iconfont icon-shoucang"></i>
                    <span class="scope">收藏</span>
                </a>
            </c:if>
            <c:if test="${business.collection == 0}">

            </c:if>
            <a class="um-favorite">
                <i class="icon iconfont icon-collection"></i>
                <span class="scope" >取消收藏</span>
            </a>
            <!-- <a class="favorite favorite-active">
                <i class="icon iconfont icon-shoucang"></i>
                <span class="scope">收藏</span>
            </a>
            <a class="um-favorite">
                <i class="icon iconfont icon-collection"></i>
                <span class="scope">取消收藏</span>
            </a> -->
        </div>
    </div>
</div>
<!--头部导航栏-->
<div class="main">
    <!--头部导航栏-->
    <div class="main_nav">
        <div class="nav_left">
            <a href="#" class="shopnav-tab">所有商品</a>
            <a href="#" class="shopnav-tab shop_line shopnav-tab-active">商品评价</a>
            <a href="#" class="shopnav-tab shop_line">商家资质</a>
            <span class="shopnav-filter">
                <a href="#" class="shop_line_active">默认排序</a>
                <a href="#" class="shop_line">评分
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
                <a href="#" class="shop_line">销量
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
                <a href="#" class="shop_line">价格
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
            </span>
        </div>
        <div class="nav_right">
            <form action="#" class="shopnav-search">
                <button class="search_btn">
                    <i class="icon iconfont icon-sousuo"></i>
                </button>
                <label for="globalsearch"></label>
                <input class="globalsearch" id="globalsearch" placeholder="搜索商家，美食..." >
            </form>
        </div>
    </div>
</div>
<!-- 评价内容 -->
<div class="container shopmain ">
    <div class="shopmenu">
        <!--导航栏-->
        <div class="shopmenu-nav" id="shopmenu-nav">
            <a class="evalBtn btn1 active" onclick="eval()">全部</a>
            <a class="evalBtn btn2" onclick="eval2()">满意</a>
            <a class="evalBtn btn3" onclick="eval3()">不满意</a>
        </div>
        <ul class="evaluation eval1">
        	<!-- <li class="evaluation-item">
        		<span class="user_img"></span>
        		<div class="eval-content">
        			<h4 class="eval-userName">少******北</h4>
        			<div class="eval-main">
        				<div class="eval-start">
        					<p class="rate-start">
        						<span class="icon">
        							<a class="iconfont icon-pingfenhui"></a>
        							<a class="iconfont icon-pingfenhui"></a>
        							<a class="iconfont icon-pingfenhui"></a>
        							<a class="iconfont icon-pingfenhui"></a>
        							<a class="iconfont icon-pingfenhui"></a>
        						</span>
        						<span class="rate-text">惊喜</span>
        					</p>
        				</div>
        			</div>
        			<div class="eval-food">
        				<span class="food-name">金沙安格斯厚牛堡套餐</span>
        				<div class="food-icon">
        					<p>
        						<span class="icon-item">
        							<a class="iconfont icon-pingjia"></a>
        							<a class="iconfont icon-pingjia"></a>
        							<a class="iconfont icon-pingjia"></a>
        							<a class="iconfont icon-pingjia"></a>
        							<a class="iconfont icon-pingjia"></a>
        						</span>
        						<span class="food-text">惊喜</span>
        					</p>
        				</div>
        			</div>
        			<span class="eval-time"></span>
        		</div>
        	</li> -->
        </ul>
        <ul class="evaluation eval2">
        </ul>
        <ul class="evaluation eval3">
        </ul>
    </div>

    <div class="shopmain-right">
        <div class="notice">商家公告</div>
        <div class="clear"></div>
        <div class="distribution">
            <ul>
                <h4>配费说明</h4>
                <p>配送费￥1</p>
            </ul>
        </div>
        <a class="report" href="#">举报商家</a>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //引入头文件
        $("#header").load("seller.html");

        //是否收藏
        $(".favorite").click(function () {
            $(this).hide();
            $(".um-favorite").show();
        });
        $(".um-favorite").click(function () {
            $(this).hide();
            $(".favorite").show();
        });

        //切换评分、销量、价格的颜色
        $(".shopnav-filter a").click(function () {
            $(this).addClass("shop_line_active");
            $(this).siblings().removeClass("shop_line_active");
        })

        //切换所有商品和评价
        $(".main .nav_left .shopnav-tab").click(function () {
            $(this).addClass("shopnav-tab-active");
            $(this).siblings("a.shopnav-tab").removeClass("shopnav-tab-active");
            var item = $(this).html();
            if(item=="所有商品"){
                location.href="${pageContext.request.contextPath}/business?method=getBusinessInfo&bid=${business.bid}";
            }
            if (item=="商品评价"){
                location.href="${pageContext.request.contextPath}/business?method=getEvaluation&bid=${business.bid}"
            }
        });
    })
    
    //获得商店名
    var shopName=$(".shop_name").html();
   //用ajax获得商店的所有评价数据，
    $.post(
		"${pageContext.request.contextPath}/evaluationServlet?method=getShopEvaluation",
    	"shopName=" + shopName,
    	function(result){
			$(".eval2").add($(".eval3")).css("display","none");
			var parsed = JSON.parse(result);
			for(var i = parsed.length-1; i < parsed.length; i--){
				//用户头像
				var img = $("<img>").attr("src","${pageContext.request.contextPath }/image/userImg.jpg")
				var userImg = $("<span></span>").addClass("user_img").append(img);
				//评价内容
				var userName = $("<h4></h4>").addClass("eval-userName").html(parsed[i].evaluation.username);//用户名
				//评价内容   1.2商家服务评价
				var pingfenhui1 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
				var pingfenhui2 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
				var pingfenhui3 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
				var pingfenhui4 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
				var pingfenhui5 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
				var icon = $("<span></span>").addClass("icon1").append(pingfenhui1,pingfenhui2,pingfenhui3,pingfenhui4,pingfenhui5);
				var rateText = $("<span></span>").addClass("rate-text");
				var rateStart = $("<p></p>").addClass("rate-start").append(icon,rateText);
				var evalStart = $("<div></div>").addClass("eval-start").append(rateStart);
				//送货时间
				var speedTime = $("<span></span>").html(parsed[i].evaluation.feeding_speed + "送达").addClass("speed-time");
				var serviceContent = $("<p></p>").html(parsed[i].evaluation.service_content).addClass("service-content");
				var evalMain = $("<div></div>").addClass("eval-main").append(evalStart,speedTime,serviceContent);
				//根据服务等级，点亮icon图标
				
				if(parsed[i].evaluation.service_evaluation == 5){
	
					pingfenhui1.css("color","red");
					pingfenhui2.css("color","red");
					pingfenhui3.css("color","red");
					pingfenhui4.css("color","red");
					pingfenhui5.css("color","red");
					rateText.html("惊喜").css("color","red");
				}else if(parsed[i].evaluation.service_evaluation == 4){
					pingfenhui1.css("color","red");
					pingfenhui2.css("color","red");
					pingfenhui3.css("color","red");
					pingfenhui4.css("color","red");
					rateText.html("满意").css("color","red");
				}else if(parsed[i].evaluation.service_evaluation == 3){
					pingfenhui1.css("color","red");
					pingfenhui2.css("color","red");
					pingfenhui3.css("color","red");
					rateText.html("一般").css("color","red");
				}else if(parsed[i].evaluation.service_evaluation == 2){
					pingfenhui1.css("color","red");
					pingfenhui2.css("color","red");
					rateText.html("失望").css("color","#999");
				}else{
					pingfenhui1.css("color","red");
					rateText.html("极差").css("color","#999");
				}
				var evaltime = $("<span></span>").addClass("eval-time").html(parsed[i].evaluation.evalDate);
				var evalContent = $("<div></div>").addClass("eval-content").append(userName,evalMain,evaltime);
				//商品评价
				for(var j = 0; j < parsed[i].evaluation.good_evaluation.length; j++){
					//商品名
					var foodName = $("<span></span>").addClass("food-name").html(parsed[i].gname[j]);
					//商品评分
					var font1 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
					var font2 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
					var font3 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
					var font4 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
					var font5 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia"); 
					var iconItem = $("<span></span>").addClass("icon-item").append(font1,font2,font3,font4,font5);
					var foodText = $("<span></span>").addClass("food-text");
					var p = $("<p></p>").append(iconItem,foodText);
					var foodIcon = $("<div></div>").addClass("food-icon").append(p);
					var evalFood = $("<div></div>").addClass("eval-food").append(foodName,foodIcon);
					evalContent.append(evalFood);
					//获得菜品的评分
					var num = parsed[i].evaluation.good_evaluation.charAt(j)+"";
					if(num == "5"){
						font1.css("color","red");
						font2.css("color","red");
						font3.css("color","red");
						font4.css("color","red");
						font5.css("color","red");
						foodText.html("惊喜").css("color","red");
					}else if(num == "4"){
						font1.css("color","red");
						font2.css("color","red");
						font3.css("color","red");
						font4.css("color","red");	
						foodText.html("满意").css("color","red");

					}else if(num == "3"){
						font1.css("color","red");
						font2.css("color","red");
						font3.css("color","red");
						foodText.html("一般").css("color","red");

					}else if(num == "2"){
						font1.css("color","red");
						font2.css("color","red");
						foodText.html("失望").css("color","#999");

					}else{
						font1.css("color","red");
						foodText.html("极差").css("color","#999");

					}
				}
				var li = $("<li></li>").addClass("evaluation-item").append(userImg,evalContent);
				$(".eval1").append(li);
			}    	
    	}
    	 
    	 
    )
    
    function eval(){
	$(".btn1").click(function(){
			$(this).nextAll().removeClass("active").end().addClass("active");
			$(".eval2").add($(".eval3")).css("display","none");
			$(".eval1").css("display","block");
			/* $(".evaluation").children("li").detach();
			  var shopName=$(".shop_name").html();
			   //用ajax获得商店的所有评价数据，
			    $.post(
					"${pageContext.request.contextPath}/evaluationServlet?method=getShopEvaluation",
			    	"shopName=" + shopName,
			    	function(result){
						var parsed = JSON.parse(result);
						for(var i = 0; i < parsed.length; i++){
							//用户头像
							var userImg = $("<span></span>").addClass("user_img");
							//评价内容
							var userName = $("<h4></h4>").addClass("eval-userName").html(parsed[i].evaluation.username);//用户名
							//评价内容   1.2商家服务评价
							var pingfenhui1 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var pingfenhui2 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var pingfenhui3 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var pingfenhui4 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var pingfenhui5 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var icon = $("<span></span>").addClass("icon").append(pingfenhui1,pingfenhui2,pingfenhui3,pingfenhui4,pingfenhui5);
							var rateText = $("<span></span>").addClass("rate-text");
							var rateStart = $("<p></p>").addClass("rate-start").append(icon,rateText);
							var evalStart = $("<div></div>").addClass("eval-start").append(rateStart);
							var evalMain = $("<div></div>").addClass("eval-main").append(evalStart);
							//根据服务等级，点亮icon图标
							
							if(parsed[i].evaluation.service_evaluation == 5){
				
								pingfenhui1.css("color","red");
								pingfenhui2.css("color","red");
								pingfenhui3.css("color","red");
								pingfenhui4.css("color","red");
								pingfenhui5.css("color","red");
								rateText.html("惊喜").css("color","red");
							}else if(parsed[i].evaluation.service_evaluation == 4){
								pingfenhui1.css("color","red");
								pingfenhui2.css("color","red");
								pingfenhui3.css("color","red");
								pingfenhui4.css("color","red");
								rateText.html("满意").css("color","red");
							}else if(parsed[i].evaluation.service_evaluation == 3){
								pingfenhui1.css("color","red");
								pingfenhui2.css("color","red");
								pingfenhui3.css("color","red");
								rateText.html("一般").css("color","red");
							}else if(parsed[i].evaluation.service_evaluation == 2){
								pingfenhui1.css("color","red");
								pingfenhui2.css("color","red");
								rateText.html("失望").css("color","#999");
							}else{
								pingfenhui1.css("color","red");
								rateText.html("极差").css("color","#999");
							}
							var evaltime = $("<span></span>").addClass("eval-time").html(parsed[i].evaluation.evalDate);
							var evalContent = $("<div></div>").addClass("eval-content").append(userName,evalMain,evaltime);
							//商品评价
							for(var j = 0; j < parsed[i].evaluation.good_evaluation.length; j++){
								//商品名
								var foodName = $("<span></span>").addClass("food-name").html(parsed[i].gname[j]);
								//商品评分
								var font1 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
								var font2 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
								var font3 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
								var font4 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
								var font5 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia"); 
								var iconItem = $("<span></span>").addClass("icon-item").append(font1,font2,font3,font4,font5);
								var foodText = $("<span></span>").addClass("food-text");
								var p = $("<p></p>").append(iconItem,foodText);
								var foodIcon = $("<div></div>").addClass("food-icon").append(p);
								var evalFood = $("<div></div>").addClass("eval-food").append(foodName,foodIcon);
								evalContent.append(evalFood);
								//获得菜品的评分
								var num = parsed[i].evaluation.good_evaluation.charAt(j)+"";
								if(num == "5"){
									font1.css("color","red");
									font2.css("color","red");
									font3.css("color","red");
									font4.css("color","red");
									font5.css("color","red");
									foodText.html("惊喜").css("color","red");
								}else if(num == "4"){
									font1.css("color","red");
									font2.css("color","red");
									font3.css("color","red");
									font4.css("color","red");	
									foodText.html("满意").css("color","red");

								}else if(num == "3"){
									font1.css("color","red");
									font2.css("color","red");
									font3.css("color","red");
									foodText.html("一般").css("color","red");

								}else if(num == "2"){
									font1.css("color","red");
									font2.css("color","red");
									foodText.html("失望").css("color","#999");

								}else{
									font1.css("color","red");
									foodText.html("极差").css("color","#999");

								}
							}
							var li = $("<li></li>").addClass("evaluation-item").append(userImg,evalContent);
							$(".evaluation").append(li);
						}    	
			    	}
			    	 
			    	 
			    )
		 */
	});
   }
   function eval2(){
	   $(".btn2").click(function(){
	 		 $(this).prev().removeClass("active").end().next().removeClass("active").end().addClass("active");

		 	if($(".eval2").children("li").length == 0){
		 		$(".eval1").add($(".eval3")).css("display","none");
				$(".eval2").css("display","block");
					var shopName=$(".shop_name").html();
					   //用ajax获得商店的满意评价数据，
					    $.post(
							"${pageContext.request.contextPath}/evaluationServlet?method=getSatisfaction",
					    	"shopName=" + shopName,
					    	function(result){
								var parsed = JSON.parse(result);
								for(var i = parsed.length-1; i < parsed.length; i--){
									//用户头像
									var img = $("<img>").attr("src","${pageContext.request.contextPath }/image/userImg.jpg")
									var userImg = $("<span></span>").addClass("user_img").append(img);									//评价内容
									var userName = $("<h4></h4>").addClass("eval-userName").html(parsed[i].evaluation.username);//用户名
									//评价内容   1.2商家服务评价
									var pingfenhui1 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
									var pingfenhui2 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
									var pingfenhui3 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
									var pingfenhui4 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
									var pingfenhui5 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
									var icon = $("<span></span>").addClass("icon1").append(pingfenhui1,pingfenhui2,pingfenhui3,pingfenhui4,pingfenhui5);
									var rateText = $("<span></span>").addClass("rate-text");
									var rateStart = $("<p></p>").addClass("rate-start").append(icon,rateText);
									var evalStart = $("<div></div>").addClass("eval-start").append(rateStart);
									var speedTime = $("<span></span>").html(parsed[i].evaluation.feeding_speed + "送达").addClass("speed-time");
									var serviceContent = $("<p></p>").html(parsed[i].evaluation.service_content).addClass("service-content");
									var evalMain = $("<div></div>").addClass("eval-main").append(evalStart,speedTime,serviceContent);
									//根据服务等级，点亮icon图标
									
									if(parsed[i].evaluation.service_evaluation == 5){
						
										pingfenhui1.css("color","red");
										pingfenhui2.css("color","red");
										pingfenhui3.css("color","red");
										pingfenhui4.css("color","red");
										pingfenhui5.css("color","red");
										rateText.html("惊喜").css("color","red");
									}else if(parsed[i].evaluation.service_evaluation == 4){
										pingfenhui1.css("color","red");
										pingfenhui2.css("color","red");
										pingfenhui3.css("color","red");
										pingfenhui4.css("color","red");
										rateText.html("满意").css("color","red");
									}else if(parsed[i].evaluation.service_evaluation == 3){
										pingfenhui1.css("color","red");
										pingfenhui2.css("color","red");
										pingfenhui3.css("color","red");
										rateText.html("一般").css("color","red");
									}else if(parsed[i].evaluation.service_evaluation == 2){
										pingfenhui1.css("color","red");
										pingfenhui2.css("color","red");
										rateText.html("失望").css("color","#999");
									}else{
										pingfenhui1.css("color","red");
										rateText.html("极差").css("color","#999");
									}
									var evaltime = $("<span></span>").addClass("eval-time").html(parsed[i].evaluation.evalDate);
									var evalContent = $("<div></div>").addClass("eval-content").append(userName,evalMain,evaltime);
									//商品评价
									for(var j = 0; j < parsed[i].evaluation.good_evaluation.length; j++){
										//商品名
										var foodName = $("<span></span>").addClass("food-name").html(parsed[i].gname[j]);
										//商品评分
										var font1 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
										var font2 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
										var font3 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
										var font4 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
										var font5 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia"); 
										var iconItem = $("<span></span>").addClass("icon-item").append(font1,font2,font3,font4,font5);
										var foodText = $("<span></span>").addClass("food-text");
										var p = $("<p></p>").append(iconItem,foodText);
										var foodIcon = $("<div></div>").addClass("food-icon").append(p);
										var evalFood = $("<div></div>").addClass("eval-food").append(foodName,foodIcon);
										evalContent.append(evalFood);
										//获得菜品的评分
										var num = parsed[i].evaluation.good_evaluation.charAt(j)+"";
										if(num == "5"){
											font1.css("color","red");
											font2.css("color","red");
											font3.css("color","red");
											font4.css("color","red");
											font5.css("color","red");
											foodText.html("惊喜").css("color","red");
										}else if(num == "4"){
											font1.css("color","red");
											font2.css("color","red");
											font3.css("color","red");
											font4.css("color","red");	
											foodText.html("满意").css("color","red");

										}else if(num == "3"){
											font1.css("color","red");
											font2.css("color","red");
											font3.css("color","red");
											foodText.html("一般").css("color","red");

										}else if(num == "2"){
											font1.css("color","red");
											font2.css("color","red");
											foodText.html("失望").css("color","#999");

										}else{
											font1.css("color","red");
											foodText.html("极差").css("color","#999");

										}
									}
									var li = $("<li></li>").addClass("evaluation-item").append(userImg,evalContent);
									$(".eval2").append(li);
								}    	
					    	}
					    	 
					    	 
					    ) 

		 	} else{
		 		$(".eval1").add($(".eval3")).css("display","none");
				$(".eval2").css("display","block");
		 	} 
		 });
			
	   }		
   
	   	
   
	function eval3(){
		$(".btn3").click(function(){
			$(this).prevAll().removeClass("active").end().addClass("active");
			if($(".eval3").children("li").length == 0){
				$(".eval2").add($(".eval1")).css("display","none");
				$(".eval3").css("display","block");
				var shopName=$(".shop_name").html();
				   //用ajax获得商店的不满意评价数据，
				    $.post(
						"${pageContext.request.contextPath}/evaluationServlet?method=getNoSatisfaction",
				    	"shopName=" + shopName,
				    	function(result){
							var parsed = JSON.parse(result);
							for(var i = parsed.length-1; i < parsed.length; i--){
								//用户头像
								var img = $("<img>").attr("src","${pageContext.request.contextPath }/image/userImg.jpg")
								var userImg = $("<span></span>").addClass("user_img").append(img);								//评价内容
								var userName = $("<h4></h4>").addClass("eval-userName").html(parsed[i].evaluation.username);//用户名
								//评价内容   1.2商家服务评价
								var pingfenhui1 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
								var pingfenhui2 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
								var pingfenhui3 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
								var pingfenhui4 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
								var pingfenhui5 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
								var icon = $("<span></span>").addClass("icon1").append(pingfenhui1,pingfenhui2,pingfenhui3,pingfenhui4,pingfenhui5);
								var rateText = $("<span></span>").addClass("rate-text");
								var rateStart = $("<p></p>").addClass("rate-start").append(icon,rateText);
								var evalStart = $("<div></div>").addClass("eval-start").append(rateStart);
								var speedTime = $("<span></span>").html(parsed[i].evaluation.feeding_speed + "送达").addClass("speed-time");
								var serviceContent = $("<p></p>").html(parsed[i].evaluation.service_content).addClass("service-content");
								var evalMain = $("<div></div>").addClass("eval-main").append(evalStart,speedTime,serviceContent);
								//根据服务等级，点亮icon图标
								
								if(parsed[i].evaluation.service_evaluation == 5){
					
									pingfenhui1.css("color","red");
									pingfenhui2.css("color","red");
									pingfenhui3.css("color","red");
									pingfenhui4.css("color","red");
									pingfenhui5.css("color","red");
									rateText.html("惊喜").css("color","red");
								}else if(parsed[i].evaluation.service_evaluation == 4){
									pingfenhui1.css("color","red");
									pingfenhui2.css("color","red");
									pingfenhui3.css("color","red");
									pingfenhui4.css("color","red");
									rateText.html("满意").css("color","red");
								}else if(parsed[i].evaluation.service_evaluation == 3){
									pingfenhui1.css("color","red");
									pingfenhui2.css("color","red");
									pingfenhui3.css("color","red");
									rateText.html("一般").css("color","red");
								}else if(parsed[i].evaluation.service_evaluation == 2){
									pingfenhui1.css("color","red");
									pingfenhui2.css("color","red");
									rateText.html("失望").css("color","#999");
								}else{
									pingfenhui1.css("color","red");
									rateText.html("极差").css("color","#999");
								}
								var evaltime = $("<span></span>").addClass("eval-time").html(parsed[i].evaluation.evalDate);
								var evalContent = $("<div></div>").addClass("eval-content").append(userName,evalMain,evaltime);
								//商品评价
								for(var j = 0; j < parsed[i].evaluation.good_evaluation.length; j++){
									//商品名
									var foodName = $("<span></span>").addClass("food-name").html(parsed[i].gname[j]);
									//商品评分
									var font1 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
									var font2 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
									var font3 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
									var font4 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
									var font5 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia"); 
									var iconItem = $("<span></span>").addClass("icon-item").append(font1,font2,font3,font4,font5);
									var foodText = $("<span></span>").addClass("food-text");
									var p = $("<p></p>").append(iconItem,foodText);
									var foodIcon = $("<div></div>").addClass("food-icon").append(p);
									var evalFood = $("<div></div>").addClass("eval-food").append(foodName,foodIcon);
									evalContent.append(evalFood);
									//获得菜品的评分
									var num = parsed[i].evaluation.good_evaluation.charAt(j)+"";
									if(num == "5"){
										font1.css("color","red");
										font2.css("color","red");
										font3.css("color","red");
										font4.css("color","red");
										font5.css("color","red");
										foodText.html("惊喜").css("color","red");
									}else if(num == "4"){
										font1.css("color","red");
										font2.css("color","red");
										font3.css("color","red");
										font4.css("color","red");	
										foodText.html("满意").css("color","red");

									}else if(num == "3"){
										font1.css("color","red");
										font2.css("color","red");
										font3.css("color","red");
										foodText.html("一般").css("color","red");

									}else if(num == "2"){
										font1.css("color","red");
										font2.css("color","red");
										foodText.html("失望").css("color","#999");

									}else{
										font1.css("color","red");
										foodText.html("极差").css("color","#999");

									}
								}
								var li = $("<li></li>").addClass("evaluation-item").append(userImg,evalContent);
								$(".eval3").append(li);
							}    	
				    	}
				    	 
				    	 
				    )
			}else{
				$(".eval2").add($(".eval1")).css("display","none");
				$(".eval3").css("display","block");
			}
		});
	}
	   
		
	
</script>
</body>

</html>