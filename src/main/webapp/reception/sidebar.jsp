<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>右边导航栏</title>
<!--导入jQuery文件-->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <!--导入js文件-->
    <script src="${pageContext.request.contextPath }/js/sidebar.js"></script>
    <!--外部引入公共css样式-->
    <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/basic.css"> --%>
    <!--外部引入小图标css样式-->
    <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css"> --%>
    <!--外部引入头部私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/sidebar.css">
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
    <!--右侧订单导航栏的内容部分-购物车-->
    <div class="sidebar-content-cart choice-right" id="sidebar-content-cart">
        <div class="content-cart">
            <div class="content-up">
                <a href="/">购物车</a>
                <span class="fa fa-angle-double-right" id="hide"></span>
            </div>
            <div class="content-center">
                <dl class="shop-one">
                    <dt class="shop-one-up">
                        <span>1号购物车</span>
                        <a href="/">[清空]</a>
                    </dt>
                    <dd class="shop-one-down">
                        <ul>
                            <li>
                                <div class="cuisine-name">超值套餐3</div>
                                <div class="cuisine-num">
                                    <span class="sub" id="sub">-</span>
                                    <input id="num" type="text" value="1">
                                    <span class="add" id="add">+</span>
                                </div>
                                <div class="cuisine-price" id="price">12</div>
                            </li>
                        </ul>
                    </dd>
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
</body>
</html>