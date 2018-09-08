<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>右边导航栏</title>
<!--导入jQuery文件-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<div class="sidebar">
    <!--右侧订单导航栏的选择部分-->
    <div class="sidebar-tabs">
        <div class="sidebar-tabs-up">
            <a href="/" class="fa fa-address-book">
                <div class="myOrd">我的订单</div>
            </a>
            <a id="up-cartbtn" class="fa fa-shopping-cart">
                购物车
            </a>
            <a class="fa fa-envelope-o" id="myMes">
                <div class="myMes">我的信息</div>
            </a>
        </div>
        <div class="sidebar-tabs-down">
            <div class="fa fa-qrcode">
                <a href="/" class="tabs-down-dropbox">
                    <img src="../image/header-1.png">
                    <p>下载手机应用</p>
                    <p class="p2">即可参加分享红包活动</p>
                </a>
            </div>
            <a href="" class="fa fa-hand-o-up">
                <div class="backTop" >回到顶部</div>
            </a>
        </div>
    </div>
    <!--右侧订单导航栏的内容部分-购物车有商品的时候-->
    <div class="sidebar-content-cart choice-right cart" id="sidebar-content-cart">
        <div class="content-cart">
            <div class="content-up">
                <a href="/">购物车</a>
                <span class="fa fa-angle-double-right" id="hide"></span>
            </div>
            <div class="content-center">
                <dl class="shop-one" id="shop-one">
                    <dt class="shop-one-up">
                        <span>1号购物车</span>
                        <a href="/">[清空]</a>
                    </dt>
                     <%--<dd class="shop-one-down">--%>
                        <%--<ul>--%>
                            <%--<li>--%>
                                <%--<div class="cuisine-name">超值套餐3</div>--%>
                                <%--<div class="cuisine-num">--%>
                                    <%--<span class="sub" id="sub">-</span>--%>
                                    <%--<input id="num" type="text" value="1">--%>
                                    <%--<span class="add" id="add">+</span>--%>
                                <%--</div>--%>
                                <%--<div class="cuisine-price" id="price">12</div>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</dd>--%>
                </dl>
            </div>
            <div class="content-down">
                <p>
                    共<span id="allNum">0</span>份,合计<span id="allPrice">0</span>
                </p>
                <button class="btn">去结算</button>
            </div>
        </div>
    </div>
    
    <!--右侧订单导航栏的内容部分-购物车没有商品的时候-->
    <div class="sidebar-content-cart choice-right empty_cart" id="sidebar-content-cart">
        <div class="content-cart">
            <div class="content-up">
                <a href="/">购物车</a>
                <span class="fa fa-angle-double-right" id="hide"></span>
            </div>
            <div class="cart_item">
            	<img alt="购物车" src="${pageContext.request.contextPath}/image/购物车.jpg">
                <h3>购物车空空如也</h3>
                <p>快去订餐吧，总有你心仪的美食</p>
            </div>
        </div>
    </div>
    
    
    <!--右侧订单导航栏的内容部分-我的信息-->
    <div class="sidebar-content-mes" id="sidebar-content-mes">
        <div class="content-cart">
            <div class="content-up">
                <a href="/">我的信息</a>
                <span class="fa fa-angle-double-right" id="hide2"></span>
            </div>
            <div class="mes-down">
                <i class="fa fa-envelope-o"></i>
                您没有新的消息哦
            </div>
        </div>
    </div>
</div>
<script>
    //右边导航栏-鼠标点击右边导航栏实现选项卡和显示和隐藏
    $("#up-cartbtn").click(function(){
        if($(".sidebar").hasClass("show")) {
            if($(this).hasClass("choice-left")){
                $(".sidebar").animate({
                    right:'-295'
                }).removeClass("show");
            }
        }else{
            $(".sidebar").animate({
                right:'0'
            }).addClass("show");
        }

        $(this).addClass("choice-left").siblings().removeClass("choice-left");
        $("#sidebar-contentop-cart").addClass("choice-right").siblings().removeClass("choice-right");
    });

    $("#myMes").click(function(){
        //判断有无被选中，有则显示右边导航栏
        if($(".sidebar").hasClass("show")) {
            if($(this).hasClass("choice-left")){
                $(".sidebar").animate({
                    right:'-295'
                }).removeClass("show");
            }
        }else{
            $(".sidebar").animate({
                right:'0'
            }).addClass("show");
        }

        $(this).addClass("choice-left").siblings().removeClass("choice-left");
        $("#sidebar-content-mes").addClass("choice-right").siblings().removeClass("choice-right");
    });

    //点击了body隐藏右边导航栏
    $(".sidebar").nextAll().click(function(){
        $(".sidebar").animate({
            right:'-295px'
        }).removeClass("show");
        $("#up-cartbtn").removeClass("choice-left");
        $("#myMes").removeClass("choice-left");
    });
    $(".header").click(function(){
        $(".sidebar").animate({
            right:'-295px'
        }).removeClass("show");
        $("#up-cartbtn").removeClass("choice-left");
        $("#myMes").removeClass("choice-left");
    });
    //点击了隐藏按钮隐藏右边导航栏
    $("#hide").click(function () {
        $(".sidebar").animate({
            right:'-295px'
        }).removeClass("show");
        $("#up-cartbtn").removeClass("choice-left");
        $("#myMes").removeClass("choice-left");
    });
    $("#hide2").click(function () {
        $(".sidebar").animate({
            right:'-295px'
        }).removeClass("show");
        $("#up-cartbtn").removeClass("choice-left");
        $("#myMes").removeClass("choice-left");
    });

    //实现购物车的显示
    $(function () {
        $.getJSON(
            "${pageContext.request.contextPath}/business?method=getCart",
            function (data) {
                if (data != null) {
                	//当前商家的bid不为空
                	$(".cart").show();
                	$.each(data.map,function(index,map){
                		$("#shop-one").append("<dd class=\"shop-one-down\">\n" +
                            "                        <ul>\n" +
                            "                            <li>\n" +
                            "                                <div class=\"cuisine-name\">"+map.goods.gname+"</div>\n" +
                            "                                <div class=\"cuisine-num\">\n" +
                            "                                    <span class=\"sub\">-</span>\n" +
                            "                                    <input id=\"num\" type=\"text\" value='"+map.subCount+"'>\n" +
                            "                                    <span class=\"add\">+</span>\n" +
                            "                                </div>\n" +
                            "                                <div class=\"cuisine-price\" title='"+map.goods.price+"'>"+map.subTotal+"</div>\n" +
                            "                            </li>\n" +
                            "                        </ul>\n" +
                            "                    </dd>");
                	});
                	$("#allNum").text(data.totalCount);
                	$("#allPrice").text(data.totalMoney);
                	$(".sub").click(function () {

                    });
				}else{
					//当前商家的bid为空
					$(".empty_cart").show();
				}
            }
        );
    })
</script>
</body>
</html>